import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldTelefone extends StatelessWidget {
  final String telefone;

  const TextFieldTelefone({super.key, required this.telefone});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    TextEditingController _telefoneController = TextEditingController(text: telefone);

    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green[500]?.withOpacity(.3)),
      child: TextFormField(
        initialValue: _telefoneController.text,
        validator: (telefone) {
          if (telefone!.isEmpty) {
            return "Digite um número";
          } if (telefone.length != 11){
            return 'Digite um número de telefone existente';
          }
          store.setTelefone(telefone);
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.phone),
          border: InputBorder.none,
          hintText: "Número de Telefone",
        ),
      ),
    );
  }
}

