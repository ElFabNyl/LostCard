import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';



class AlertDialogDocumentUpload extends StatefulWidget {



  AlertDialogDocumentUploadState createState() => AlertDialogDocumentUploadState();
}

class AlertDialogDocumentUploadState extends State<AlertDialogDocumentUpload> {

  bool? isChecked = false;

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
            borderRadius: BorderRadius.all(Radius.circular(15))),

        child: Column(
          children: [
            Column(
              children: [
                Container(
                  width: 308.27,
                  height: 155,
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: const BoxDecoration(
                      color: Color(0x10023607),
                      borderRadius: BorderRadius.all(Radius.circular(15))),

                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child:  Icon(
                          FontAwesomeIcons.exclamation,
                          color: Colors.red,
                          size: 25,
                        ),
                      ),

                      Row(children: [
                        const SizedBox(width: 20),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                              text:
                              'LostCard is not responsible for any misusage by external parties of the document you will upload.'+
                                'Carefully choose the documents you upload ',
                              style: TextStyle(
                                color: CustomColor().IconsColor,

                              ),
                            ),
                            overflow: TextOverflow.clip,
                          ),
                        ),

                      ],),



                    ],
                  ),
                ),



              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //Center Row contents horizontally,
              crossAxisAlignment: CrossAxisAlignment.center,
              //Center Row contents vertically,
              children: [
                Checkbox(
                  value: isChecked,
                  checkColor: Colors.white,
                  activeColor: CustomColor().IconsColor,

                  onChanged: (value){
                    setState(() {
                      isChecked = value;
                    });

                  },
                ),
                Flexible(
                  child: RichText(
                    text: const TextSpan(
                      text: 'I’ve read and understood the above statement. ',
                      style: TextStyle(
                        color: Color(0xFF625D5D),
                      ),
                    ),
                    overflow: TextOverflow.clip,
                  ),
                )
              ],

            ),
            CustomizedTextButton(
              text: 'Upload',
              buttonWidth: 132,
              buttonHeight: 39,
              border: "border",
              textColor: Colors.white,
              textFontSize: 18,
              backgroundColor: CustomColor().IconsColor,
              onPressed: () {
                Navigator.of(context).pop();

              },
            ),
          ],
        ),

      ),

    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
