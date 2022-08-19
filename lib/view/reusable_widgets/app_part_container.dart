

import 'package:flutter/material.dart';


import '../../constant/custom_color.dart';

class AppPartContainer extends StatelessWidget{
  final String partName;
  final IconButton backButton;


  const AppPartContainer({Key? key,
    required this.backButton,
    required this.partName,

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
          backButton,

           Align(alignment: Alignment.center,child: SizedBox(
               width: MediaQuery.of(context).size.width*0.63,
               child: Align(alignment: Alignment.center, child: Text(partName, style: TextStyle(fontSize:18, fontWeight: FontWeight.bold, color: CustomColor.primaryColor))))),

        ],

      ),



    ));

  }

}