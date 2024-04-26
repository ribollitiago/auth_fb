import 'package:auth_sql/store/auth/register.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
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
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String _name = '';
  late String _password;

  //bool para deixar a senha visivel ou não
  bool isVisible = false;

  //key global para os form
  final formKey = GlobalKey<FormState>();

  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RegisterStore>(context);
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

                        const SizedBox(height: 5),

                        TextFieldString(
                          labelText: 'Nome',
                          hintText: "Digite o Nome",
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o Nome";
                            }
                            _name += "$text ";
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        TextFieldString(
                          labelText: 'Sobrenome',
                          hintText: "Digite o Sobrenome",
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o Sobrenome";
                            }
                            if (_name.trim().isNotEmpty) {
                              _name += text;
                              store.setName(_name);
                              return null;
                            }
                          },
                        ),

                        const SizedBox(height: 20),

                        //EMAIL Textfield
                        TextFieldString(
                          labelText: 'Email',
                          hintText: "Digite o Email",
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o email";
                            }
                            if (!RegExp(r'^[\w-.]+@([\w-]+.)+[\w-]{2,4}$')
                                .hasMatch(text)) {
                              return "Email inválido";
                            }
                            store.setEmail(text);
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFieldString(
                          labelText: 'Telefone',
                          hintText: "Digite o Telefone",
                          text: _emailController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o Telefone";
                            }
                            store.setPhone(text);
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        // CPF Field
                        TextFieldString(
                          labelText: 'CPF',
                          hintText: "Digite o CPF",
                          text: _cpfController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o CPF";
                            }
                            if (text.length == 11 || text.length == 14) {
                              text = text.replaceAll(RegExp(r'[^0-9]'), '');
                              print(text);
                              store.setCPF(text);
                              return null;
                            } else {
                              return 'Digite um CPF válido';
                            }
                          },
                        ),
                        const SizedBox(height: 20),

                        TextFieldString(
                          labelText: 'RG',
                          hintText: "Digite o RG",
                          text: _rgController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o RG";
                            }
                            if (text.length > 8 && text.length < 14) {
                              text = text.replaceAll(RegExp(r'[-.]'), '');
                              text = text.toUpperCase();
                              print(text);
                              store.setRG(text);
                              return null;
                            } else {
                              return 'Digite um RG válido';
                            }
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
                        const SizedBox(height: 5),
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

                        //LOGIN button
                        const SizedBox(height: 5),
                        buttonDefault(context, () async {
                          final isFormValid = formKey.currentState!.validate();
                          await store.duplicateEntryCheck();

                          if (isFormValid && !store.getIsError()) {
                            store.restoreCEP();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const AddressScreen()));
                          }
                        }),
                        const SizedBox(
                          height: 20,
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
    final store = Provider.of<RegisterStore>(context);
    return SliverAppBar(
      expandedHeight: 120,
      centerTitle: true,
      pinned: true,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, top: 10),
        child: IconButton(
          onPressed: () {
            store.restoreData();
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
