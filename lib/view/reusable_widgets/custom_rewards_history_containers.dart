

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/Rewards/get_number_for_reward_dialog.dart';

import 'customized_text_button.dart';
import 'customized_text_field.dart';


class CustomRewardsHistoryContainers extends StatelessWidget{
  String rewardText;
  String rewardDate;
  CustomRewardsHistoryContainers({Key? key,
    required this.rewardText,
    required this.rewardDate
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
                  elevation: 5,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [

                        Align(
                          alignment: Alignment.center,
                          child: Text(rewardText, style: TextStyle(fontSize:18, fontWeight: FontWeight.normal, color: Colors.black),
                        ),
                        ),




                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(rewardDate, style: TextStyle(fontSize:14, fontWeight: FontWeight.normal, color: Color(0xFF868686)),
                        ),
                        ),



                      ],
                    )





                  ))

;
    throw UnimplementedError();
  }

}