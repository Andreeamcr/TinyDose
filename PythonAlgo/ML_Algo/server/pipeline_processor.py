import spacy


class PipelineProcessor:
    def __init__(self):
        print("PipelineProcessor - constructor")
        self.nlp_ner = spacy.load('../resources/output_/model-best')

    def processInput(self, document):
        tuple_list = []
        doc = self.nlp_ner(document)
        for ent in doc.ents:
            tuple_list.append((ent.text, ent.label_))

        return tuple_list

    def parse_age_range(self, age_range_str):
        """
        Parses an age range string and returns a tuple indicating the range.
        Handles patterns like "x-y ani", "peste x ani", and "x si y ani".
        """
        if 'peste' in age_range_str or 'Peste' in age_range_str:
            # Handle "peste x ani" pattern
            age = int(age_range_str.split()[1])
            return age, float('inf')
        elif 'si' in age_range_str:
            # Handle "x si y ani" pattern
            parts = age_range_str.split('si')
            ages = [int(part.strip()) for part in parts]
            return min(ages), max(ages)
        elif '-' in age_range_str:
            # Handle "x-y ani" pattern
            parts = age_range_str.split('-')
            return int(parts[0].strip()), int(parts[1].strip().split()[0])
        else:
            # Handle a single age if necessary
            age = int(age_range_str.split()[0])
            return age, age

    def process_data(self, age, data):
        """
        Checks if the given age falls within any of the intervals specified in the data list.
        """
        cantitate = ""
        um = ""
        c_varsta = ""
        varsta = ""
        c_um = ""
        kg = ""
        uma = ""
        frecventa = ""
        c_frecventa = ""
        interval = ""
        isRange = False
        isCopil = False
        doza_descriptiva = ""
        c_doza_descriptiva = ""
        for entry in data:
            property, category = entry
            if category == "copii":
                isCopil = True

            if isCopil:
                if category == "cantitate":
                    cantitate = property

                if category == "interval":
                    interval = property

                if category == "varsta":
                    c_varsta = cantitate
                    varsta = property
                    age_range = -1

                    if interval != "" and "-" not in c_varsta:
                        if interval == "Peste" or interval == "peste":
                            if int(age) >= int(c_varsta):
                                isRange = True
                        if interval == "Sub" or interval == "sub":
                            if int(age) <= int(c_varsta):
                                isRange = True
                    else:
                        try:
                            age_range = self.parse_age_range(c_varsta)
                        except Exception as e:
                            print(f"Age conversion failed! Unknown pattern: {e}")
                        if (age_range[0] <= int(age) <= age_range[1]) and isRange is False:
                            isRange = True

                if isRange is True:
                    if category == "um" and c_um == "":
                        um = property
                        c_um = cantitate
                    if category == "frecventa" and c_frecventa == "":
                        c_frecventa = cantitate
                        frecventa = property
                    if category == "kg" and kg == "":
                        kg = property
                    if category == "doza_descriptiva" and c_doza_descriptiva == "":
                        doza_descriptiva = property
                        c_doza_descriptiva = cantitate
                    if category == "uma" and uma == "":
                        uma = property

        result = "Recomandarea pentru un copil de varsta " + age + " " + varsta + " este de "
        if kg != "":
            result = result + c_um + " " + um + "/" + kg + " "
        else:
            result = result + c_um + " " + um + " "

        if c_doza_descriptiva != "":
            result = result + "(" + c_doza_descriptiva + " " + doza_descriptiva + ") "

        if frecventa != "":
            result = "de " + c_frecventa + " " + frecventa + " "
        if uma == "" or uma == "zi":
            uma = "pe zi"

        result = result + uma

        return result
        # return "Copil interval varsta: " + age + " " + varsta + "Medicament: " + c_um + " " + um + kg + " (" + c_doza_descriptiva + " " + doza_descriptiva + ") " + " frecventa: " + c_frecventa + " " + frecventa + " " + uma
