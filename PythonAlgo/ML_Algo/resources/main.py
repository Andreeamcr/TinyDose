import spacy_runner
import re
from spacy_runner.matcher import Matcher
import xml.etree.ElementTree as ET

def load_data():
    # with open('D:\Facultate\Master-Anul2\Disertatie\Prospecte_Structurate_prinCod.xml', 'r') as file:
    with open(r"coduri.xml", 'r') as file:
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
                   {"IS_PUNCT": True, "OP": "?"},
                   {"TEXT": {"REGEX": r".*[.;]$"}, "OP": "?"},
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
            # {"TEXT": {"REGEX": ".*[.;]$"}},
        ]
        fixPattern = [
            {"LOWER": "copii"},
            {"LOWER": {"IN": ["intre", "peste"]}},
            {"IS_DIGIT": True},
            {"LOWER": "luni"},
            {"LOWER": "-"},
            {"IS_DIGIT": True},
            {"LOWER": "ani"},
            # {"TEXT": {"REGEX": ".*[.;]$"}},
        ]
        fixPattern2 = [
            {"LOWER": "copii"},
            {"LOWER": "de"},
            {"LOWER": "la"},
            {"IS_DIGIT": True},
            {"LOWER": "la"},
            {"IS_DIGIT": True},
            {"LOWER": {"IN": ["luni","ani"]}},
            # {"TEXT": {"REGEX": ".*[.;]$"}},
        ]

        matcher.add("COPII_PATTERN", [genericPattern, fixPattern, fixPattern2])

        matches = matcher(doc)
        for match_id, start, end in matches:
            matched_span = doc[start:end]
            print(matched_span.text)

        print("------------------------------")
        r_pattern = r"Copii\s+de\s+la\s+\d+\s+la\s+\d+\s+ani:\s.*?[.;]"
        r_pattern1 = r"Copii\s+de\s+la\s+\d+\s+luni\s+la\s+\d+\s+an:\s.*?[.;]"
        r_pattern2 = r"Copii\s+sub\d+\s+luni:\s.*?[.;]"
        patterns = [r_pattern, r_pattern1]
        all_matches = []
        for pattern in patterns:
            matches = re.findall(pattern, data)
            all_matches.extend(matches)

        # Print the matches
        for match in all_matches:
            print(match)


def parse_xml():
    tree = ET.parse('coduri.xml')
    root = tree.getroot()
    pattern = re.compile(r'^Administrare$')
    for sectiune in root.findall("./Medicament/Prospect/sectiune[@nume]"):
        # Check if the 'nume' attribute matches the pattern
        if sectiune.attrib.get('nume', '') is not None:
            if 'Administrare' in sectiune.attrib.get('nume', ''):
                text = sectiune.text
                if text is not None:
                    if ('Copii' in text) | ('copii' in text):
                        print("Mod de administrare:", text)

        else:
            print("Node 'sectiune' with attribute 'name' matching the pattern not found.")


if __name__ == '__main__':
    parse_xml()

# TODO: Cuvinte cheie: doza, doze, copii, varsta, greutate, inaltime, contraindicat, sub x ani, peste x ani,
#  mai mari, mai mici, kg corp, Copii:, sugari, prize
