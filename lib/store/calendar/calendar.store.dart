import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

import 'package:http/http.dart' as http;

part 'calendar.store.g.dart';

class CalendarStore = _CalendarStore with _$CalendarStore;

abstract class _CalendarStore with Store {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late http.Response rsp;

  @observable
  ObservableList<DateTime> appointments = ObservableList<DateTime>();

  @observable
  List<String> partnerNames = [];

  @action
  List<String> getPartnerNames() {
    return partnerNames;
  }

  Future<void> retrievePartnerNames() async {
    try {
      final partnerCollection = _db.collection("Parceiros");
      final snapshot = await partnerCollection.get();

      partnerNames.clear();

      var index = 0;
      while (index < snapshot.docs.length) {
        final doc = snapshot.docs[index];
        final data = doc.data();
        final name = data['Nome'];
        if (name != null) {
          partnerNames.add(name);
        }
        index++;
      }
    } catch (e) {
      print('Erro ao buscar os dados dos parceiros: $e');
    }
  }

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
