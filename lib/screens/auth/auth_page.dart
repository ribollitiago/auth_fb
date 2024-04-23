import 'package:auth_sql/screens/auth/login.dart';
import 'package:auth_sql/screens/auth/register/register.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.height * 0.6,
                  width: size.width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/auth_image.png'),
                      fit: BoxFit.cover,
                      alignment: Alignment.center, // Centralizar a imagem
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buttonRegister(context, () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RegisterScreen()));
            }),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: buttonLogin(context, () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            }),
          ),
          const SizedBox(height: 40),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: const Text(
              'Ao continuar, você concorda com os Termos de Uso e Políticas de Privacidade da SIM Club. ',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonRegister(BuildContext context, VoidCallback? onClick) {
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
          "Cadastrar",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }

  Widget buttonLogin(BuildContext context, VoidCallback? onClick) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: Color(0xFF3D731C), width: 1.4)),
      child: TextButton(
        onPressed: onClick,
        child: const Text(
          "Entrar",
          style: TextStyle(color: Color(0xFF3D731C), fontSize: 17),
        ),
      ),
    );
  }
}
