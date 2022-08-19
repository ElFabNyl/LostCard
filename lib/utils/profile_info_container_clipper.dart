


import 'package:flutter/material.dart';

class ProfileInfoContainerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);



    path.lineTo(size.width, size.height );
    path.lineTo(size.width, 0);

    path.lineTo(size.width/1.6, 0);
     var firstControlPoint = Offset((size.width)/2, 40);
     var firstEndPoint = Offset(size.width/2.8 , size.height/20 );
     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}