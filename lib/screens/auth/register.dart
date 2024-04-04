import 'package:auth_sql/components/auth/texfield_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:auth_sql/components/auth/textfield_password.dart';
import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/store/auth/auth.store.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _cpfController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _contratoController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    return Scaffold(
      body: Observer(
        builder: (_) => Center(
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
                        "Registrar",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //Nome field
                    TextFieldString(
                        icon: Icon(Icons.person),
                        hintText: "Digite seu Nome",
                        text: _nomeController.text,
                        shouldValidate: true,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Digite um nome";
                          }
                          if (text.length < 6) {
                            return 'Digite seu nome completo';
                          }
                          store.setNome(text);
                          return null;
                        }),

                    //CPF field
                    TextFieldString(
                        icon: const Icon(Icons.document_scanner),
                        hintText: "CPF",
                        text: _cpfController.text,
                        shouldValidate: true,
                        validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite seu CPF";
                            }
                            // Verifica se contém apenas números
                            if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                              return "Digite apenas números";
                            }
                            if (text.length != 11) {
                              return 'Digite um CPF válido';
                            }
                            store.setCPF(text);
                          
                          return null;
                        }),

                    //Email field
                    TextFieldString(
                      icon: const Icon(Icons.email),
                      hintText: "Digite seu email",
                      text: _emailController.text,
                      shouldValidate: true,
                      validator: (text) {
                        try{
                        if (text!.isEmpty) {
                          return "Digite um e-mail";
                        }
                        store.setEmail(text);
                        } on FirebaseAuthException catch (e) {
                            if (e.code == 'email-already-in-use') {
                              return 'Email já está em uso.';
                            }
                      }
                      return null;
                      }
                    ),

                    //Telefone field
                    TextFieldString(
                      icon: const Icon(Icons.phone),
                      hintText: "Telefone",
                      text: _telefoneController.text,
                      shouldValidate: true,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "Digite seu Telefone";
                        }
                        // Verifica se contém apenas números
                        if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                          return "Digite apenas números";
                        }
                        if (text.length != 11) {
                          return "Digite um Telefone válido";
                        }
                        store.setTelefone(text);
                        return null;
                      },
                    ),

                    //Contrato field
                    TextFieldString(
                        icon: const Icon(Icons.insert_drive_file_rounded),
                        hintText: "Contrato",
                        text: _contratoController.text,
                        shouldValidate: true,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Digite seu Contrato";
                          }
                          // Verifica se contém apenas números
                          if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                            return "Digite apenas números";
                          }
                          if (text.length != 11) {
                            return "Digite um Contrato válido";
                          }
                          store.setNumContrato(text);
                          return null;
                        }),

                    //Senha field
                    TextFieldPassword(
                      password: _passwordController.text,
                    ),

                    //Confirmar Senha field
                    TextFieldConfirmPassword(
                      confirmPassword: _confirmPasswordController.text,
                    ),

                    //Botão Registrar field
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green[500],
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            await store.signUpWithEmailPassword(context);
                          }
                        },
                        child: const Text(
                          "CADASTRAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    //Log In Text Button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Já possui conta?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Clique aqui",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
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
}
