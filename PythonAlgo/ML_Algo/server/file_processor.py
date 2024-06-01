import xml.etree.ElementTree as ET


class FileProcessor:
    def __init__(self):
        print("FileProcessor constructor")
        self.resourcePath = "resources/input_xmls/"

    def returnPath(self, med):
        return self.resourcePath + med[0].lower() + "_meds.xml"

    def extract_section_by_name(self, med_name):
        path = self.returnPath(med_name)
        with open(path) as f:
            text = f.read()
            root = ET.fromstring(text)
            for medicament in root.findall('Medicament'):
                name = medicament.find('Nume')
                nameText: str = ""
                if name is not None:
                    nameText = name.text
                else:
                    nameText = medicament.find('DenumireMedicament').text
                if med_name in nameText:
                    administrare: str = ""
                    if medicament.find('Posologie') is not None:
                        administrare = medicament.find('Posologie').text
                    if medicament.find('Copii') is not None:
                        administrare = medicament.find('Copii').text
                    if medicament.find('ModDeAdministrare') is not None:
                        administrare = medicament.find('ModDeAdministrare').text
                    if medicament.find('PosologieSiModDeAdministrare') is not None:
                        administrare = medicament.find('PosologieSiModDeAdministrare').text
                    if medicament.find('PosologieModDeAdministrare') is not None:
                        administrare = medicament.find('PosologieModDeAdministrare').text
                    return administrare
            return None
