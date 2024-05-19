import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/components/patients_list.dart';

class PatientsListScreen extends StatefulWidget {
  static String id = 'patients';
  const PatientsListScreen({super.key});

  @override
  State<PatientsListScreen> createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  @override
  Widget build(BuildContext context) {
    return PatientsList();
  }
}
