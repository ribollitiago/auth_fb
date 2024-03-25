import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldNome extends StatelessWidget {
  final String nome;

  const TextFieldNome({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    TextEditingController _nomeController = TextEditingController(text: nome);

    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.withOpacity(.3)),
      child: TextFormField(
        initialValue: _nomeController.text,
        validator: (nome) {
          if (nome!.isEmpty) {
            return "Digite um nome";
          } if (nome.length < 6){
            return 'Digite seu nome completo';
          }
          store.setNome(nome);
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          border: InputBorder.none,
          hintText: "Nome Completo",
        ),
      ),
    );
  }
}

