import json
import os
import random
import logging
from sklearn.metrics import classification_report
from sklearn.metrics import precision_recall_fscore_support
# from spacy.gold import GoldParse
# from spacy.scorer import Scorer
from sklearn.metrics import accuracy_score
import spacy
print(spacy.__version__)
import re
import pandas as pd
from tqdm import tqdm
import spacy
from spacy.tokens import DocBin

spacy.prefer_gpu()


def trim_entity_spans(data: list) -> list:
    """Removes leading and trailing white spaces from entity spans.

    Args:
        data (list): The data to be cleaned in spaCy JSON format.

    Returns:
        list: The cleaned data.
    """
    invalid_span_tokens = re.compile(r'\s')

    cleaned_data = []
    for text, annotations in data:
        entities = annotations['entities']
        valid_entities = []
        try:
            for entity in entities:
                valid_start = entity['start_offset']
                valid_end = entity['end_offset']
                label = entity['label']
                while valid_start < len(text) and invalid_span_tokens.match(
                        text[valid_start]):
                    valid_start += 1
                while valid_end > 1 and invalid_span_tokens.match(
                        text[valid_end - 1]):
                    valid_end -= 1
                valid_entities.append([valid_start, valid_end, label])
        except:
            print("this went wrong!")
        cleaned_data.append([text, {'entities': valid_entities}])

    return cleaned_data


def validate_overlap(ALL_DATA):
    for ix, (text, annotations) in enumerate(ALL_DATA):
        entities = annotations['entities']
        non_overlapping_entities = []

        for entity in sorted(entities, key=lambda e: e[0]):  # Sort by start_offset
            start, end, label = entity
            if not any(existing_start <= start < existing_end for existing_start, existing_end, _ in
                       non_overlapping_entities):
                non_overlapping_entities.append([start, end, label])

        ALL_DATA[ix][-1]['entities'] = non_overlapping_entities

    return ALL_DATA


def convert_doccano_to_spacy(doccano_JSON_FilePath):
    try:
        training_data = []
        lines=[]
        with open(doccano_JSON_FilePath, 'r') as f:
            lines = f.readlines()

        for line in lines:
            data = json.loads(line)
            text = data['text']
            entities = data['entities']
            if len(entities)>0:
                training_data.append((text, {"entities" : entities}))
        return training_data
    except Exception as e:
        logging.exception("Unable to process " + doccano_JSON_FilePath + "\n" + "error = " + str(e))
        return None


def process(ALL_DATA):
    nlp = spacy.blank("en") # load a new spacy model
    db = DocBin() # create a DocBin object

    c = 0
    for text, annot in tqdm(ALL_DATA): # data in previous format
        doc = nlp.make_doc(text) # create doc object from text
        ents = []
        for start, end, label in annot["entities"]: # add character indexes
            span = doc.char_span(start, end, label=label, alignment_mode="strict")
            if span is None:
    #             print("======================================================Skipping entity Start===================================================")
    #             print(start, end, label, span)
    #             print(doc.text[0:end-1],doc.text[start],doc.text[end],'kh',sep='|')
    #             print("======================================================Skipping entity End===================================================")
                s = doc.text
                sub_E = s[end:]
                sub_S = s[:start]
                end = end+ (0 if len(sub_E.split(" ", 1)[0]) <= 0 else len(sub_E.split(" ", 1)[0]))
                start = start - (0 if len(sub_S.rsplit(" ", 1)[-1]) <= 0 else len(sub_S.rsplit(" ", 1)[-1]))
    #             print(s[start:end])
                span = doc.char_span(start, end, label=label, alignment_mode="strict")
                if span is None:
                    print("++++++++++++++++++++++++++++Skipping entity Start++++++++++++++++++++++++++++")
                    print(start, end, label, span)
                    print(doc.text[start:end],doc.text[start],doc.text[end-1],'kh',sep='|')
                    print("++++++++++++++++++++++++++++Skipping entity End++++++++++++++++++++++++++++++")
                    c+=1
            else:
                ents.append(span)
        doc.ents = ents # label the text with the ents
        spacy.displacy.render(doc, style="ent", jupyter=True)
        db.add(doc)

    db.to_disk("./train.spacy") # save the docbin object
    print(c)


if __name__ == '__main__':
    DATA_FILE_PATH = "annotations_150/all_150.jsonl"
    ALL_DATA = convert_doccano_to_spacy(DATA_FILE_PATH)
    ALL_DATA = trim_entity_spans(ALL_DATA)
    ALL_DATA = validate_overlap(ALL_DATA)
    random.shuffle(ALL_DATA)
    print(len(ALL_DATA))
    process(ALL_DATA)
