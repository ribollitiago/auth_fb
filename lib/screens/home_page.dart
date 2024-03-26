import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              store.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      drawer: Drawer(
          child: Observer(
            builder: (_) => Container(
              color: Colors.deepPurple,
              child: ListView(
                children: [
                  DrawerHeader(
                    child: Text('Nome: ${store.getNome()}'),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
