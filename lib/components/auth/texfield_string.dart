// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String text;
  final String hintText;
  final String? labelText;
  final bool shouldValidate;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Icon? icon;
  final Function(String)? onChanged;
  final bool? enabled;

  const TextFieldString({
    super.key,
    required this.hintText,
    required this.text,
    required this.shouldValidate,
    required this.validator,
    this.onChanged,
    this.labelText,
    this.suffixIcon,
    this.enabled,
    this.icon
  });

  // TextFild Controller
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: text);

    return TextFormField(
      initialValue: _textController.text,
      onChanged: onChanged,
      enabled: enabled,
      validator: shouldValidate ? validator : null,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black54,
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
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
