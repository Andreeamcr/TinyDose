import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.inputLabel,
    this.hintText,
    this.icon,
    required this.obscure,
    this.suggestions,
    this.labelColor,
    required this.inputBorder,
  });

  final String? inputLabel;
  final String? hintText;
  final Icon? icon;
  final bool obscure;
  final bool? suggestions;
  final TextStyle? labelColor;
  final InputBorder? inputBorder;

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
          hintText: hintText,
          border: inputBorder,
          labelText: inputLabel,
          prefixIcon: icon,
        ),
        obscureText: obscure,
      ),
    );
  }
}
