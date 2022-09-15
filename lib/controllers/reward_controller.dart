import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/reward_model.dart';

class RewardController{

  Future addReward(RewardModel rewardModel) async {
    var ref = FirebaseFirestore.instance
        .collection("rewards")
        .doc();

    rewardModel.idReward = ref.id;
        ref.set(rewardModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));
  }

  getUserRewards(String idUser) async {
    return await FirebaseFirestore.instance.collection('rewards').where("idUser", isEqualTo: idUser).orderBy('date', descending: true).get()
        .catchError((error){
      print(error);

    });


  }

  getUserRewardTransactionStatus(String idDocument) {
    return FirebaseFirestore.instance.collection('allDocuments').doc(idDocument);


}





}