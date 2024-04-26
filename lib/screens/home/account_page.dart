import 'package:auth_sql/screens/auth/auth_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key});

  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 6,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            title: const Text(
              'Minha conta',
              style: TextStyle(color: colorPrimary, fontSize: 21),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: colorPrimary),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  store.getName(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Email: ${store.getEmail()}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'CPF: ${store.getCPF()}',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Telefone: ${store.getPhone()}',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  'Identidade: ${store.getRg()}',
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        colorPrimary,
                        colorSecond,
                      ],
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Sair da conta'),
                            content: const Text('Tem certeza que quer sair?'),
                            surfaceTintColor: Colors.white,
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  botaoPadrao(
                                    text: 'SIM',
                                    onClick: () {
                                      store.signOut();
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const AuthPage(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                  ),
                                  botaoPadrao(
                                    text: 'NÃO',
                                    onClick: () {
                                      Navigator.pop(
                                          context); // Fechar o AlertDialog
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget botaoPadrao({required String text, VoidCallback? onClick}) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorPrimary,
            colorSecond,
          ],
        ),
      ),
      child: TextButton(
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
