

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/Rewards/reward_Statement_dialog.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';

import '../reusable_widgets/customized_text_field.dart';

class GetNumberForRewardDialog extends StatefulWidget{


  GetNumberForRewardDialogState createState()=> GetNumberForRewardDialogState();

}


class GetNumberForRewardDialogState extends State<GetNumberForRewardDialog>{


  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      backgroundColor: Colors.transparent,


      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 340,
        height: 284,
        decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius:  BorderRadius.all(Radius.circular(15))
        ),
        child: Flexible(
          child: Column(
            children: [
              SizedBox(height: 20,),

              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/small_logo.png'),
                ),
              ),

              const SizedBox(height: 20,),

              Flexible(
                child: RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                    text: 'specify Number for transaction', style: const TextStyle(color: Color(0xFF726E6E),fontWeight: FontWeight.bold, fontSize: 18, ),

                  ),
                  overflow: TextOverflow.clip,
                ),
              ),

              const SizedBox(height: 20,),


              CustomizedTextField(
                //controller: emailController,
                labelText: 'Phone Number',
                prefixIcon: Icon(FontAwesomeIcons.phone, size: 15, color: CustomColor().IconsColor,),
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

              const SizedBox(height: 30,),

              Align(
                alignment: Alignment.center,
                child: CustomizedTextButton(
                  text: 'Validate',
                  buttonWidth: 132,
                  buttonHeight: 39,
                  border: "border",
                  textColor: Colors.white,
                  textFontSize: 16,
                  backgroundColor: CustomColor().IconsColor,

                  onPressed: (){
                    Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RewardStatementDialog(amount: 'XXXXX');
                        });
                  },
                  //onPressed: Navigator. of(context). pop(GetNumberNotificationDialog()),
                  // onPressed: Navigator.(GetNumberNotificationDialog(), true),
                ),
              )
            ],

          ),
        ),


      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}