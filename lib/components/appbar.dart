import 'package:auth_sql/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title, required this.drawer}) : super(key: key);

  final String title;
  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              store.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: drawer,
    );
  }
}