
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/claim_lost_document_model.dart';


class ClaimLostDocumentController{


  Future addClaimedLostDocument(ClaimLostDocumentModel claimLostDocumentModel) async {


    var ref = FirebaseFirestore.instance
        .collection("claimLostDoc")
        .doc();
    claimLostDocumentModel.idClaimLostDocument = ref.id;

    ref.set(claimLostDocumentModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));





  }


  getClaimedFoundDocuments() async{
    return await FirebaseFirestore.instance.collection("foundDocument").get();
  }


}