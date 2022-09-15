import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';

class UserController {
  Future addUser(UserModel userModel) async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.idUser)
        .set(userModel.toJson())
        .onError((e, _) => print("Error writing document: $e"));
  }

  getUser() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid);
  }

  getUserNumberOfFoundDocuments(String idUser) async {
    return await FirebaseFirestore.instance.collection('allDocuments').where("idUser", isEqualTo: idUser).where("transactionStatus", isEqualTo: "Complete").get()
        .catchError((error){
      print(error);

    });


  }



  updateUserName(String idDocument, String name){
    FirebaseFirestore.instance.collection("users").doc(idDocument).update({"name": name}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  updateUserPhoneNumber(String idDocument, String phoneNumber){
    FirebaseFirestore.instance.collection("users").doc(idDocument).update({"phoneNumber": phoneNumber}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  updateUserPassword(String idDocument, String password){
    FirebaseFirestore.instance.collection("users").doc(idDocument).update({"password": password}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  updateUserProfilePicture(String idDocument, String profilePicture){
    FirebaseFirestore.instance.collection("users").doc(idDocument).update({"profilePicture": profilePicture}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  updateNumberOfDocumentsFound(String idUser, String numberOfDocumentsFound){
    FirebaseFirestore.instance.collection("users").doc(idUser).update({"documentsFound": numberOfDocumentsFound}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

  updateAmountOfRewardsGained(String idUser, String rewardsGained){
    FirebaseFirestore.instance.collection("users").doc(idUser).update({"rewardsGained": rewardsGained}).then(
            (value) => print("DocumentSnapshot successfully updated!"),
        onError: (e) => print("Error updating document $e"));

  }

}
