
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';

import 'custom_found_notification_dialog.dart';

class CustomFoundCard extends StatefulWidget {
  void Function()? onPressed;

  CustomFoundCard({Key? key, this.onPressed}) : super(key: key);

  CustomFoundCardState createState() => CustomFoundCardState();
}

class CustomFoundCardState extends State<CustomFoundCard> {
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
        width: 340,
        height: 248,
      child: Stack(
        children: <Widget>[
          

          Positioned(
            top: 40,
            child: Container(
              width: 334,
              height: 234,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: const Color(0xFFD9D9D9),
              child: Column(
                children: [
                  const SizedBox(height: 40,),

                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        //Center Row contents horizontally,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        //Center Row contents vertically,
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft ,
                            child:  SizedBox(
                              //width: 95,
                              //height: 59,
                              child: Image(
                                image: AssetImage(
                                    'assets/images/paul.png'),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //Center Row contents vertically,
                            children: [
                              const Text(
                                'View more',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red),
                              ),
                              IconButton(
                                  onPressed: widget.onPressed,
                                  icon: const Icon(
                                    FontAwesomeIcons.solidEye,
                                    color: Colors.red, size: 15,
                                  ))
                            ],
                          )
                        ],
                      ),


                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Row(
                              children:const  [
                                Text('Found date:'),
                                SizedBox(width: 2,),
                                Text('10/02/22')
                              ],
                            ),

                            Row(
                              children: const[
                                Text('Found at:'),
                                SizedBox(width: 2,),
                                Text('Messassi')
                              ],
                            ),

                            const SizedBox (height: 10),




                            Row(
                              children:  [

                                Flexible(
                                  child: RichText(
                                    text:  TextSpan(
                                        text:  '"I found it near the total, just opposite the main road"', style: TextStyle(color: CustomColor().IconsColor,)
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                )

                              ],
                            ),

                            const SizedBox(height: 10,),



                            const Text('Nathalie'),


                          ],
                        ),
                      )

                    ],
                  ),


                      CustomizedTextButton(
                          text: 'Get Number of Card Founder',
                          buttonWidth: 254,
                          buttonHeight: 60,
                          border: 'noBorder',
                          textColor: Colors.red,
                          textFontSize: 16,
                          backgroundColor: CustomColor().IconsColor,
                          onPressed: (){
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return FoundNotificationDialog();
                                }
                            );
                          },
                      )






                ],
              ) ,






            ),
          ),



          Positioned(
            top: 20,
            left: 40,
            right: 40,
            child: Container(
                width:238,
                  height: 42,
                  alignment: Alignment.center,
                  color:  CustomColor().IconsColor,

                  child: const Text(
                    'DOCUMENT NAME',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                    textAlign: TextAlign.center,
                  )
              ),
          ),

        ],
      )));













    throw UnimplementedError();
  }
}
