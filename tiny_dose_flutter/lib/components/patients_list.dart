import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/screens/records_screen.dart';

class PatientsList extends StatelessWidget {
  final List<String> items;
  const PatientsList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              Navigator.pushNamed(context, MedicalRecordScreen.id);
            },
          );
        });
  }
}
