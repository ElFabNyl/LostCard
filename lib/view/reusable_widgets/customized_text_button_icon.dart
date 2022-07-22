import 'package:flutter/material.dart';
import '../onboarding_screens/onboarding_page_registering_signaling.dart';

class CustomisedTextButtonIcon extends StatelessWidget {
  Icon buttonIcon;
  Text labelText;
  Color backgroundColor;
  double width;
  double height;
  void Function()? onPressed;

  CustomisedTextButtonIcon({
    Key? key,
    required this.buttonIcon,
    required this.labelText,
    required this.backgroundColor,
    required this.width,
    required this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: width,
      height: height,
      child: TextButton.icon(
        onPressed:onPressed,
        icon: buttonIcon,
        label: labelText,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                //side: BorderSide(color: Colors.black,)
              ),
            )),
      ),
    ));

    throw UnimplementedError();
  }
}
