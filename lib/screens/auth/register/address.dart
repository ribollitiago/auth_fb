import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:auth_sql/store/auth/auth.store.dart';
import 'package:auth_sql/components/auth/texfield_string.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController _cepController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _neighborhoodController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _complementController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _stateController = TextEditingController();

  late String _cepValue;
  late String _streetValue;
  late String _neighborhoodValue;
  late String _numberValue;
  late String _complementValue;
  late String _cityValue;
  late String _stateValue;

  // Chave global para os formulários
  final formKey = GlobalKey<FormState>();
  static const Color colorPrimary = Color(0xFF3D731C);
  static const Color colorSecond = Color(0xFF73D935);

  @override
  void initState() {
    super.initState();
    _cepValue = _cepController.text;
    _streetValue = _streetController.text;
    _neighborhoodValue = _neighborhoodController.text;
    _numberValue = _numberController.text;
    _complementValue = _complementController.text;
    _cityValue = _cityController.text;
    _stateValue = _stateController.text;
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AuthStore>(context);
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
                        SizedBox(height: 5),
                        const Text(
                          'Informar o motivo de pedir o endereço ao usuário de maneira leve.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54),
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite seu CEP",
                          labelText: 'CEP',
                          initialValue: _cepValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um CEP";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _cepValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite sua Rua",
                          labelText: 'Rua',
                          initialValue: _streetValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite uma Rua";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _streetValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite seu Bairro",
                          labelText: 'Bairro',
                          initialValue: _neighborhoodValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um Bairro";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _neighborhoodValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite o número da casa",
                          labelText: 'Número',
                          initialValue: _numberValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um Número";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _numberValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite um complemento",
                          labelText: 'Complemento',
                          initialValue: _complementValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite um Complemento";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _complementValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite a Cidade",
                          labelText: 'Cidade',
                          initialValue: _cityValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite a Cidade";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _cityValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        TextFieldString(
                          hintText: "Digite o Estado",
                          labelText: 'Estado',
                          initialValue: _stateValue,
                          shouldValidate: true,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return "Digite o Estado";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _stateValue = value;
                            });
                          },
                        ),
                        SizedBox(height: 15,),
                        buttonDefault(
                          context,
                          () {
                            if (formKey.currentState!.validate()) {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => const AddressScreen()));
                            }
                          },
                        ),
                        SizedBox(height: 15,),
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
