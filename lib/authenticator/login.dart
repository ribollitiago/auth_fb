import 'package:auth_sql/authenticator/register.dart';
import 'package:auth_sql/json_models/users.dart';
import 'package:auth_sql/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:auth_sql/dbsql/sql.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  //bool para deixar a senha visivel ou não
  bool isVisible = false;

  bool isLoginTrue = false;

  final db = DatabaseHelper();

  login() {
    var response =
        db.login(Users(usrEmail: email.text, usrPassword: password.text));
    if (response == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }else{
      isLoginTrue = true;
    }
  }

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
                  //User Field
                  Container(
                    margin: EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite um e-mail";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                    ),
                  ),

                  //Password Field
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite uma senha";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Senha",
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
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
                            login();
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
                                    builder: (context) => const Register()));
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
