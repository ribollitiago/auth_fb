import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'auth.store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBlb1hQGuNgpJs0dkTKhAQ-l5YqS3XVM88';

  FirebaseFirestore db = FirebaseFirestore.instance;

  @observable
  User? currentUser;

  @observable
  bool isVisible = false;

  @observable
  String usuarioID = '';

  @observable
  String cpf = '';

  @observable
  String nome = '';

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  var dataDeCriacao = null;

  @observable
  String telefone = '';

  @observable
  String numContrato = '';

  @action
  Future<void> setUserId() async {
    User? user = _auth.currentUser;

    if (user != null) {
      usuarioID = user.uid;
    } else {
      print('Nenhum usuário autenticado.');
    }
  }

  @action
  void setCPF(String cpf) {
    this.cpf = cpf;
  }

  @action
  void setNome(String nome) {
    this.nome = nome;
  }

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setPassword(String password) {
    this.password = password;
  }

  @action
  void setTelefone(String telefone) {
    this.telefone = telefone;
  }

  @action
  void setNumContrato(String numContrato) {
    this.numContrato = numContrato;
  }

  @action
  passwordConfirm() {
    return password;
  }

  @action
  void visible() {
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

  @action
  cadastroUsuario() async {
    await setUserId(); // Aguarde a definição do ID do usuário
    try {
      Map<String, dynamic> usuariosInfoMap = {
        "ID": usuarioID,
        "Nome": nome,
        "CPF": cpf,
        "Email": email,
        "Telefone": telefone,
        "Contrato": numContrato,
      };
      await addDetalhesUsuarios(usuariosInfoMap, usuarioID);
    } catch (e) {
      print(e);
    }
  }

  @action
  Future addDetalhesUsuarios(
      Map<String, dynamic> usuariosMap, String id) async {
    return await db.collection("Usuarios").doc(id).set(usuariosMap);
  }
}