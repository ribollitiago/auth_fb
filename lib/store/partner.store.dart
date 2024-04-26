import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'partner.store.g.dart';

class PartnerStore = _PartnerStore with _$PartnerStore;

abstract class _PartnerStore with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  //Partner
  @observable
  String _partner = '';

  @observable
  String _partnerId = '';

  @observable
  String _partnerName = '';

  @observable
  String _partnerEmail = '';

  @observable
  String _partnerAddress = '';

  @observable
  String _partnerPhone = '';
  //Plans
  @observable
  List<String> planNames = [];

  Map<String, dynamic> partnerMap = {};

  Map<String, dynamic> partnerMap2 = {};

  //Partner
  @action
  String getPartner() => _partner;

  @action
  String getPartnerName() => _partnerName;

  @action
  String getPartnerEmail() => _partnerEmail;

  @action
  String getPartnerAddress() => _partnerAddress;

  @action
  String getPartnerPhone() => _partnerPhone;

  //Partner
  Future<void> planIdSearch() async {
    try {
      final partnerCollection = db.collection("Parceiros");
      final snapshot = await partnerCollection.get();
      var index = 0;
      while (index < snapshot.docs.length) {
        if (snapshot.docs.isNotEmpty) {
          final doc = snapshot.docs[index];
          String partnerId = doc.id;
          String partnerName = doc['Nome'];
          partnerMap = {
            "ID": partnerId,
            "Nome": partnerName,
            "Endereço": doc['Endereço'],
          };
          print(partnerMap);
          partnerMap2[partnerName] = partnerMap;
        } else {
          print("Nenhum  foi encontrado.");
        }
        index++;
      }
      print(partnerMap2);
    } catch (e) {
      print("Ocorreu um erro: $e");
    }
  }

  @action
  Future<Map<String, Map<String, dynamic>>> getAllPartners() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("Parceiros").get();

    Map<String, Map<String, dynamic>> allPartners = {};

    for (var doc in snapshot.docs) {
      String partnerId = doc.id;
      String partnerName = doc['Nome'];
      String partnerEmail = doc['Email'];
      String partnerAddress = doc['Endereço'];
      String partnerPhone = doc['Telefone'];

      allPartners[partnerId] = {
        "ID": partnerId,
        "Nome": partnerName,
        "Email": partnerEmail,
        "Endereço": partnerAddress,
        "Telefone": partnerPhone,
      };
    }

    return allPartners;
  }
}
