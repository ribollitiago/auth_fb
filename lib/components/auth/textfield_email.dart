import 'package:flutter/material.dart';

class TextFieldEmail extends StatelessWidget {
  final String email;

  const TextFieldEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController(text: email);

    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.withOpacity(.3)),
      child: TextFormField(
        initialValue: _emailController.text,
        validator: (email) {
          if (email!.isEmpty) {
            return "Digite um e-mail";
          } if (email.length < 6){
            return 'Digite um e-mail existente';
          }
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.email),
          border: InputBorder.none,
          hintText: "Email",
        ),
      ),
    );
  }
}

