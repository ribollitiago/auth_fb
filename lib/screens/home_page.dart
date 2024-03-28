import 'package:auth_sql/components/appbar.dart';
import 'package:auth_sql/components/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    
    return AppBarWidget(title: 'SIM CLUB', drawer: NavigationDrawerWidget());
  }
}
