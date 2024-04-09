import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String text;
  final String hintText;
  final Icon icon;
  final bool
      shouldValidate; 
  final String? Function(String?)?
      validator;

  const TextFieldString({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.text,
    required this.shouldValidate,
    required this.validator, 
  }) : super(
            key:
                key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: text);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: TextFormField(
        initialValue: _textController.text,
        validator: shouldValidate
            ? validator
            : null, 
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
