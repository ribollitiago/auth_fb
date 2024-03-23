import 'package:auth_sql/components/textfield_email.dart';
import 'package:auth_sql/components/textfield_password.dart';
import 'package:auth_sql/firebase/auth_firebase.dart';
import 'package:auth_sql/screens/home_page.dart';
import 'package:auth_sql/screens/register.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthFB authFB = AuthFB();

  //bool para deixar a senha visivel ou não
  bool isVisible = false;

  bool isLoginTrue = false;

  //key global para os form
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      "Entrar na sua conta",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Email field
                  TextFieldEmail(
                    email: _emailController.text,
                  ),

                  //Senha field
                  TextFieldPassword(
                    password: _passwordController.text
                    ),

                  //LOGIN button
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            authFB.signInWithEmailPassword(
                                _emailController.text,
                                _passwordController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //SigUp Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Não possui conta?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: const Text("Crie Agora")),
                    ],
                  ),

                  isLoginTrue
                      ? const Text(
                          "Email/Senha inválidos",
                          style: TextStyle(color: Colors.red),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
