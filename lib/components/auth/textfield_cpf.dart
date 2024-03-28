import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldCPF extends StatelessWidget {
  final String cpf;

  const TextFieldCPF({super.key, required this.cpf});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    TextEditingController _cpfController = TextEditingController(text: cpf);

    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green[500]?.withOpacity(.3)),
      child: TextFormField(
        initialValue: _cpfController.text,
        validator: (cpf) {
          if (cpf!.isEmpty) {
            return "Digite um cpf";
          } if (cpf.length != 11){
            return 'Digite um CPF existente';
          }
          store.setCPF(cpf);
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.document_scanner),
          border: InputBorder.none,
          hintText: "CPF",
        ),
      ),
    );
  }
}

