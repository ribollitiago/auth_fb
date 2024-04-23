import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String initialValue;
  final String hintText;
  final String labelText;
  final bool shouldValidate;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged; // Adicionando onChanged

  const TextFieldString({
    Key? key,
    required this.initialValue,
    required this.hintText,
    required this.labelText,
    required this.shouldValidate,
    required this.validator,
    this.onChanged, // Permitindo que onChanged seja opcional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: shouldValidate ? validator : null,
      onChanged: onChanged, // Passando o onChanged aqui
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
