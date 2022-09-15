import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
class CustomRewardsHistoryCard extends StatelessWidget {


  final String location;
  final String rewardId;
  final String dateTime;
  final String cardColor;


  const CustomRewardsHistoryCard({
    Key? key,

    required this.location,
    required this.rewardId,
    required this.dateTime,
    required this.cardColor,

  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return  Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(12),
        child: (
            Container(

              width: 340,
              height: 134,
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              decoration:  BoxDecoration(
                // //   boxShadow: <BoxShadow>[
                // //     //color: Colors.white,
                // //   BoxShadow(
                // //     color: Colors.black,
                // //     blurRadius: 1,
                // //     spreadRadius: 1,
                // //     offset: Offset(0.5, 0.5),
                // // ),
                //
                //   ],
                //border: Border.fromBorderSide(BorderSide()),
                  color: cardColor.compareTo('Complete')==0? Colors.white:const Color(0xffC3B9DF),
                  borderRadius: BorderRadius.circular(12)),




                    child: Column(
                      children: [

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Reward', style:  TextStyle(
                              color: CustomColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),),
                        ),

                        const SizedBox(
                          height: 2,
                        ),

                        Align(
                          alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                  text: 'Get to  '+location+' with the reward code  '+rewardId+
                                      ' to deliver the found document and get your reward ',
                                  style: const TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14
                                  )),
                              overflow: TextOverflow.clip,
                            ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),


                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(dateTime, style:  const TextStyle(
                              color: Color(0xff868686),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                        ),


                            ],),
                        )),






      );

  }
}
