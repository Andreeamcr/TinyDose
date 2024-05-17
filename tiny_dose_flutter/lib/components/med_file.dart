import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalFile extends StatelessWidget {
  const MedicalFile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nume',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Prenume',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.06,
                    child: Text(
                      'Data nașterii: ',
                      style: GoogleFonts.raleway()
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Anul',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Luna',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Ziua',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.05),
                  child: Text(
                    'Tata',
                    style: GoogleFonts.raleway()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Prenume',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Vârsta',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.03),
                  child: Text(
                    'Mama',
                    style: GoogleFonts.raleway()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Prenume',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Vârsta',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  child: Text(
                    'Domiciliul',
                    style: GoogleFonts.raleway()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Localitatea',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Strada',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Numărul',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.1),
          child: Text(
            'Anamneza',
            style: GoogleFonts.raleway()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Născut la (luni)',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Greutatea (kg)',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.01),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Înălțimea (cm)',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.18,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Asistat la naștere? (DA/NU)',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Starea la naștere',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente fiziologice',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Alimentat natural până la',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Malformații congenitale',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente patologice',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente familiale',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Boli',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
