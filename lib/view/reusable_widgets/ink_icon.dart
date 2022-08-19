
import 'package:flutter/material.dart';

import '../../constant/custom_color.dart';

class InkIcon extends StatelessWidget{
  final IconData icon;
  final void Function() onTap;

  const InkIcon({Key? key,
    required this.icon,
    required this.onTap,

}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Material(
     elevation: 5,
     type: MaterialType.transparency,
     child: Ink(
       decoration: BoxDecoration(
         border: Border.all(width: 0.1, color: CustomColor.primaryColor ),
         color: const Color(0x116750A4),
         borderRadius: BorderRadius.circular(10.0),
       ),
       child: InkWell(
         onTap: onTap,

         borderRadius: BorderRadius.circular(10.0),
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Icon(icon, color: CustomColor.primaryColor,),
         ),
       ),
     ),
   );
  }

}