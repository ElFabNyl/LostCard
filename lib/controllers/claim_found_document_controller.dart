
import 'package:cloud_firestore/cloud_firestore.dart';


import '../model/claim_found_document_model.dart';


class ClaimFoundDocumentController{


  Future addClaimedFoundDocument(ClaimFoundDocumentModel claimFoundDocumentModel) async {


    var ref = FirebaseFirestore.instance
        .collection("claimFoundDoc")
        .doc();
    claimFoundDocumentModel.idClaimFoundDocument = ref.id;

    ref.set(claimFoundDocumentModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));





  }


  getClaimedFoundDocuments() async{
    return await FirebaseFirestore.instance.collection("foundDocument").get();
  }


}