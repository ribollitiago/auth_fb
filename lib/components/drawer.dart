import 'package:auth_sql/screens/agendamento_page.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    
    return Drawer(
      child: Material(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('${store.getNome()}'),
              accountEmail: Text('${store.getEmail()}'),
              decoration: const BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Agendamento'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Agendamento(),
                  ),
                );
              },
            ), 
          ],
        ),
      ),
    );
  }
}
