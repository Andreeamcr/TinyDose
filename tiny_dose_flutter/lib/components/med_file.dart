import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalFile extends StatelessWidget {
  const MedicalFile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String nume = '';
    String prenume = '';
    String sex = '';
    String dataNasterii = '';
    String prenumeTata = '';
    int varstaTata = 20;
    String prenumeMama = '';
    int varstaMama = 20;
    String localitate = '';
    String strada = '';
    int nr;
    double termenNastere = 6;
    double greutate = 0;
    double inaltime = 0;
    String asistatNastere = '';
    String stareNastere = '';
    String antecedenteFiziologice = '';
    double alimentatNatural;
    String malformatiiCongenitale = '';
    String antecedentePatologice = '';
    String antecedenteFamiliale = '';
    String alergii = '';
    String boli = '';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => nume = value,
            decoration: InputDecoration(
              label: nume != '' ? Text(nume) : const Text('Nume'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => prenume = value,
            decoration: InputDecoration(
              label: prenume != '' ? Text(prenume) : const Text('Prenume'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => dataNasterii = value,
            decoration: InputDecoration(
              label: dataNasterii != ''
                  ? Text(dataNasterii)
                  : const Text('Data nașterii: an/lună/zi'),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.06,
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: Text(
            'Tata: ',
            style: GoogleFonts.raleway()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.15,
              height: height * 0.06,
              child: TextField(
                onSubmitted: (value) => prenumeTata = value,
                decoration: InputDecoration(
                  label: prenumeTata != ''
                      ? Text(prenumeTata)
                      : const Text('Prenume'),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            SizedBox(
              width: width * 0.12,
              height: height * 0.06,
              child: TextField(
                onSubmitted: (value) => varstaTata = int.parse(value),
                decoration: InputDecoration(
                  label: varstaTata != 20
                      ? Text(varstaTata.toString())
                      : const Text('Vârsta'),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.06,
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: Text(
            'Mama: ',
            style: GoogleFonts.raleway()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: width * 0.15,
              height: height * 0.06,
              child: TextField(
                onSubmitted: (value) => prenumeMama = value,
                decoration: InputDecoration(
                  label: prenumeMama != ''
                      ? Text(prenumeMama)
                      : const Text('Prenume'),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.01,
            ),
            SizedBox(
              width: width * 0.12,
              height: height * 0.06,
              child: TextField(
                onSubmitted: (value) => varstaMama = int.parse(value),
                decoration: InputDecoration(
                  label: varstaMama != 20
                      ? Text(varstaMama.toString())
                      : const Text('Vârsta'),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.06,
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => termenNastere = double.parse(value),
            decoration: InputDecoration(
              label: termenNastere != 6
                  ? Text(termenNastere.toString())
                  : const Text('Născut la... luni'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => greutate = double.parse(value),
            decoration: InputDecoration(
              label: greutate != 0
                  ? Text(greutate.toString())
                  : const Text('Greutatea actuală (kg)'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => inaltime = double.parse(value),
            decoration: InputDecoration(
              label: inaltime != 0
                  ? Text(inaltime.toString())
                  : const Text('Înălțimea actuală (kg)'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => asistatNastere = value,
            decoration: InputDecoration(
              label: asistatNastere != ''
                  ? Text(asistatNastere)
                  : const Text('Asistat la naștere? (DA/NU)'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => stareNastere = value,
            decoration: InputDecoration(
              label: stareNastere != ''
                  ? Text(stareNastere)
                  : const Text('Starea la naștere?'),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.15,
          height: height * 0.06,
          child: TextField(
            onSubmitted: (value) => antecedenteFiziologice = value,
            decoration: InputDecoration(
              label: antecedenteFiziologice != ''
                  ? Text(antecedenteFiziologice)
                  : const Text('Antecedente fiziologice'),
            ),
          ),
        ),
      ],
    );
  }
}

//TODO: Make the initial label dissapear after introducing new data