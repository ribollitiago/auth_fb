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

  // Função para imprimir todos os dados da coleção 'Parceiros' e recuperar os nomes
  Future<void> retrievePartnerNames() async {
    try {
      final partnerCollection = _db.collection("Parceiros");
      final snapshot = await partnerCollection.get();

      // Limpar a lista de nomes dos parceiros antes de preenchê-la
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

  void retrieveExam(String exam) async {
  try {
    final partnerCollection = _db.collection("Parceiros");
    final snapshot = await partnerCollection.get();

    var index = 0;
    while (index < snapshot.docs.length) {
      final doc = snapshot.docs[index];
      final data = doc.data();
      final name = data['Nome'];

      if (exam == name) {
        
        final examCollection = doc.reference.collection('Exames');

        final examSnapshot = await examCollection.get();
        List<String> exams = [];

        examSnapshot.docs.forEach((examDoc) {
          
          final examMap = examDoc.data();
          
          exams.addAll(examMap.values.whereType<String>());
        });

        print('Exames do parceiro $exam: $exams');
        return;
      }

      index++;
    }

    print('Parceiro $exam não encontrado ou não possui exames');
  } catch (e) {
    print('Erro ao buscar os exames: $e');
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
