import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lostcard/controllers/reward_controller.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';


import '../model/document_model.dart';
import '../model/reward_model.dart';

class DocumentController {
  Future addFoundDocument(
      DocumentModel documentModel) async {
    var ref = FirebaseFirestore.instance
        .collection("allDocuments")
        .doc();
    documentModel.idDocument = ref.id;

    ref
        .set(documentModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));


    final rewardModel = RewardModel(
      idUser: documentModel.idUser,
      idReward: '',
      location: 'ICT University',
      date: documentModel.registrationDate,
      idDocument: documentModel.idDocument,

    );

    await RewardController().addReward(rewardModel);
  }

  getAllDocuments() async {

        return await FirebaseFirestore.instance.collection('allDocuments').where("transactionStatus", isEqualTo: "Complete").orderBy('registrationDate', descending: true).get()
            .catchError((error){
          print(error);

        });
  }



}
