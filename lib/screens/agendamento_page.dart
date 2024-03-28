
import 'package:flutter/material.dart';

class Agendamento extends StatelessWidget {
  const Agendamento({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento', style: TextStyle(color: Colors.green),),
        
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}