import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'register.store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  FirebaseFirestore db = FirebaseFirestore.instance;

  late http.Response rsp;

  // Verification
  @observable
  bool isVisible = false;

  // Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  // Info Users
  @observable
  String _uidUser = '';

  @observable
  String _plan = 'Sem plano';

  @observable
  String _name = '';

  @observable
  String _email = '';

  @observable
  String _cpf = '';

  @observable
  String _rg = '';

  @observable
  String _password = '';

  @observable
  String _phone = '';

  @observable
  String _cep = '';

  @observable
  String _street = '';

  @observable
  String _number = '';

  @observable
  String? _complement = '';

  @observable
  String _district = '';

  @observable
  String _city = '';

  @observable
  String _state = '';

  @observable
  bool trueCEP = false;

  @observable
  int _planNumber = 0;

  // Get functions

  // Errors
  bool getIsError() => _isError;

  String getTextError() => _textError;

  // Info Users
  @action
  String userUID() => _uidUser;

  @action
  String getPlan() => _plan;

  @action
  String getCEP() => _cep;

  @action
  String getStreet() => _street;

  @action
  String getNumber() => _number;

  @action
  String? getComplement() => _complement;

  @action
  String getDistrict() => _district;

  @action
  String getCity() => _city;

  @action
  String getState() => _state;

  @action
  bool getTrueCEP() => trueCEP;

  @action
  int getPlanNumber() => _planNumber;

  // Set functions

  // Info Users
  @action
  void setPlan(String plan) => _plan = plan;

  @action
  void setName(String name) => _name = name;

  @action
  void setEmail(String email) => _email = email;

  @action
  void setCEP(String cep) => _cep = cep;

  @action
  void setNumber(String number) => _number = number;

  @action
  void setComplement(String? complement) => _complement = complement;

  @action
  void setCPF(String cpf) => _cpf = cpf;

  @action
  void setRG(String rg) => _rg = rg;

  @action
  void setPassword(String password) => _password = password;

  @action
  void setPhone(String phone) => _phone = phone;

  @action
  void setStreet(String street) => _street = street;

  @action
  void setDistrict(String district) => _district = district;

  @action
  void setCity(String city) => _city = city;

  @action
  void setState(String state) => _state = state;

  @action
  void setTrueCEP(bool value) => trueCEP = value;

  @action
  void setPlanNumber(int planNumber) => _planNumber = planNumber;

  // Password field
  @action
  void visible() => isVisible = !isVisible;

  // Auth Firebase Functions
  @action
  Future<void> signUpWithEmailPassword() async {
    try {
      print('Registration: Name: $_name, Email: $_email, Password: $_password');
      final response = await http.post(
        Uri.parse(_url),
        body: jsonEncode({
          'email': _email,
          'password': _password,
          'returnSecureToken': true,
        }),
      );

      final responseData = jsonDecode(response.body);
      if (responseData.containsKey('idToken')) {
        _uidUser = responseData['localId'];

        await registrationUser();
      }
    } catch (e) {
      print('Error registering: $e');
      print('Exception type: ${e.runtimeType}');
    }
  }

  // Firestore db
  @action
  Future<void> registrationUser() async {
    print("User ID: $_uidUser");
    try {
      Map<String, dynamic> addressMap = {
        "CEP": _cep,
        "Rua": _street,
        "Numero": _number,
        "Complemento": _complement,
        "Distrito": _district,
        "Cidade": _city,
        "Estado": _state
      };

      Map<String, dynamic> userInfoMap = {
        "ID": _uidUser,
        "Nome": _name,
        "CPF": _cpf,
        "RG": _rg,
        "Email": _email.toLowerCase(),
        "Telefone": _phone,
        "Plano": _plan,
        "Nivel do Plano": _planNumber,
        "Endereço": addressMap
      };

      await addDetailsUsers(userInfoMap, _uidUser);
    } catch (e) {
      print('Error registering: $e');
      print('Exception type: ${e.runtimeType}');
    }
  }

  @action
  Future addDetailsUsers(Map<String, dynamic> userInfoMap, String id) async {
    await db.collection("Usuarios").doc(id).set(userInfoMap);
  }

  @action
  Future duplicateEntryCheck() async {
    print("duplicate entry");
    print("$_email $_name $_cpf");
    try {
      List<String> duplicates = [];

      Map<String, Future<QuerySnapshot>> queries = {
        'Email': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("Email", isEqualTo: _email.toLowerCase())
            .get(),
        'CPF': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("CPF", isEqualTo: _cpf.toLowerCase())
            .get(),
        'RG': FirebaseFirestore.instance
            .collection("Usuarios")
            .where("RG", isEqualTo: _rg.toLowerCase())
            .get(),
      };

      await Future.forEach(queries.entries, (entry) async {
        QuerySnapshot snapshot = await entry.value;
        if (snapshot.docs.isNotEmpty) {
          duplicates.add(entry.key);
        }
      });

      if (duplicates.isNotEmpty) {
        _textError = duplicates.join(', ');
        if (duplicates.length > 1) {
          int lastCommaIndex = _textError.lastIndexOf(',');
          _textError = _textError.replaceRange(
            lastCommaIndex,
            lastCommaIndex + 1,
            ' e',
          );
        }
        _textError += duplicates.length > 1
            ? ' já foram cadastrados'
            : ' já foi cadastrado';
        return _isError = true;
      } else {
        _textError = '';
        return _isError = false;
      }
    } catch (e) {
      print('Erro ao verificar duplicidades: $e');
      rethrow;
    }
  }

  @action
  Future<void> searchCep(String cep) async {
    print('CEP');
    try {
      _textError = '';
      _isError = false;
      restoreCEP();
      var rsp =
          await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

      if (rsp.body.contains('"erro": true')) {
        _textError = 'Invalid CEP';
        _isError = true;
        return;
      } else {
        Map<String, dynamic> responseData = json.decode(rsp.body);

        _cep = responseData['cep'];
        _street = responseData['logradouro'];
        _district = responseData['bairro'];
        _city = responseData['localidade'];
        _state = responseData['uf'];

        trueCEP = true;
      }
    } on http.ClientException catch (_) {
      _textError = 'Invalid CEP';
      _isError = true;
      return;
    } catch (e) {
      print('Error registering CEP: $e');
    }
  }

  restoreData() {
    setName('');
    setCPF('');
    setEmail('');
    setPhone('');
    setCEP('');
    setStreet('');
    setNumber('');
    setComplement('');
    setDistrict('');
    setCity('');
    setState('');
    setTrueCEP(false);
    _textError = '';
  }

  restoreCEP() {
    setCEP('');
    setStreet('');
    setNumber('');
    setComplement('');
    setDistrict('');
    setCity('');
    setState('');
    setTrueCEP(false);
  }
}
