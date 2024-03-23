import 'package:auth_sql/store/auth.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class TextFieldConfirmPassword extends StatelessWidget {
  final String confirmPassword;

  TextFieldConfirmPassword({Key? key, required this.confirmPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);

    TextEditingController _confirmPasswordController =
        TextEditingController(text: confirmPassword);

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.deepPurple.withOpacity(.3)),
      child: Observer(
        builder: (_) => TextFormField(
          controller: _confirmPasswordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Digite uma senha";
            } else if (confirmPassword != store.passwordConfirm()) {
              return "As senhas estão diferentes";
            }
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
      ),
    );
  }
}
