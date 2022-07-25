
import 'package:flutter/material.dart';
import 'package:lostcard/view/register_found_document/register_found_document_document_information.dart';
import 'package:lostcard/view/register_found_document/register_found_document_pictures.dart';
import 'package:lostcard/view/signal_document_loss/signal_document_loss_document_information.dart';

import '../../constant/custom_color.dart';
import 'customized_text_button.dart';

class AddLostFoundCardDialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      backgroundColor: Colors.transparent,


      child: Container(
        //padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 340,
        height: 284,
        decoration: const BoxDecoration(
            color: Colors.white,

            borderRadius:  BorderRadius.all(Radius.circular(15))
        ),

          child: Column(
            children: [

              Container(
                width: 340,
                height: 112,
                color: Color(0x10023607),
                child: const Align(
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage('assets/images/post_online.png'),
                  ),
                ),

              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),

                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Post a document',
                        style:  TextStyle(color: CustomColor().IconsColor,fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),


                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Register a document you have found or lost',
                        style:  TextStyle(color: Color(0xFF373333),fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 40,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [


                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomizedTextButton(
                            text: 'Found',
                            buttonWidth: 132,
                            buttonHeight: 39,
                            border: "border",
                            textColor: Colors.white,
                            backgroundColor: CustomColor().IconsColor,
                            textFontSize: 18,
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterFoundDocumentDocumentInformation()),
                              );
                            },

                          ),
                        ),


                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomizedTextButton(
                            text: 'Lost',
                            buttonWidth: 132,
                            buttonHeight: 39,
                            border: "border",
                            textColor: Colors.white,
                            backgroundColor: Colors.red,
                            textFontSize: 18,
                            onPressed: (){
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignalDocumentLossDocumentInformation()),
                              );

                            },

                          ),
                        )

                      ],
                    )

                  ],
                ),

              ),



            ],

          ),


      ),
    );

    throw UnimplementedError();
  }

}