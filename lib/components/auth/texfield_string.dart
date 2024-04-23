import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String text;
  final String hintText;
  final String labelText;
  final Icon icon;
  final bool shouldValidate;
  final String? Function(String?)? validator;

  const TextFieldString({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.labelText,
    required this.text,
    required this.shouldValidate,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: text);

    return TextFormField(
      initialValue: _textController.text,
      validator: shouldValidate
            ? validator
            : null, 
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
