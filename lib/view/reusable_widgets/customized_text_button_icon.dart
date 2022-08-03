import 'package:flutter/material.dart';


class CustomisedTextButtonIcon extends StatelessWidget {
  final Icon buttonIcon;
  final Text labelText;
  final Color backgroundColor;
  final double width;
  final double height;
  final void Function()? onPressed;

  const CustomisedTextButtonIcon({
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


  }
}
