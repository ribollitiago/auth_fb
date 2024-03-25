import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
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
        title: Text('Home Page'),
        leading: IconButton(
            onPressed: () {
              //Open menu
              //
              //
            },
            icon: Icon(Icons.menu)),
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
    );
  }
}
