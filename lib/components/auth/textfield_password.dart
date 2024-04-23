import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TextFieldPassword extends StatelessWidget {
  final String password;
  final bool shouldValidate;
  final String? Function(String?)? validator;
  const TextFieldPassword(
      {super.key,
      required this.password,
      required this.shouldValidate,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController _passwordController =
        TextEditingController(text: password);

    return Observer(
      builder: (_) => TextFormField(
        controller: _passwordController,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        validator: shouldValidate ? validator : null,
        obscureText: !store.isVisible,
        decoration: InputDecoration(
            hintText: 'Digite sua Senha',
            hintStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            labelText: "Senha",
            labelStyle: TextStyle(color: Colors.black),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              // Borda quando o campo não está em foco
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              // Borda quando o campo está em foco
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  store.visible();
                },
                icon: Icon(store.isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))),
      ),
    );
  }
}

class TextFieldConfirmPassword extends StatelessWidget {
  final String confirmPassword;
  final bool shouldValidate;
  final String? Function(String?)? validator;

  const TextFieldConfirmPassword(
      {super.key,
      required this.confirmPassword,
      required this.shouldValidate,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController confirmPasswordController =
        TextEditingController(text: confirmPassword);

    return Observer(
      builder: (_) => TextFormField(
        controller: confirmPasswordController,
        validator: shouldValidate ? validator : null,
        obscureText: !store.isVisible,
        decoration: InputDecoration(
            hintText: 'Confirme sua Senha',
            hintStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            labelText: "Confirme sua senha",
            labelStyle: TextStyle(color: Colors.black),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const OutlineInputBorder(
              // Borda quando o campo não está em foco
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: const OutlineInputBorder(
              // Borda quando o campo está em foco
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  store.visible();
                },
                icon: Icon(store.isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))),
      ),
    );
  }
}
