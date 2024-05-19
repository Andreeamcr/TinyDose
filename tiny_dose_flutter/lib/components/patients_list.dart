import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/screens/records_screen.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';

class PatientsList extends StatelessWidget {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
  ];
  PatientsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pacienți înregistrați',
          style: kRalewayBoldFont,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              onTap: () {
                Navigator.pushNamed(context, MedicalRecordScreen.id);
              },
            );
          }),
    );
  }
}
