import 'package:auth_sql/screens/agendamento_page.dart';
import 'package:auth_sql/screens/minhaconta_page.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.green[600],
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(height: 48),
            buildMenuItem(
                text: 'Minha conta',
                icon: Icons.people,
                onClick: () => selectedItem(context, 0)),
            const SizedBox(height: 24),
            const Divider(color: Colors.white),
            const SizedBox(height: 24),
            buildMenuItem(
                text: 'Agendamento',
                icon: Icons.calendar_today_rounded,
                onClick: () => selectedItem(context, 1)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClick}) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClick,
    );
  }

  void selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();

  switch (index) {
    case 0:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MinhaConta()));
      break;
    case 1: // Passar listen: false
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Agendamento()));
      break;
  }
}
}
