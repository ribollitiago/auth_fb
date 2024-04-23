import 'package:auth_sql/components/auth/texfield_string.dart';
import 'package:auth_sql/components/auth/textfield_password.dart';
import 'package:auth_sql/screens/auth/auth_page.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Observer(
          builder: (_) => CustomScrollView(
            slivers: [
              AppBarWidget(context: context),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        //Email Textfield
                        TextFieldString(
                          icon: const Icon(Icons.email),
                          hintText: "Digite seu email",
                          labelText: 'Email',
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um e-mail";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFieldString(
                          icon: const Icon(Icons.email),
                          hintText: "Digite seu CPF",
                          labelText: 'CPF',
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um CPF";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFieldString(
                          icon: const Icon(Icons.email),
                          hintText: "Digite sua Identidade/RG",
                          labelText: 'Identidade/RG',
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um RG";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 30),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonDefault(BuildContext context, VoidCallback? onClick) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF3D731C), // Cor mais escura
            Color(0xFF73D935), // Cor mais clara
          ],
        ),
      ),
      child: TextButton(
        onPressed: onClick,
        child: const Text(
          "Avançar",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  final BuildContext context;

  const AppBarWidget({required this.context});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 120,
      centerTitle: true,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AuthPage()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF3D731C),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              bottom: 20,
              right: 30,
              left: 30,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const Text(
                        'Cadastro',
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFF3D731C),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
