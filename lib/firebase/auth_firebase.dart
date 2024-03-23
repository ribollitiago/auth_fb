import 'package:firebase_auth/firebase_auth.dart';

class AuthFB {

  Future<void> authWithEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Usuário criado com sucesso
      print('Usuário criado com sucesso: ${credential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('A senha fornecida é muito fraca.');
      } else if (e.code == 'email-already-in-use') {
        print('A conta já existe para este e-mail.');
      }
    } catch (e) {
      print('Erro ao criar usuário: $e');
    }
  }

  Future<void> signInWithEmailPassword(String email, String password) async {
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
}