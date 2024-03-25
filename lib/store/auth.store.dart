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

  @observable
  String email = '';


  @action
  void setPassword(String password){
    this.password = password;
  }

  @action
  void setEmail(String email){
    this.email = email;
  }

  @action
  passwordConfirm(){
    return password;
  }

  @action
  void visible(){
    isVisible = !isVisible;
  }
  
  @action
  Future<void> signInWithEmailPassword() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Usuário logado com sucesso
      print('Usuário logado com sucesso: ${credential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Usuário não encontrado para este e-mail.');
      } else if (e.code == 'wrong-password') {
        print('Senha incorreta para este usuário.');
      }
    } catch (e) {
      print('Erro ao fazer login: $e');
    }
  }

  @action
  Future<void> signUpWithEmailPassword() async {
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