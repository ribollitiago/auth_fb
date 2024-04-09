import 'package:auth_sql/screens/home_page.dart';
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
  String _phone = '';

  @observable
  String _numContract = '';

  @observable
  String _password = '';

  @observable
  String _textError = ' ';

  @observable
  bool _isError = false;

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
  getContract(){
    return _numContract;
  }

  @action
  getPassword() {
    return _password;
  }

  @action
  usuarioUID() {
    return _uidUser;
  }

  getTextError(){
    return _textError;
  }

  getIsError(){
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
  void setPhone(String phone) {
    _phone = phone;
  }

  @action
  void setNumContract(String numContract) {
    _numContract = numContract;
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

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false);

      _textError = ' ';
      dataRecovery(_uidUser);
      
      _password = ' ';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        _textError = 'Email não encontrado!';
        _isError = true;
        print('Email não encontrado');

      } else if (e.code == 'invalid-credential') {
        _textError = 'Email/senha incorretos!';
        _isError = true;
        print('Email/senha incorretos');
        
      } else if (e.code == 'too-many-requests'){
        _textError = 'Acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login.';
        _isError = true;
        print('Muitas tentativas de login');
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
  void dataRecovery(String currentUser) {
    _uidUser = currentUser;
    try {
      db.collection(_uidUser);
      final docRef = db.collection("Usuarios").doc(_uidUser);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;

          setName(data['Nome']);
          setEmail(data['Email']);
          setCPF(data['CPF']);
          setPhone(data['Telefone']);
          setNumContract(data['Contrato']);
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } catch (e) {
      print(e);
    }
  }
}
