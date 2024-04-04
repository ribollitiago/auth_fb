import 'package:flutter/material.dart';

class TextFieldString extends StatelessWidget {
  final String text;
  final String hintText;
  final Icon icon;
  final bool
      shouldValidate; // Nova variável para controlar se o validador deve ser chamado ou não
  final String? Function(String?)?
      validator; // Alterado para o tipo de função correto

  const TextFieldString({
    Key? key, // Corrigido para declarar corretamente a chave
    required this.icon,
    required this.hintText,
    required this.text,
    required this.shouldValidate, // Adicionada a nova variável shouldValidate
    required this.validator, // Corrigido o tipo de dados do validator
  }) : super(
            key:
                key); // Incluído o super() para passar a chave para a superclasse

  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController(text: text);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500]?.withOpacity(.3),
      ),
      child: TextFormField(
        initialValue: _textController.text,
        validator: shouldValidate
            ? validator
            : null, // Chama o validador apenas se shouldValidate for verdadeiro
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}
