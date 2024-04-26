// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PartnerStore on _PartnerStore, Store {
  late final _$_partnerAtom =
      Atom(name: '_PartnerStore._partner', context: context);

  @override
  String get _partner {
    _$_partnerAtom.reportRead();
    return super._partner;
  }

  @override
  set _partner(String value) {
    _$_partnerAtom.reportWrite(value, super._partner, () {
      super._partner = value;
    });
  }

  late final _$_partnerIdAtom =
      Atom(name: '_PartnerStore._partnerId', context: context);

  @override
  String get _partnerId {
    _$_partnerIdAtom.reportRead();
    return super._partnerId;
  }

  @override
  set _partnerId(String value) {
    _$_partnerIdAtom.reportWrite(value, super._partnerId, () {
      super._partnerId = value;
    });
  }

  late final _$_partnerNameAtom =
      Atom(name: '_PartnerStore._partnerName', context: context);

  @override
  String get _partnerName {
    _$_partnerNameAtom.reportRead();
    return super._partnerName;
  }

  @override
  set _partnerName(String value) {
    _$_partnerNameAtom.reportWrite(value, super._partnerName, () {
      super._partnerName = value;
    });
  }

  late final _$_partnerEmailAtom =
      Atom(name: '_PartnerStore._partnerEmail', context: context);

  @override
  String get _partnerEmail {
    _$_partnerEmailAtom.reportRead();
    return super._partnerEmail;
  }

  @override
  set _partnerEmail(String value) {
    _$_partnerEmailAtom.reportWrite(value, super._partnerEmail, () {
      super._partnerEmail = value;
    });
  }

  late final _$_partnerAddressAtom =
      Atom(name: '_PartnerStore._partnerAddress', context: context);

  @override
  String get _partnerAddress {
    _$_partnerAddressAtom.reportRead();
    return super._partnerAddress;
  }

  @override
  set _partnerAddress(String value) {
    _$_partnerAddressAtom.reportWrite(value, super._partnerAddress, () {
      super._partnerAddress = value;
    });
  }

  late final _$_partnerPhoneAtom =
      Atom(name: '_PartnerStore._partnerPhone', context: context);

  @override
  String get _partnerPhone {
    _$_partnerPhoneAtom.reportRead();
    return super._partnerPhone;
  }

  @override
  set _partnerPhone(String value) {
    _$_partnerPhoneAtom.reportWrite(value, super._partnerPhone, () {
      super._partnerPhone = value;
    });
  }

  late final _$getAllPartnersAsyncAction =
      AsyncAction('_PartnerStore.getAllPartners', context: context);

  @override
  Future<Map<String, Map<String, dynamic>>> getAllPartners() {
    return _$getAllPartnersAsyncAction.run(() => super.getAllPartners());
  }

  late final _$_PartnerStoreActionController =
      ActionController(name: '_PartnerStore', context: context);

  @override
  String getPartner() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPartner');
    try {
      return super.getPartner();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPartnerName() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPartnerName');
    try {
      return super.getPartnerName();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPartnerEmail() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPartnerEmail');
    try {
      return super.getPartnerEmail();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPartnerAddress() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPartnerAddress');
    try {
      return super.getPartnerAddress();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getPartnerPhone() {
    final _$actionInfo = _$_PartnerStoreActionController.startAction(
        name: '_PartnerStore.getPartnerPhone');
    try {
      return super.getPartnerPhone();
    } finally {
      _$_PartnerStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
