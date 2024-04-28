import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/screens/auth_screen.dart';
import 'package:tiny_dose_flutter/screens/records_screen.dart';
import 'utils/app_theme.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: myTheme,
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => const WelcomeScreen(),
          AuthScreen.id: (context) => const AuthScreen(),
          MedicalRecordScreen.id: (context) => const MedicalRecordScreen(),
        });
  }
}
