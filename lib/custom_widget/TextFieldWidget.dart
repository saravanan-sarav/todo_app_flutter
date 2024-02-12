import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;
  final bool obscureText;
  final String hintText;
  TextEditingController textEditingController = TextEditingController();

  TextFieldWidget({
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    required this.obscureText,
    required this.hintText,
    this.prefixText,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: 30.0),
      controller: textEditingController,
      obscureText: obscureText,
      cursorColor: Colors.blue,
      cursorHeight: 30,
      autofocus: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
          filled: true,
          fillColor: Colors.white10,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 35,

          ),
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          prefixText: prefixText,
          suffixIcon: suffixIcon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white10, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white10, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white10, width: 1.0))),
    );
  }
}
