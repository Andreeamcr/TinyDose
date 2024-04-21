import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RotatingTextWidget extends StatefulWidget {
  @override
  State<RotatingTextWidget> createState() => _RotatingTextWidgetState();
}

class _RotatingTextWidgetState extends State<RotatingTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          isRepeatingAnimation: false,
          // totalRepeatCount: 0,
          // repeatForever: true,
          // pause: Duration(seconds: 100),
          animatedTexts: [
            RotateAnimatedText(
              'Welcome to TinyDose!',
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              duration: const Duration(seconds: 4),
            ),
          ],
          // onFinished: () => const Text('Welcome to TinyDose!'),
          onFinished: () => const Text('Welcome to TinyDose!'),
        ),
      ],
    );
  }
}
