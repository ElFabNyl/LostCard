import 'package:flutter/material.dart';


import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/custom_rewards_history_card.dart';

class RewardsHistory extends StatelessWidget {
  const RewardsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    SafeArea(
      child: SingleChildScrollView(
                child: Column(
                  children: [


                    AppPartContainer(
                      backButton: IconButton(icon: const Icon(null), onPressed: (){},),
                      partName: "Rewards History ",
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    Container(height: 153,
                      color: Colors.grey,
                      child: const Align(alignment: Alignment.center, child:  Text('Animated Image')),

                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    const CustomRewardsHistoryCard(
                      amount: '10 000 Fcfa',
                      number: '6 79 27 02 51',
                      requestId: '00003',
                      rewardNumber: '3',
                      dateTime: 'wed 06,2022, 12:00 am',

                    ),

                    const SizedBox(height: 20,),


                    const CustomRewardsHistoryCard(
                      amount: '10 000 Fcfa',
                      number: '6 79 27 02 51',
                      requestId: '00002',
                      rewardNumber: '2',
                      dateTime: 'wed 06,2022, 11:32 am',

                    ),

                    const SizedBox(height: 20,),


                    const CustomRewardsHistoryCard(
                      amount: '10 000 Fcfa',
                      number: '6 79 27 02 51',
                      requestId: '00001',
                      rewardNumber: '1',
                      dateTime: 'wed 06,2022, 10:50 am',

                    ),

                    const SizedBox(
                      height: 20,
                    ),

                  ],
                ),
              ),


    ));




  }
}
