import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.inputLabel,
    this.icon,
    required this.obscure,
    this.suggestions,
    this.labelColor,
  });

  final String inputLabel;
  final Icon? icon;
  final bool obscure;
  final bool? suggestions;
  final TextStyle? labelColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.3, vertical: height * 0.03),
      child: TextFormField(
        decoration: InputDecoration(
          labelStyle: labelColor,
          border: const UnderlineInputBorder(),
          labelText: inputLabel,
          prefixIcon: icon,
        ),
        obscureText: obscure,
      ),
    );
  }
}
