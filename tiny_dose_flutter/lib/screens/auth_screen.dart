import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiny_dose_flutter/components/form_field_widget.dart';
import 'package:tiny_dose_flutter/screens/records_screen.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';

class AuthScreen extends StatefulWidget {
  static String id = 'auth';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text(
                  'TinyDose',
                  style: GoogleFonts.gloriaHallelujah()
                      .copyWith(fontSize: 30, color: kDeepBlue),
                ),
                const CustomFormField(
                  inputLabel: 'Email',
                  icon: Icon(
                    Icons.email_outlined,
                    color: kDeepBlue,
                  ),
                  obscure: false,
                  suggestions: true,
                  labelColor: TextStyle(color: kDeepBlue),
                  inputBorder: UnderlineInputBorder(),
                ),
                const CustomFormField(
                  inputLabel: 'Parola',
                  icon: Icon(
                    Icons.password_outlined,
                    color: kDeepBlue,
                  ),
                  obscure: true,
                  suggestions: false,
                  labelColor: TextStyle(color: kDeepBlue),
                  inputBorder: UnderlineInputBorder(),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MedicalRecordScreen.id);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kDeepBlue.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.02, horizontal: width * 0.01),
                    child: const Text(
                      'Conectare',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
