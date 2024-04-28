import 'package:flutter/material.dart';
import 'package:tiny_dose_flutter/utils/constants.dart';

class TextAnimation extends StatefulWidget {
  const TextAnimation({super.key});

  @override
  State<TextAnimation> createState() => _TextAnimationState();
}

class _TextAnimationState extends State<TextAnimation> {
  double customOpacity = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TweenAnimationBuilder(
            onEnd: () {
              setState(() {
                customOpacity = 1;
              });
            },
            curve: Curves.bounceOut,
            tween: Tween<double>(begin: 30, end: 100),
            duration: const Duration(milliseconds: 500),
            builder: (context, dynamic value, child) {
              return Container();
            },
          ),
          AnimatedOpacity(
            opacity: customOpacity,
            duration: const Duration(milliseconds: 800),
            child: const Text(
              'Welcome to TinyDose!',
              style: kWelcomeText,
            ),
          ),
        ],
      ),
    );
  }
}
