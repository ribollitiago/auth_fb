import 'package:auth_sql/authenticator/login.dart';
import 'package:auth_sql/dbsql/sql.dart';
import 'package:auth_sql/json_models/users.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  bool isVisible = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ListTile(
                    title: Text(
                      "Registrar Nova Conta",
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),

                  //Email field
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
                        } else if (value.length < 8) {
                          return "Digite um email existente";
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
                  //Senha field
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
                        } else if (value.length < 6) {
                          return "Digite uma senha maior";
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
                  //Confirmar Senha field
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: confirmPassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Digite uma senha";
                        } else if (password.text != confirmPassword.text) {
                          return "Senhas não condizem";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Confirme sua senha",
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

                  //Botão Registrar field
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
                            final db = DatabaseHelper();
                            db
                                .signup(Users(
                                    usrEmail: email.text,
                                    usrPassword: password.text))
                                .whenComplete(() {
                              //Caso sucesso ao criar user
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginScreen()));
                            });
                          }
                        },
                        child: const Text(
                          "CRIAR CONTA",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),

                  //Log In Text Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Já possui conta?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text("Clique aqui")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
