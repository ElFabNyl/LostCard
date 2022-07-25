

import 'package:flutter/material.dart';

import '../../constant/custom_color.dart';

class AppPartContainer extends StatelessWidget{
  final String partName;

  AppPartContainer({Key? key,
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
        child:  Align(
            alignment: Alignment.centerLeft,
            child: Text(partName, style: TextStyle(fontSize:24, fontWeight: FontWeight.bold, color: CustomColor().IconsColor)),
      ),
    ));

    throw UnimplementedError();
  }

}