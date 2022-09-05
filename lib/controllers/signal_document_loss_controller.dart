
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lostcard/model/signal_document_loss_model.dart';


import '../model/claim_found_document_model.dart';


class SignalDocumentLossController{


  Future signalDocumentLoss(SignalDocumentLossModel signalDocumentLoss) async {


    var ref = FirebaseFirestore.instance
        .collection("allDocuments")
        .doc();
    signalDocumentLoss.idDocumentLost = ref.id;

    ref.set(signalDocumentLoss.toJson())
        .onError((e, _) => print("Error writing document: $e"));





  }


  getSignaledLostDocuments() async{
    return await FirebaseFirestore.instance.collection("lostDocument").get();
  }


}