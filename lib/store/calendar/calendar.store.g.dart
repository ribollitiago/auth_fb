// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarStore on _CalendarStore, Store {
  late final _$appointmentsAtom =
      Atom(name: '_CalendarStore.appointments', context: context);

  @override
  ObservableList<DateTime> get appointments {
    _$appointmentsAtom.reportRead();
    return super.appointments;
  }

  @override
  set appointments(ObservableList<DateTime> value) {
    _$appointmentsAtom.reportWrite(value, super.appointments, () {
      super.appointments = value;
    });
  }

  late final _$partnerNamesAtom =
      Atom(name: '_CalendarStore.partnerNames', context: context);

  @override
  List<String> get partnerNames {
    _$partnerNamesAtom.reportRead();
    return super.partnerNames;
  }

  @override
  set partnerNames(List<String> value) {
    _$partnerNamesAtom.reportWrite(value, super.partnerNames, () {
      super.partnerNames = value;
    });
  }

  late final _$fetchAppointmentsAsyncAction =
      AsyncAction('_CalendarStore.fetchAppointments', context: context);

  @override
  Future<void> fetchAppointments() {
    return _$fetchAppointmentsAsyncAction.run(() => super.fetchAppointments());
  }

  late final _$addAppointmentAsyncAction =
      AsyncAction('_CalendarStore.addAppointment', context: context);

  @override
  Future<void> addAppointment(DateTime date) {
    return _$addAppointmentAsyncAction.run(() => super.addAppointment(date));
  }

  late final _$_CalendarStoreActionController =
      ActionController(name: '_CalendarStore', context: context);

  @override
  List<String> getPartnerNames() {
    final _$actionInfo = _$_CalendarStoreActionController.startAction(
        name: '_CalendarStore.getPartnerNames');
    try {
      return super.getPartnerNames();
    } finally {
      _$_CalendarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appointments: ${appointments},
partnerNames: ${partnerNames}
    ''';
  }
}
