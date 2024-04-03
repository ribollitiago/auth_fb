// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$currentUserAtom =
      Atom(name: '_AuthStore.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$isVisibleAtom =
      Atom(name: '_AuthStore.isVisible', context: context);

  @override
  bool get isVisible {
    _$isVisibleAtom.reportRead();
    return super.isVisible;
  }

  @override
  set isVisible(bool value) {
    _$isVisibleAtom.reportWrite(value, super.isVisible, () {
      super.isVisible = value;
    });
  }

  late final _$tokenAtom = Atom(name: '_AuthStore.token', context: context);

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  late final _$uidUserAtom = Atom(name: '_AuthStore.uidUser', context: context);

  @override
  String get uidUser {
    _$uidUserAtom.reportRead();
    return super.uidUser;
  }

  @override
  set uidUser(String value) {
    _$uidUserAtom.reportWrite(value, super.uidUser, () {
      super.uidUser = value;
    });
  }

  late final _$cpfAtom = Atom(name: '_AuthStore.cpf', context: context);

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$nomeAtom = Atom(name: '_AuthStore.nome', context: context);

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$emailAtom = Atom(name: '_AuthStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_AuthStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_AuthStore.telefone', context: context);

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$numContratoAtom =
      Atom(name: '_AuthStore.numContrato', context: context);

  @override
  String get numContrato {
    _$numContratoAtom.reportRead();
    return super.numContrato;
  }

  @override
  set numContrato(String value) {
    _$numContratoAtom.reportWrite(value, super.numContrato, () {
      super.numContrato = value;
    });
  }

  late final _$signInWithEmailPasswordAsyncAction =
      AsyncAction('_AuthStore.signInWithEmailPassword', context: context);

  @override
  Future<void> signInWithEmailPassword(BuildContext context) {
    return _$signInWithEmailPasswordAsyncAction
        .run(() => super.signInWithEmailPassword(context));
  }

  late final _$signUpWithEmailPasswordAsyncAction =
      AsyncAction('_AuthStore.signUpWithEmailPassword', context: context);

  @override
  Future<void> signUpWithEmailPassword(BuildContext context) {
    return _$signUpWithEmailPasswordAsyncAction
        .run(() => super.signUpWithEmailPassword(context));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthStore.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$cadastroUsuarioAsyncAction =
      AsyncAction('_AuthStore.cadastroUsuario', context: context);

  @override
  Future<void> cadastroUsuario() {
    return _$cadastroUsuarioAsyncAction.run(() => super.cadastroUsuario());
  }

  late final _$addDetalhesUsuariosAsyncAction =
      AsyncAction('_AuthStore.addDetalhesUsuarios', context: context);

  @override
  Future<dynamic> addDetalhesUsuarios(
      Map<String, dynamic> usuariosMap, String id) {
    return _$addDetalhesUsuariosAsyncAction
        .run(() => super.addDetalhesUsuarios(usuariosMap, id));
  }

  late final _$_AuthStoreActionController =
      ActionController(name: '_AuthStore', context: context);

  @override
  dynamic getEmail() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getEmail');
    try {
      return super.getEmail();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNome() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getNome');
    try {
      return super.getNome();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCPF() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getCPF');
    try {
      return super.getCPF();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getTelefone() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getTelefone');
    try {
      return super.getTelefone();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPassword() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getPassword');
    try {
      return super.getPassword();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic usuarioUID() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.usuarioUID');
    try {
      return super.usuarioUID();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String cpf) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setCPF');
    try {
      return super.setCPF(cpf);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNome(String nome) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String telefone) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setTelefone');
    try {
      return super.setTelefone(telefone);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumContrato(String numContrato) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setNumContrato');
    try {
      return super.setNumContrato(numContrato);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void visible() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.visible');
    try {
      return super.visible();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void recuperacaoDados(String currentUser) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.recuperacaoDados');
    try {
      return super.recuperacaoDados(currentUser);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser},
isVisible: ${isVisible},
token: ${token},
uidUser: ${uidUser},
cpf: ${cpf},
nome: ${nome},
email: ${email},
password: ${password},
telefone: ${telefone},
numContrato: ${numContrato}
    ''';
  }
}
