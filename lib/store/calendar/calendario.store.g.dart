// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendario.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalendarioStore on _CalendarioStore, Store {
  late final _$appointmentsAtom =
      Atom(name: '_CalendarioStore.appointments', context: context);

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

  late final _$fetchAppointmentsAsyncAction =
      AsyncAction('_CalendarioStore.fetchAppointments', context: context);

  @override
  Future<void> fetchAppointments() {
    return _$fetchAppointmentsAsyncAction.run(() => super.fetchAppointments());
  }

  late final _$addAppointmentAsyncAction =
      AsyncAction('_CalendarioStore.addAppointment', context: context);

  @override
  Future<void> addAppointment(DateTime date) {
    return _$addAppointmentAsyncAction.run(() => super.addAppointment(date));
  }

  @override
  String toString() {
    return '''
appointments: ${appointments}
    ''';
  }
}
