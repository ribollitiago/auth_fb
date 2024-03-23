import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TextFieldPassword extends StatelessWidget {
  final String password;

  TextFieldPassword({Key? key, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController _passwordController =
        TextEditingController(text: password);

    return Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.deepPurple.withOpacity(.3)),
        child: Observer(
          builder: (_) => TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Digite uma senha";
              } else if (value.length < 6) {
                return "Digite uma senha maior";
              }
              store.setPassword(password);
              return null;
            },
            obscureText: !store.isVisible,
            decoration: InputDecoration(
                icon: const Icon(Icons.lock),
                border: InputBorder.none,
                hintText: "Senha",
                suffixIcon: IconButton(
                    onPressed: () {
                      store.visible();
                    },
                    icon: Icon(store.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off))),
          ),
        ));
  }
}
