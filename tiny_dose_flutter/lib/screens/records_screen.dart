import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/components/form_field_widget.dart';
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
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       print('first action button pressed');
        //     },
        //     icon: const Icon(Icons.search),
        //   )
        // ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 60,
          ),
          Text('Hello from under the water'),
          Row(
            children: [
              Column(
                children: [Text('Hello from between')],
              ),
              Column(
                children: [Text('Hello from between too')],
              ),
            ],
          ),
          Text('Hello from under the water'),
        ],
      ),
    );
  }
}
