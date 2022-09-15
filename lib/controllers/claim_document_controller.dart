
import 'package:cloud_firestore/cloud_firestore.dart';


import '../model/claim_document_model.dart';


class ClaimDocumentController{


  Future addClaimedDocument(ClaimDocumentModel claimDocumentModel) async {


    var ref = FirebaseFirestore.instance
        .collection("claimedDocuments")
        .doc();
    claimDocumentModel.idClaimDocument = ref.id;

    ref.set(claimDocumentModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));





  }


  getClaimedDocuments() async{
    return await FirebaseFirestore.instance.collection("claimedDocuments").get();
  }


}