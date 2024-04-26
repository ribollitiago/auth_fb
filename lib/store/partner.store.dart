import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

part 'partner.store.g.dart';

class PartnerStore = _PartnerStore with _$PartnerStore;

abstract class _PartnerStore with Store {

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

  Map<String, dynamic> partnerMap = {};

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
  Future<void> partnerIdSearch(value, client) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Usuarios")
        .where(value, isEqualTo: client.toLowerCase())
        .get();
    if (snapshot.docs.isNotEmpty) {
      var doc = snapshot.docs[0];
      _partnerId = doc.id;
      _partnerName = doc['Nome'];
      _partnerEmail = doc['Email'];
      _partnerAddress = doc['Endereço'];
      _partnerPhone = doc['Telefone'];

      print(
          "$value válido. Id: $_partnerId, Nome: $_partnerName, Email:  $_partnerEmail, Endereço:  $_partnerAddress, Telefone:  $_partnerPhone");

      partnerMap = {
        "ID": _partnerId,
        "Nome": _partnerName,
        "Email": _partnerEmail,
        "Endereço": _partnerAddress,
        "Telefone": _partnerPhone ,
      };
    } else {
      print("Nenhum $value foi encontrado.");
    }
  }

  @action
  Future<Map<String, Map<String, dynamic>>> getAllPartners() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection("Parceiros")
        .get();

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
