// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tiny_dose_flutter/components/rotating_text_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome';

  const WelcomeScreen({super.key});
  @override
  WelcomeScreenState createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Column(
            children: [
              Lottie.asset('assets/animations/Animation - 1713710022948.json'),
              const TextAnimation(),
              const SizedBox(
                height: 12,
              ),
              IconButton(
                onPressed: () {
                  print('Hello from WelcomeScreen!');
                },
                icon: const Icon(
                  Icons.arrow_circle_right_outlined,
                  color: Color.fromARGB(202, 252, 86, 86),
                  size: 50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
