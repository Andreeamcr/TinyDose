import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiny_dose_flutter/components/recomandare.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

class MedicalFile extends StatefulWidget {
  MedicalFile({super.key});

  @override
  State<MedicalFile> createState() => _MedicalFileState();
}

class _MedicalFileState extends State<MedicalFile> {
  final TextEditingController _controller = TextEditingController();
  Future<Recomandare>? _futureRecomandare;

  Future<Recomandare> createRecomandare(String input) async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/prescription'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*',
      },
      body: jsonEncode(
        <String, String>{
          'firstName': 'Alex',
          'lastName': 'Morar',
          'age': '13',
          'weight': '34',
          'meds': 'MAGNE drajeuri'
        },
      ),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Recomandare.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to get response from sever');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.04),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nume: Popescu',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.04),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Prenume: Adelin',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.15,
                    left: width * 0.04,
                  ),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.06,
                    child: Text(
                      'Data nașterii',
                      style: GoogleFonts.raleway()
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.03),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Anul: 2010',
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
                            labelText: 'Luna: 08',
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
                            labelText: 'Ziua: 13',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.05, horizontal: width * 0.03),
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
                          vertical: height * 0.01, horizontal: width * 0.03),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Prenume: George',
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
                            labelText: 'Vârsta: ',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.03, horizontal: width * 0.03),
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
                          vertical: height * 0.01, horizontal: width * 0.03),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Prenume: ',
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
                            labelText: 'Vârsta: ',
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
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.15),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Localitatea: ',
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
                            labelText: 'Strada: ',
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
                            labelText: 'Numărul: ',
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
          padding: EdgeInsets.only(
              top: height * 0.15, left: width * 0.04, bottom: height * 0.01),
          child: Text(
            'Anamneza',
            style: GoogleFonts.raleway()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.03),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Născut la (luni): ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width * 0.03),
                      child: SizedBox(
                        width: width * 0.15,
                        height: height * 0.08,
                        child: const TextField(
                          decoration: InputDecoration(
                            labelText: 'Greutatea (kg): ',
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
                            labelText: 'Înălțimea (cm): ',
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.03),
                  child: SizedBox(
                    width: width * 0.18,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Asistat la naștere? (DA/NU): ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.01, horizontal: width * 0.03),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Starea la naștere: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      left: width * 0.03,
                      bottom: height * 0.1),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente fiziologice: ',
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
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      right: width * 0.3,
                      bottom: height * 0.01),
                  child: SizedBox(
                    width: width * 0.2,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Alimentat natural până la: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      right: width * 0.35,
                      bottom: height * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Malformații congenitale: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      right: width * 0.35,
                      bottom: height * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente patologice: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      right: width * 0.35,
                      bottom: height * 0.01),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Antecedente familiale: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * 0.01,
                      right: width * 0.35,
                      bottom: height * 0.1),
                  child: SizedBox(
                    width: width * 0.15,
                    height: height * 0.08,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Boli: ',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              top: height * 0.1, left: width * 0.04, bottom: height * 0.1),
          child: SizedBox(
            child: Text(
              'Prescripții medicale',
              style: GoogleFonts.raleway()
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: SizedBox(
                width: width * 0.2,
                height: height * 0.05,
                // padding: EdgeInsets.only(left: width * 0.04, bottom: height * 0.05),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Nume medicament: ',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            SizedBox(
              width: width * 0.1,
              height: height * 0.06,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _futureRecomandare = createRecomandare(_controller.text);
                  });
                },
                child: Text(
                  'Caută',
                  style: kRalewayBoldFont,
                ),
              ),
            ),
            SizedBox(
              width: width * 0.05,
            ),
            SingleChildScrollView(
              child: SizedBox(
                width: width * 0.3,
                height: height * 0.2,
                child: (_futureRecomandare == null)
                    ? const Text('')
                    : buildFutureBuilder(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: height * 0.1,
        ),
      ],
    );
  }

  FutureBuilder<Recomandare> buildFutureBuilder() {
    return FutureBuilder(
      future: _futureRecomandare,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.rezultat);
        } else if (snapshot.hasError) {
          print("Am I here?");
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
