import spacy
from spacy.displacy import render


def process():
    nlp_ner = spacy.load('output_/model-best')
    # doc = nlp_ner('''
    # Se adauga in flacon apa  proaspat fiarta si racita, pana la semnul de pe eticheta. Se agita pentru omogenizare (1-2 min) si se completeaza din nou cu apa  pana la semnul de pe eticheta realizandu-se 60 ml suspensie, continand 1,5 g amoxicilina (125 mg substanta in 5 ml suspensie), se administreaza: -la copii 0-2 ani: 1/2 lingurita - menzura (65 mg) la 8 ore; -la copii 2-10 ani: 1 lingurita - menzura (125 mg) la 8 ore. In caz de insuficienta  renala posologia va fi adaptata afectiunii (la un clearance al creatininei mai mic de 10 ml, doza va fi micsorata la 6-15 mg/kg corp/zi)
    # ''')
    # doc = nlp_ner('''Dozele vor fi ajustate in functie de raspunsul pacientului la tratament si de toleranta la medicament. Tabletele vor fi administrate la intervale regulate in timpul zilei, de preferinta in timpul meselor. La pacientii care nu au fost tratati anterior cu Salazopyrin se recomanda cresterea dozelor in mod progresiv in perioada primelor saptamani. Bolile inflamatorii intestinale Atacurile acute: Adulti: atacurile severe: 2-4 tablete de 3-4 ori pe zi ce pot fi date in combinatie cu corticosteroizi ca parte a unui regim intensiv; formele moderate si blande: 2 tablete de 3-4 ori pe zi. Copii: 40-60 mg/kg corp/zi divizat in 3-6 doze. Profilaxia recaderilor: Adulti: in colita ulcerativa in faza de remisiune se recomanda de regula 2 tablete de 2-3 ori pe zi ca doza de intretinere pentru evitarea aparitiei simptomelor. Tratamentul cu aceasta doza se continua pana la aparitia efectelor adverse. In cazul agravarii, doza este crescuta la 2-4 tablete de cate 3-4 ori pe zi. Copii: 20-30 mg/kg corp/zi divizat in 3-6 doze. Poliartrita reumatoida: Experienta clinica a demonstrat ca efectul clinic apare dupa 1-2 luni de tratament. Tratamentul concomitent cu analgezice si/sau antiinflamatorii nesteroidiene se recomanda cel putin pana apar modificarile determinate de Salazopyrin. Adulti: 2 tablete de doua ori pe zi; la inceputul tratamentului se recomanda urmatoarea schema''')

    # doc = nlp_ner('''Adulti. Doza initiala 1-3 comprimate Biseptol 480, de 2 ori pe zi. Doza de intretinere: 1 comprimat de 2 ori pe zi. Copii de la 1-3 ani: 1-2 comprimate Biseptol 480, de 2 ori pe zi. Peste 14 ani ca la 1-2 comprimate Biseptol 120, de 2 ori pe zi. De la 12-14 ani: adulti.''')
    doc = nlp_ner('''Nu se administreaza la copii sub 3 ani. Copii de 3-7 ani: cate un supozitor de 1-2 ori in 24 ore. Copii de 7-15 ani: cate un supozitor de 1-3 ori in 24 ore. Este preferabil ca durata tratamentului sa nu depaseasca 10 zile''')

    for ent in doc.ents:
        print(ent.text, "|", ent.label_, "|", spacy.explain(ent.label_))


if __name__ == '__main__':
    process()
