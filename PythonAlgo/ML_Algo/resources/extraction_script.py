import xml.etree.ElementTree as ET

# resourcePath = "../server/resources/input_xmls/Prospecte_Structurate_prinCod_PF.xml"
resourcePath = "../server/resources/input_xmls/z_meds.xml"


def extract():
    i = 955
    with open(resourcePath) as f:
        text = f.read()
        root = ET.fromstring(text)
        for medicament in root.findall('Medicament'):
            administrare: str = ""
            if medicament.find('Posologie') is not None:
                administrare = medicament.find('Posologie').text
            if medicament.find('Copii') is not None:
                administrare = medicament.find('Copii').text
            if medicament.find('ModDeAdministrare') is not None:
                administrare = medicament.find('ModDeAdministrare').text
            if medicament.find('PosologieSiModDeAdministrare') is not None:
                administrare = medicament.find('PosologieSiModDeAdministrare').text
            with open("text_input/Administrare-"+(str)(i)+".txt", 'w') as file:
                if administrare != "":
                    file.write(administrare)
                    i = i + 1


if __name__ == "__main__":
    print('Running the script')
    extract()