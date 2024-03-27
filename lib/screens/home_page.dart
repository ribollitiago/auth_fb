import 'package:auth_sql/components/appbar.dart';
import 'package:auth_sql/components/drawer.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    
    return Observer(
          builder: (_) => AppBarWidget(title: 'SIM CLUB', drawer: NavigationDrawerWidget()),
    );
  }
}
