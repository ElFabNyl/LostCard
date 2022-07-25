

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/Rewards/reward_Statement_dialog.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';

import '../reusable_widgets/customized_modify_textfield.dart';
import '../reusable_widgets/customized_text_field.dart';

class ModifyProfileDialog extends StatefulWidget{
  String title;
  String hintText;

  ModifyProfileDialog({
    required this.title,
    required this.hintText

});


  ModifyProfileDialogState createState()=> ModifyProfileDialogState();

}


class ModifyProfileDialogState extends State<ModifyProfileDialog>{


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
        height: 191,
        decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius:  BorderRadius.all(Radius.circular(15))
        ),
        child: Flexible(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Flexible(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      text: widget.title, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20, ),

                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),

              const SizedBox(height: 20,),


              CustomizedTextField(
                //controller: emailController,
                hintText: widget.hintText,
                prefixIcon: const Icon(null),
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

              const SizedBox(height: 10,),

             Align(
               alignment: Alignment.bottomRight,
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.end,
                 children: [
                   Align(
                     alignment: Alignment.bottomRight,
                     child: CustomizedTextButton(
                       text: 'Cancel',
                       buttonWidth: 132,
                       buttonHeight: 39,
                       border: "noBorder",
                       textColor: CustomColor().IconsColor,
                       textFontSize: 16,
                       backgroundColor: CustomColor().IconsColor,

                       onPressed: (){
                         Navigator.of(context).pop();
                       },
                       //onPressed: Navigator. of(context). pop(GetNumberNotificationDialog()),
                       // onPressed: Navigator.(GetNumberNotificationDialog(), true),
                     ),
                   ),


                   Align(
                     alignment: Alignment.bottomRight,
                     child: CustomizedTextButton(
                       text: 'Save',
                       buttonWidth: 132,
                       buttonHeight: 39,
                       border: "noBorder",
                       textColor: CustomColor().IconsColor,
                       textFontSize: 16,
                       backgroundColor: CustomColor().IconsColor,

                       onPressed: (){
                         Navigator.of(context).pop();
                       },
                       //onPressed: Navigator. of(context). pop(GetNumberNotificationDialog()),
                       // onPressed: Navigator.(GetNumberNotificationDialog(), true),
                     ),
                   )

                 ],
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