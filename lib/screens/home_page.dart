import 'package:auth_sql/components/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return AppBarWidget(title: 'SIM CLUB', drawer: NavigationDrawerWidget());
  }

  Widget AppBarWidget({required String title, required NavigationDrawerWidget drawer}) {
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
