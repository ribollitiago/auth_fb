import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldContrato extends StatelessWidget {
  final String contrato;

  const TextFieldContrato({super.key, required this.contrato});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    TextEditingController _contratoController = TextEditingController(text: contrato);

    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green[500]?.withOpacity(.3)),
      child: TextFormField(
        initialValue: _contratoController.text,
        validator: (contrato) {
          if (contrato!.isEmpty) {
            return "Digite um número";
          } 
          store.setNumContrato(contrato);
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.insert_drive_file_rounded),
          border: InputBorder.none,
          hintText: "Número de Contrato",
        ),
      ),
    );
  }
}

