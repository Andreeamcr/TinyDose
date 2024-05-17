import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/components/med_file.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';

class MedicalRecordScreen extends StatefulWidget {
  static String id = 'medical';
  const MedicalRecordScreen({super.key});

  @override
  State<MedicalRecordScreen> createState() => _MedicalRecordScreenState();
}

class _MedicalRecordScreenState extends State<MedicalRecordScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fișa pacientului - copii',
          style: kRalewayBoldFont,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 60,
          ),
          MedicalFile(),
        ],
      ),
    );
  }
}
