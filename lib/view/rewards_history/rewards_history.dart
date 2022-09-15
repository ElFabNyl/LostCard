

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../constant/custom_color.dart';
import '../../controllers/reward_controller.dart';
import '../../model/document_model.dart';
import '../../model/reward_model.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/custom_rewards_history_card.dart';
import '../reusable_widgets/list_view_builder.dart';


class RewardsHistory extends StatefulWidget{
  const RewardsHistory({Key? key}) : super(key: key);

  RewardsHistoryState createState() => RewardsHistoryState();


}


class RewardsHistoryState extends State<RewardsHistory> {

  QuerySnapshot? userRewards;

  DocumentSnapshot? documentSnapshot;
   //var documentSnapshot;

  bool isUserRewardFound = true;

  //var idDocument;


  User? user = FirebaseAuth.instance.currentUser;

 List<Widget> rewardList = [];

 List<String>documentsTransactionStatusList = [];

  var i = 0;

  @override
  void initState() {

    if(user!=null){
      RewardController().getUserRewards(user!.uid).then((results) async{

        setState(() {
          userRewards =   results;
        });
      },

      );

      super.initState();

    }

  }



  @override
  Widget build(BuildContext context) {
    //bool isUserRewardFound = true;

   // List<Widget> rewardList = [];
    //var i = 0;
    var count = i;




    //LoadingIndicator(context).startLoading();
    if (!(userRewards == null)) {
      print('Is user Rewarddddddddddddddddddddddddd:'+userRewards!.docs.length.toString());
      //LoadingIndicator(context).stopLoading();





      while (count < userRewards!.docs.length) {
        var location = RewardModel.fromJson(
            userRewards!.docs[count].data() as Map<String, dynamic>)
            .location;
        var idDocument = RewardModel.fromJson(
            userRewards!.docs[count].data() as Map<String, dynamic>)
            .idDocument;
        var date = RewardModel.fromJson(
            userRewards!.docs[count].data() as Map<String, dynamic>)
            .date;

        //RewardController().getUserRewardTransactionStatus(idDocument);



        RewardController().getUserRewardTransactionStatus(idDocument).get().then((result) {

           //if(mounted){
            setState(() {
               //documentSnapshot =  result;
              // print('documentSnapshotjhweoiueoiuoer'+documentSnapshot.toString());

              print ('count'+count.toString());
              print('i'+i.toString());

               if(result!=null)
               {

                 if((DocumentModel.fromJson(result!.data() as Map<String, dynamic>).transactionStatus).compareTo('Complete')==0){

                   print('hhdsjkallllllllllllllllllll'+DocumentModel.fromJson(result!.data() as Map<String, dynamic>).transactionStatus);
                   rewardList.add(CustomRewardsHistoryCard(location: location, rewardId: idDocument, dateTime: date, cardColor: 'Complete',));

                 }
                 else
                 {
                   rewardList.add(CustomRewardsHistoryCard(location: location, rewardId: idDocument, dateTime: date, cardColor:'Pending',));
                   print('hhdsjkallllllllllllllllllll'+DocumentModel.fromJson(result!.data() as Map<String, dynamic>).transactionStatus);

                 }

                 print('Document snapshot  ___'+rewardList.length.toString());



               }



              count = i;

             });
           //}


        });








        count++;
        print('This is i'+i.toString());
        print('This is i'+count.toString());
        i++;
      }


    }
    else{

      //print('user rewards '+userRewards!.docs.length.toString());

      setState((){
        isUserRewardFound = false;
      });

      print('Is user Reward:'+isUserRewardFound.toString());


    }









    return Scaffold(body: SafeArea(
      child: Column(
                  children: [


                    AppPartContainer(
                      backButton: IconButton(icon: const Icon(null), onPressed: (){},),
                      partName: "Rewards History ",
                    ),

                    // const SizedBox(
                    //   height: 20,
                    // ),


                    Container(
                        height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height*0.318,
                        color: Colors.white,
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child:  userRewards!=null &&userRewards!.size!=0? ListViewBuilder(allDocumentsInDatabase:rewardList,)
                            :const Center(child: Text('No rewards yet')))




                  ],
                ),



    ));




  }
}
