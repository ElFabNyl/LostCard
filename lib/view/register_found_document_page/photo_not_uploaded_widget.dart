import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhotoNotUploadedWidget extends StatelessWidget {
  final void Function() onTap;

  const PhotoNotUploadedWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width*0.42,
          height: 195,
          decoration: BoxDecoration(
              color: const Color(0xFFFBBEE3),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.camera,
                color: Colors.white,
                size: 25,
              ),
              Text(
                'Upload Picture',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )
            ],
          )),
    );
  }
}
