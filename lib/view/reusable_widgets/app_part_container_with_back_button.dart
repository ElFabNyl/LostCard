

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/custom_color.dart';

class AppPartContainerWithBackButton extends StatelessWidget{
  final String partName;
  final void Function()? onPressed;

  const AppPartContainerWithBackButton({Key? key,
    required this.partName,
    this.onPressed,
}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),

      child: Row(
        
        children: [
          IconButton(
                  onPressed: onPressed,
                  icon:  Icon(FontAwesomeIcons.angleLeft, color: CustomColor.primaryColor,)),
          const SizedBox(width: 30,),

           Text(partName, style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, color: CustomColor.primaryColor)),

        ],

      ),



    ));

  }

}