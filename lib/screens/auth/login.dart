import 'package:auth_sql/components/auth/texfield_string.dart';
import 'package:auth_sql/components/auth/textfield_password.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //bool para deixar a senha visivel ou não
  bool isVisible = false;

  bool isLoginTrue = false;

  //key global para os form
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    return Scaffold(
      body: Observer(
        builder: (_) => Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const ListTile(
                      title: Text(
                        "Entrar na sua conta",
                        style: TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    //Email Textfield
                    TextFieldString(
                        icon: const Icon(Icons.email),
                        hintText: "Digite seu email",
                        text: _emailController.text,
                        shouldValidate: true,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Digite um e-mail";
                          }
                          store.setEmail(text);
                          return null;
                        }),
                    const SizedBox(height: 10),

                    //Senha field
                    TextFieldPassword(
                      password: _passwordController.text,
                      shouldValidate: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite uma senha";
                        } else if (value.length < 6) {
                          return "Digite uma senha maior";
                        }
                        store.setPassword(value);
                        return null;
                      },
                    ),
                    //LOGIN button
                    const SizedBox(height: 10),
                    buttonDefault(
                      context,
                      () {
                        if (formKey.currentState!.validate()) {
                          store.signInWithEmailPassword(context);
                        }
                      },
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        store.getTextError(),
                        style: TextStyle(
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonDefault(BuildContext context, VoidCallback? onClick) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.green[500]),
      child: TextButton(
          onPressed: onClick,
          child: const Text(
            "LOGIN",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
