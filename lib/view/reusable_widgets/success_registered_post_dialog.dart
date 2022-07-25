

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';



class SuccessRegisteredPostDialog extends StatelessWidget{
  String textMessage;

  SuccessRegisteredPostDialog({Key? key,
    required this.textMessage

}) : super(key: key);

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

              const SizedBox(height: 10,),

              Flexible(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text:  TextSpan(
                        text: textMessage, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.normal, fontSize: 18, ),

                      ),
                      overflow: TextOverflow.clip,
                    ),
              ),

              const SizedBox(height: 10,),

              Align(
                alignment: Alignment.bottomRight,
                child: CustomizedTextButton(
                  text: '              ok',
                  buttonWidth: 132,
                  buttonHeight: 39,
                  border: "noBorder",
                  textColor: CustomColor().IconsColor,
                  textFontSize: 16,
                  backgroundColor: CustomColor().IconsColor,

                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPagesManager(selectedIndex: 1,)),
                    );
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