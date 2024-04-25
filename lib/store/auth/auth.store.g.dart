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

  late final _$_isErrorAtom =
      Atom(name: '_AuthStore._isError', context: context);

  @override
  bool get _isError {
    _$_isErrorAtom.reportRead();
    return super._isError;
  }

  @override
  set _isError(bool value) {
    _$_isErrorAtom.reportWrite(value, super._isError, () {
      super._isError = value;
    });
  }

  late final _$_textErrorAtom =
      Atom(name: '_AuthStore._textError', context: context);

  @override
  String get _textError {
    _$_textErrorAtom.reportRead();
    return super._textError;
  }

  @override
  set _textError(String value) {
    _$_textErrorAtom.reportWrite(value, super._textError, () {
      super._textError = value;
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

  late final _$_nameAtom = Atom(name: '_AuthStore._name', context: context);

  @override
  String get _name {
    _$_nameAtom.reportRead();
    return super._name;
  }

  @override
  set _name(String value) {
    _$_nameAtom.reportWrite(value, super._name, () {
      super._name = value;
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

  late final _$_rgAtom = Atom(name: '_AuthStore._rg', context: context);

  @override
  String get _rg {
    _$_rgAtom.reportRead();
    return super._rg;
  }

  @override
  set _rg(String value) {
    _$_rgAtom.reportWrite(value, super._rg, () {
      super._rg = value;
    });
  }

  late final _$_phoneAtom = Atom(name: '_AuthStore._phone', context: context);

  @override
  String get _phone {
    _$_phoneAtom.reportRead();
    return super._phone;
  }

  @override
  set _phone(String value) {
    _$_phoneAtom.reportWrite(value, super._phone, () {
      super._phone = value;
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

  late final _$recoveryDataAsyncAction =
      AsyncAction('_AuthStore.recoveryData', context: context);

  @override
  Future<void> recoveryData(String currentUser) {
    return _$recoveryDataAsyncAction.run(() => super.recoveryData(currentUser));
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
  dynamic getName() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getName');
    try {
      return super.getName();
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
  dynamic getPhone() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getPhone');
    try {
      return super.getPhone();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getRg() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.getRg');
    try {
      return super.getRg();
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
  void setName(String name) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setName');
    try {
      return super.setName(name);
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
  void setNumContract(String rg) {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.setNumContract');
    try {
      return super.setNumContract(rg);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String phone) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setPhone');
    try {
      return super.setPhone(phone);
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
  String toString() {
    return '''
isVisible: ${isVisible}
    ''';
  }
}
