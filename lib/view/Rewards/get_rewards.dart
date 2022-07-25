

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/Rewards/get_number_for_reward_dialog.dart';

import '../reusable_widgets/customized_text_button.dart';
import '../reusable_widgets/customized_text_field.dart';

class GetRewards extends StatefulWidget{

  GetRewardsState createState()=> GetRewardsState();

}

class GetRewardsState extends State<GetRewards>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child:Column(
          children: [

            SizedBox(height: 40,),
            Text(
              "Wanna get your rewards?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColor().IconsColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.center,
              child: Image(
                image:
                AssetImage('assets/images/surprise_reward.png'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),


            CustomizedTextField(
              //controller: emailController,
              labelText: 'Enter Reward code',
              prefixIcon: Icon(FontAwesomeIcons.lock, size: 15, color: CustomColor().IconsColor,),
              suffixIcon: const Icon(null),
              suffixIconBeforeTap: const Icon(null),
              suffixIconOnTap: const Icon(null),
              isStringInputType: false,
              isPassword: false,
              width: 340,
              height: 52,
              // errorText:
              // isEmailEmpty ? emailErrorText : null,
              // onChanged:  (_){
              //
              //   emailController.value.text.isEmpty? isEmailEmpty = true : isEmailEmpty = false ;
              //
              //   setState(() {
              //
              //
              //   });
              //
              //
              // },
            ),

            SizedBox(height: 80,),


            CustomizedTextButton(
              text: 'Get',
              buttonWidth: 247,
              buttonHeight: 39,
              border: 'border',
              textColor: Colors.white,
              textFontSize: 18,
              backgroundColor: CustomColor().IconsColor,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return GetNumberForRewardDialog();
                    });
              },
            ),


          ],
        )
      ),

    );
    throw UnimplementedError();
  }

}