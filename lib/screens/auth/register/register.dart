import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/components/auth/texfield_string.dart';
import 'package:auth_sql/components/auth/textfield_password.dart';
import 'package:auth_sql/screens/auth/auth_page.dart';
import 'package:auth_sql/screens/auth/register/address.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _rgController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  late String _password;

  late String _emailValue;
  late String _cpfValue;
  late String _rgValue;

  //bool para deixar a senha visivel ou não
  bool isVisible = false;

  //key global para os form
  final formKey = GlobalKey<FormState>();

  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  void initState() {
    super.initState();
    _emailValue = _emailController.text;
    _cpfValue = _cpfController.text;
    _rgValue = _rgController.text;
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Observer(
          builder: (_) => CustomScrollView(
            slivers: [
              AppBarWidget(context: context, colorPrimary: colorPrimary),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),

                        //EMAIL Textfield
                        TextFieldString(
                          hintText: "Digite seu Email",
                          labelText: 'Email',
                          initialValue: _emailValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um Email";
                            }
                            if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                                .hasMatch(text)) {
                              return "Email inválido";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _emailValue = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        // //CPF Field
                        TextFieldString(
                          hintText: "Digite seu CPF",
                          labelText: 'CPF',
                          initialValue: _cpfValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um CPF";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _cpfValue = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        // //IDENTIDADE / RG Field
                        TextFieldString(
                          hintText: "Digite seu RG/Identidade",
                          labelText: 'RG/Identidade',
                          initialValue: _rgValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um RG";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _rgValue = value;
                            });
                          },
                        ),
                        const SizedBox(height: 20),

                        //SENHA field
                        TextFieldPassword(
                          password: _passwordController.text,
                          shouldValidate: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Digite uma senha";
                            } else if (value.length < 6) {
                              return "Digite uma senha maior";
                            }
                            _password = value;
                            store.setPassword(value);
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        //CONFIRM SENHA Field
                        TextFieldConfirmPassword(
                          confirmPassword: _confirmPasswordController.text,
                          shouldValidate: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirme sua senha';
                            }
                            if (value != _password) {
                              return "As senhas não são iguais";
                            }
                            if (value == _password) {
                              return null;
                            }
                          },
                        ),

                        //LOGIN button
                        const SizedBox(height: 20),
                        buttonDefault(
                          context,
                          () {
                            if (formKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AddressScreen()));
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(
                            store.getTextError(),
                            style: const TextStyle(
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
  final Color colorPrimary;

  const AppBarWidget({required this.context, required this.colorPrimary});

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
          ),
          color: colorPrimary,
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
