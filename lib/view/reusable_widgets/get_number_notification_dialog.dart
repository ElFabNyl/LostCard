

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';

class GetNumberNotificationDialog extends StatefulWidget{
  void Function(bool?)? onChanged;

  GetNumberNotificationDialog({
    this.onChanged,
  });




  GetNumberNotificationDialogState createState()=> GetNumberNotificationDialogState();
}

class GetNumberNotificationDialogState extends State<GetNumberNotificationDialog>{
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
        height: 221,
        decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius:  BorderRadius.all(Radius.circular(15))
        ),
        child: Flexible(
          child: Column(
            children: [

              const Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage('assets/images/small_logo.png'),
                ),
              ),

              const SizedBox(height: 40,),

              Flexible(
                child: RichText(
                  text:  TextSpan(
                    text: '(+237) 693 306 986 ', style: TextStyle(color: CustomColor().IconsColor,fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  overflow: TextOverflow.clip,
                ),
              ),

              const SizedBox(height: 40,),

              Align(
                alignment: Alignment.bottomRight,
                child: CustomizedTextButton(
                    text: '              ok',
                    buttonWidth: 132,
                    buttonHeight: 39,
                    border: "noBorder",
                    textColor: CustomColor().IconsColor,
                    textFontSize: 16,
                  onPressed: (){
                    Navigator.of(context).pop();
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