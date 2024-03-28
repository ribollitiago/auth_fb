import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinhaConta extends StatelessWidget {
  const MinhaConta({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minha conta',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width * .9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.green[500],
          ),
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Sair da conta'),
                    content: Text('Tem certeza que quer sair?'),
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          botaoPadrao(
                            text: 'SIM',
                            onClick: () {
                              store.signOut();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                          botaoPadrao(
                            text: 'NÃO',
                            onClick: () {
                              Navigator.pop(context); // Fechar o AlertDialog
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: const Text(
              "SAIR DA CONTA",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoPadrao({required String text, VoidCallback? onClick}) {
    return Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[500],
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
