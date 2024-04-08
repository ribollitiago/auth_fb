// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$_currentUserAtom =
      Atom(name: '_AuthStore._currentUser', context: context);

  @override
  User? get _currentUser {
    _$_currentUserAtom.reportRead();
    return super._currentUser;
  }

  @override
  set _currentUser(User? value) {
    _$_currentUserAtom.reportWrite(value, super._currentUser, () {
      super._currentUser = value;
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

  late final _$_tokenAtom = Atom(name: '_AuthStore._token', context: context);

  @override
  String get _token {
    _$_tokenAtom.reportRead();
    return super._token;
  }

  @override
  set _token(String value) {
    _$_tokenAtom.reportWrite(value, super._token, () {
      super._token = value;
    });
  }

  late final _$_uidUserAtom =
      Atom(name: '_AuthStore._uidUser', context: context);

  @override
  String get _uidUser {
    _$_uidUserAtom.reportRead();
    return super._uidUser;
  }

  @override
  set _uidUser(String value) {
    _$_uidUserAtom.reportWrite(value, super._uidUser, () {
      super._uidUser = value;
    });
  }

  late final _$_cpfAtom = Atom(name: '_AuthStore._cpf', context: context);

  @override
  String get _cpf {
    _$_cpfAtom.reportRead();
    return super._cpf;
  }

  @override
  set _cpf(String value) {
    _$_cpfAtom.reportWrite(value, super._cpf, () {
      super._cpf = value;
    });
  }

  late final _$_nomeAtom = Atom(name: '_AuthStore._nome', context: context);

  @override
  String get _nome {
    _$_nomeAtom.reportRead();
    return super._nome;
  }

  @override
  set _nome(String value) {
    _$_nomeAtom.reportWrite(value, super._nome, () {
      super._nome = value;
    });
  }

  late final _$_emailAtom = Atom(name: '_AuthStore._email', context: context);

  @override
  String get _email {
    _$_emailAtom.reportRead();
    return super._email;
  }

  @override
  set _email(String value) {
    _$_emailAtom.reportWrite(value, super._email, () {
      super._email = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: '_AuthStore._password', context: context);

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$_telefoneAtom =
      Atom(name: '_AuthStore._telefone', context: context);

  @override
  String get _telefone {
    _$_telefoneAtom.reportRead();
    return super._telefone;
  }

  @override
  set _telefone(String value) {
    _$_telefoneAtom.reportWrite(value, super._telefone, () {
      super._telefone = value;
    });
  }

  late final _$_numContratoAtom =
      Atom(name: '_AuthStore._numContrato', context: context);

  @override
  String get _numContrato {
    _$_numContratoAtom.reportRead();
    return super._numContrato;
  }

  @override
  set _numContrato(String value) {
    _$_numContratoAtom.reportWrite(value, super._numContrato, () {
      super._numContrato = value;
    });
  }

  late final _$textErrorAtom =
      Atom(name: '_AuthStore.textError', context: context);

  @override
  String get textError {
    _$textErrorAtom.reportRead();
    return super.textError;
  }

  @override
  set textError(String value) {
    _$textErrorAtom.reportWrite(value, super.textError, () {
      super.textError = value;
    });
  }

  late final _$isErrorAtom = Atom(name: '_AuthStore.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$signInWithEmailPasswordAsyncAction =
      AsyncAction('_AuthStore.signInWithEmailPassword', context: context);

  @override
  Future<void> signInWithEmailPassword(BuildContext context) {
    return _$signInWithEmailPasswordAsyncAction
        .run(() => super.signInWithEmailPassword(context));
  }

  late final _$signOutAsyncAction =
      AsyncAction('_AuthStore.signOut', context: context);

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
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
isVisible: ${isVisible},
textError: ${textError},
isError: ${isError}
    ''';
  }
}
