import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';


class FoundNotificationDialog extends StatefulWidget {
  final String message;
  final void Function() onPressed;

  const FoundNotificationDialog({Key? key,
    required this.onPressed,
    required this.message,


  }

  ) : super(key: key);

  @override
  FoundNotificationDialogState createState() => FoundNotificationDialogState();
}

class FoundNotificationDialogState extends State<FoundNotificationDialog> {

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
        width: 312,
        height: 322,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/images/phoneIcon.png'),
            ),

               const SizedBox(height: 20,),

               
               const Text('Successful Operation', style: TextStyle(fontSize: 24),),
            const SizedBox(height: 20,),
               
               const Text('Pending verification', style: TextStyle(fontSize: 14, color: Color(0xff49454F)),),
            const SizedBox(height: 15,),


            RichText(
              text: TextSpan(
                  text: widget.message,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14
                  )),
              overflow: TextOverflow.clip,
            ),

            const SizedBox(height: 40,),

               Align(
                 alignment: Alignment. centerRight,
                 child: CustomizedTextButton(
                  text: 'Ok',
                  buttonWidth: 39,
                  buttonHeight: 39,
                  border: "noBorder",
                  textColor: CustomColor.primaryColor,
                  textFontSize: 18,
                  backgroundColor: CustomColor.primaryColor,
                  onPressed: widget.onPressed,
              ),
               ),
          ],
        ),
      ),
    );

  }
}
