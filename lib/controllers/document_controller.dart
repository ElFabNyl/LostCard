import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';


import '../model/document_model.dart';

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
  }

  getAllDocuments() async {
   
        return await FirebaseFirestore.instance.collection('allDocuments').orderBy('registrationDate', descending: true).get();
  }



}
