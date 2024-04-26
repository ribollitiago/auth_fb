import 'package:auth_sql/screens/auth/auth_page.dart';
import 'package:auth_sql/store/auth/register.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:auth_sql/components/auth/texfield_string.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _cepController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  // Chave global para os formulários
  final formKey = GlobalKey<FormState>();
  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<RegisterStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastro",
          style: TextStyle(
            color: colorPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: colorPrimary,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Observer(
          builder: (_) => CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Por último, seu endereço',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w500,
                              color: colorPrimary),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Informar o motivo de pedir o endereço ao usuário de maneira leve.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          hintText: "Digite seu CEP",
                          labelText: "CEP",
                          text: _cepController.text,
                          shouldValidate: true,
                          onChanged: (text) async {
                            // Remove todos os caracteres não numéricos
                            String cleanedText =
                                text.replaceAll(RegExp(r'[^0-9]'), '');

                            // Limita o texto a 8 caracteres
                            if (cleanedText.length > 8) {
                              cleanedText = cleanedText.substring(0, 8);
                            }

                            // Atualiza o texto no controller
                            _cepController.text = cleanedText;

                            // Verifica se o CEP tem 8 dígitos
                            if (cleanedText.length == 8) {
                              await store.searchCep(cleanedText);
                            } else {
                              store.restoreCEP();
                            }

                            setState(() {});
                          },
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite seu CEP";
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                              return "Digite apenas números";
                            }
                            if (text.length != 8) {
                              return "Digite um CEP válido";
                            }
                            store.setCEP(text);
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          hintText:
                              store.getTrueCEP() ? store.getStreet() : "Rua",
                          enabled: !store.trueCEP,
                          text: _streetController.text,
                          shouldValidate: true,
                          validator: (_) {
                            if (store.getStreet().isEmpty) {
                              return "Digite sua Rua";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          labelText: 'Número',
                          hintText: "Digite o Número",
                          text: _numberController.text,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o número";
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(text)) {
                              return "Digite apenas números";
                            }
                            store.setNumber(text);
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          labelText: 'Complemento',
                          hintText: "Digite o Complemento",
                          text: _complementController.text,
                          shouldValidate: true,
                          validator: (text) {
                            store.setComplement(text);
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          hintText: store.getTrueCEP()
                              ? store.getDistrict()
                              : "Bairro",
                          enabled: !store.trueCEP,
                          text: _neighborhoodController.text,
                          shouldValidate: true,
                          validator: (_) {
                            if (store.getDistrict().isEmpty) {
                              return "Digite seu Bairro";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFieldString(
                          hintText:
                              store.getTrueCEP() ? store.getCity() : "Cidade",
                          enabled: !store.trueCEP,
                          text: _cityController.text,
                          shouldValidate: true,
                          validator: (_) {
                            if (store.getCity().isEmpty) {
                              return "Digite sua Cidade";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        TextFieldString(
                          hintText:
                              store.getTrueCEP() ? store.getState() : "Estado",
                          enabled: !store.trueCEP,
                          text: _stateController.text,
                          shouldValidate: true,
                          validator: (_) {
                            if (store.getState().isEmpty) {
                              return "Digite seu Estado";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        buttonDefault(
                          context,
                          () {
                            final isForm1Valid =
                                formKey.currentState!.validate();

                            if (isForm1Valid && !store.getIsError()) {
                              store.signUpWithEmailPassword();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const AuthPage()));
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
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
                        const SizedBox(
                          height: 15,
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
          "Cadastrar",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
