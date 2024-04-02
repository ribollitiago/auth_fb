import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'calendario.store.g.dart';

class CalendarioStore = _CalendarioStore with _$CalendarioStore;

abstract class _CalendarioStore with Store {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @observable
  ObservableList<DateTime> appointments = ObservableList<DateTime>();

  @action
  Future<void> fetchAppointments() async {
    try {
      final snapshot = await _db.collection('appointments').get();
      final List<DateTime> appointmentDates = snapshot.docs.map((doc) {
        final data = doc.data();
        return (data['date'] as Timestamp).toDate();
      }).toList();
      appointments.clear();
      appointments.addAll(appointmentDates);
    } catch (e) {
      print('Erro ao buscar os agendamentos: $e');
      // Trate o erro conforme necessário
    }
  }

  @action
  Future<void> addAppointment(DateTime date) async {
    try {
      await _db.collection('appointments').add({'date': date});
      appointments.add(date);
    } catch (e) {
      print('Erro ao adicionar o agendamento: $e');
      // Trate o erro conforme necessário
    }
  }
}
