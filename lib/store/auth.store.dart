import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  @observable
  User? currentUser;

  @observable
  bool isVisible = false;

  @observable
  String password = '';

  @action
  setPassword(String password){
    return this.password = password;
  }

  @action
  passwordConfirm(){
    return this.password;
  }

  @action
  void visible(){
    isVisible = !isVisible;
  }

  @action
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = credential.user;
    } catch (e) {
      print(e);
    }
  }

  @action
  Future<void> signUpWithEmailPassword(String email, String password) async {
     final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );
    print(jsonDecode(response.body));
  }

  @action
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      currentUser = null;
    } catch (e) {
      print(e);
    }
  }

  // Outros métodos de autenticação (registro, redefinição de senha, etc.)
}