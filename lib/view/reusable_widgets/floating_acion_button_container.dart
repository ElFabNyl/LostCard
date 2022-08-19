
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button_icon.dart';

import '../register_found_document_page/register_found_document_page.dart';
import '../signal_document_loss/signal_document_loss_page.dart';

class FloatingActionButtonContainer extends StatelessWidget{
  const FloatingActionButtonContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      //elevation: 2,
      backgroundColor: Colors.transparent,
      child:  Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 395,
        height: 250,
        decoration: const BoxDecoration(
            color: Colors.transparent,
            //borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
            children: [
            CustomisedTextButtonIcon(
              width: 190,
              height: 40,
              backgroundColor: CustomColor.primaryColor,
              labelText: const Text(
                'I found a document',
                style: TextStyle(color: Colors.white),
              ),
              buttonIcon: const Icon(
                FontAwesomeIcons.plus,
                size: 12,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const RegisterFoundDocumentPage()),
                );
              },
            ),


              const SizedBox(height: 20,),

              CustomisedTextButtonIcon(
                width: 190,
                height: 40,
                backgroundColor: const Color(0xFFB880FE),
                labelText: const Text(
                  'I lost a document',
                  style: TextStyle(color: Colors.white),
                ),
                buttonIcon: const Icon(
                  FontAwesomeIcons.plus,
                  size: 12,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignalDocumentLossPage()),
                  );
                },
              )
          ],
                ),
      ),
            );

  }

}