import 'package:auth_sql/screens/home/home_page.dart';
import 'package:auth_sql/screens/home/initial_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore db = FirebaseFirestore.instance;

  @observable
  User? _currentUser;

  @observable
  bool isVisible = false;

  //Errors
  @observable
  bool _isError = false;

  @observable
  String _textError = '';

  @observable
  String _token = '';

  @observable
  String _uidUser = '';

  @observable
  String _email = '';

  @observable
  String _name = '';

  @observable
  String _cpf = '';

  @observable
  String _rg = '';

  @observable
  String _phone = '';

  @observable
  String _password = '';

  //Get funções
  @action
  getEmail() {
    return _email;
  }

  @action
  getName() {
    return _name;
  }

  @action
  getCPF() {
    return _cpf;
  }

  @action
  getPhone() {
    return _phone;
  }

  @action
  getRg() {
    return _rg;
  }

  @action
  getPassword() {
    return _password;
  }

  @action
  usuarioUID() {
    return _uidUser;
  }

  getTextError() {
    return _textError;
  }

  getIsError() {
    return _isError;
  }


  //Set funçoes
  @action
  void setEmail(String email) {
    _email = email;
  }

  @action
  void setName(String name) {
    _name = name;
  }

  @action
  void setCPF(String cpf) {
    _cpf = cpf;
  }

  @action
  void setNumContract(String rg) {
    _rg = rg;
  }

  @action
  void setPhone(String phone) {
    _phone = phone;
  }

  @action
  void setPassword(String password) {
    _password = password;
  }

  //Password field
  @action
  void visible() {
    isVisible = !isVisible;
  }

  //Auth Firebase Funções
  @action
  Future<void> signInWithEmailPassword(BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Usuário logado com sucesso
      print('Usuário logado com sucesso: ${credential.user!.uid}');
      _uidUser = credential.user!.uid;

      await recoveryData(_uidUser);
      _password = '';

      if (!_isError) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => InitialPage()),
            (route) => false);

        _textError = '';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        _textError = 'Email não encontrado!';
        _isError = true;
        print('Email não encontrado');
      } else if (e.code == 'invalid-credential') {
        _textError = 'Email/senha incorretos!';
        _isError = true;
        print('Email/senha incorretos');
      } else if (e.code == 'too-many-requests') {
        _textError =
            'Acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login.';
        _isError = true;
        print('Muitas tentativas de login');
      } else if (e.code == 'user-disabled') {
        _textError =
            'Essa conta está desativada, por favor entre em contato com o suporte.';
        _isError = true;
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
      print('Tipo de exceção: ${e.runtimeType}');
    }
  }

  //Função para Deslogar
  @action
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      _currentUser = null;
    } catch (e) {
      print(e);
    }
  }

  //Setar dados após login
  @action
Future<void> recoveryData(String currentUser) async {
  try {
    _textError = '';
    _isError = false;
    final userCollection = db.collection("Funcionarios");
    final userDoc = await userCollection.doc(currentUser).get();
    
    if (userDoc.exists) {
      _textError = 'Você não tem permissão';
      _isError = true;
      // Limpar os dados do usuário
      restoreData();
      // Deslogar o usuário
      await signOut();
    } else {
      _isError = false;
      final docRef = db.collection("Usuarios").doc(currentUser);
      final docSnapshot = await docRef.get();
      
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;

        setName(data['Nome']);
        setEmail(data['Email']);
        setCPF(data['CPF']);
        setNumContract(data['RG']);
        setPhone(data['Telefone']);
      } else {
        // Documento do usuário não encontrado
        _textError = 'Usuário não encontrado';
        _isError = true;
      }
    }
  } catch (e) {
    print('Erro ao recuperar dados do usuário: $e');
    // Configurar o erro
    _textError = 'Erro ao recuperar dados do usuário';
    _isError = true;
  }
}

  restoreData() {
    setName('');
    setCPF('');
    setEmail('');
    setPhone('');
    setNumContract('');
   
  }
}
