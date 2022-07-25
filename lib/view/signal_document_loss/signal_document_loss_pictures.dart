
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/success_registered_post_dialog.dart';

import '../../constant/custom_color.dart';
import '../reusable_widgets/app_part_container.dart';
import '../reusable_widgets/customized_text_button.dart';

class SignalDocumenttLossPictures extends StatefulWidget{

  SignalDocumentLossPicturesState createState() => SignalDocumentLossPicturesState();
}

class SignalDocumentLossPicturesState extends State<SignalDocumenttLossPictures>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainer(partName: "Signal Document Loss"),

              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    const SizedBox(height:40),
                    const Align(alignment:Alignment.centerLeft,
                        child: Text('Pictures', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)),
                    const SizedBox(height: 10,),

                    Container(
                        width: 345,
                        height: 298,
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        color: const Color(0x10023607),
                        child:Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 154,
                                  height: 126,
                                  color: const Color(0xFFFEFAFA),
                                ),

                                Container(
                                  width: 154,
                                  height: 126,
                                  color: const Color(0xFFFEFAFA),
                                )
                              ],

                            ),
                          ],
                        )

                    ),




                    const SizedBox(height: 20,),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Badge(
                        position: BadgePosition.topStart(top: 0, start: 0),
                        badgeColor: Colors.transparent,
                        badgeContent: const Text(
                          '+',
                          style: TextStyle(color: Color(0xFF023607), fontSize: 15),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0x80D9D9D9),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            icon:  Icon(FontAwesomeIcons.camera, color: CustomColor().IconsColor, size: 25,),
                            tooltip: 'Take a picture',
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(
                      height: 10,
                    ),



                    Align(
                      alignment: Alignment.centerRight,
                      child: Badge(
                        position: BadgePosition.topStart(top: 0, start: 0),
                        badgeColor: Colors.transparent,
                        badgeContent: const Text(
                          '+',
                          style: TextStyle(color: Color(0xFF023607), fontSize: 15),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color:  Color(0x80D9D9D9),
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            icon:  Icon(FontAwesomeIcons.file, color: CustomColor().IconsColor, size: 25,),
                            tooltip: 'Upload a file',
                            onPressed: () {

                            },
                          ),
                        ),
                      ),
                    ),



                    const SizedBox(
                      height: 20,
                    ),

                    CustomizedTextButton(
                      text: 'Finish',
                      buttonWidth: 247,
                      buttonHeight: 43,
                      border: "border",
                      textColor: Colors.white,
                      textFontSize: 16,
                      backgroundColor: CustomColor().IconsColor,
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SuccessRegisteredPostDialog(textMessage: 'We have successfully registered your document loss on our platform');
                            });
                      },

                    ),
                  ],
                ),

              ),
            ],
          ),
        ),

      ),
    );

    throw UnimplementedError();
  }

}