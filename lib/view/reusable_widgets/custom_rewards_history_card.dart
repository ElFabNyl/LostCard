import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
class CustomRewardsHistoryCard extends StatefulWidget {

  final String rewardNumber;
  final String amount;
  final String number;
  final String requestId;
  final String dateTime;

  const CustomRewardsHistoryCard({
    Key? key,
    required this.rewardNumber,
    required this.amount,
    required this.number,
    required this.requestId,
    required this.dateTime

  }) : super(key: key);

  @override
  CustomRewardsHistoryCardState createState() => CustomRewardsHistoryCardState();
}

class CustomRewardsHistoryCardState extends State<CustomRewardsHistoryCard> {
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),




                    child: Column(
                      children: [

                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Reward'+widget.rewardNumber, style:  TextStyle(
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
                                  text: 'A Deposit of '+widget.amount+' was made on your number '+widget.number+
                                      ' as reward for finding document attached to request id: '+ widget.requestId,
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
                          child: Text(widget.dateTime, style:  const TextStyle(
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
