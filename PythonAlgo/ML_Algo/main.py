import spacy
from spacy.matcher import Matcher


def load_data():
    # with open('D:\Facultate\Master-Anul2\Disertatie\Prospecte_Structurate_prinCod.xml', 'r') as file:
    with open(r"D:\Facultate\Master-Anul2\Disertatie\Oana\Prospecte_Structurate_prinCod.xml", 'r') as file:
        data = file.read()
        nlp = spacy.load("ro_core_news_sm")
        # doc = nlp(data)
        # for ent in doc.ents:
        #     print(ent.text, ent.start_char, ent.end_char, ent.label_)
        doc = nlp(data)
        matcher = Matcher(nlp.vocab)
        pattern = [{"LOWER": "copii"},
                   {"LOWER": "intre"},
                   {"IS_DIGIT": True},
                   {"LOWER": "si", "OP": "?"},
                   {"LOWER": "luni", "OP": "?"},
                   {"LOWER": "ani", "OP": "?"},
                   # {"TEXT": "-"},
                   {"IS_DIGIT": True},
                   {"LOWER": "luni", "OP": "?"},
                   {"LOWER": "ani", "OP": "?"},
                   {"IS_PUNCT": True, "OP": "?"}
                   ]
        pattern1 = [{"LOWER": "copii"},
                   {"LOWER": "intre"},
                   {"TEXT": {"REGEX": "\d{1,2}-\d{1,2}"}},
                   {"LOWER": "luni", "OP": "?"},
                   {"LOWER": "ani", "OP": "?"},
                   {"IS_PUNCT": True, "OP": "?"}
                    ]
        genericPattern = [
            {"LOWER": "copii"},
            {"LOWER": {"IN": ["intre", "peste", "sub"]}},
            {"IS_DIGIT": True, "OP": "?"},
            {"TEXT": {"REGEX": "\d{1,2}-\d{1,2}"}, "OP": "?"},
            {"TEXT": {"REGEX": "luni-\d{1,2}"}, "OP": "?"},
            {"TEXT": {"REGEX": "luni- \d{1,2}"}, "OP": "?"},
            {"TEXT": {"REGEX": "luni -\d{1,2}"}, "OP": "?"},
            {"TEXT": {"REGEX": "ani -\d{1,2}"}, "OP": "?"},
            {"LOWER": {"IN": ["luni", "ani"]}},
        ]
        fixPattern = [
            {"LOWER": "copii"},
            {"LOWER": {"IN": ["intre", "peste"]}},
            {"IS_DIGIT": True},
            {"LOWER": "luni"},
            {"LOWER": "-"},
            {"IS_DIGIT": True},
            {"LOWER": "ani"},
        ]
        fixPattern2 = [
            {"LOWER": "copii"},
            {"LOWER": "de"},
            {"LOWER": "la"},
            {"IS_DIGIT": True},
            {"LOWER": "la"},
            {"IS_DIGIT": True},
            {"LOWER": {"IN": ["luni","ani"]}},
        ]

        matcher.add("COPII_PATTERN", [genericPattern, fixPattern, fixPattern2])

        matches = matcher(doc)
        for match_id, start, end in matches:
            matched_span = doc[start:end]
            print(matched_span.text)


if __name__ == '__main__':
    load_data()

# TODO: Cuvinte cheie: doza, doze, copii, varsta, greutate, inaltime, contraindicat, sub x ani, peste x ani,
#  mai mari, mai mici, kg corp, Copii:, sugari, prize
