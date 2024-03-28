
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.title, required this.drawer});

  final String title;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.green),),
        
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: drawer,
      
    );
  }
}