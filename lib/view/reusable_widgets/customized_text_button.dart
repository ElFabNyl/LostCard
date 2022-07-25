import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';

class CustomizedTextButton extends StatelessWidget {
  CustomizedTextButton({
    Key? key,
    required this.text,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.border,
    required this.textColor,
    required this.textFontSize,
    required this.backgroundColor,
    this.onPressed,
    this.textAlignment,

  }) : super(key: key);

  String text;


  double buttonWidth;
  double buttonHeight;
  String border;
  Color textColor;
  double textFontSize;
  TextAlign? textAlignment = TextAlign.end;
  Color backgroundColor = CustomColor().IconsColor;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    switch (border) {
      case "border":
        {
          return (SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: TextButton(
              child: Text(
                text,
                textAlign: textAlignment,
                style: TextStyle(
                  fontSize: textFontSize,
                  color: textColor,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(backgroundColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                          color: backgroundColor,
                        )),
                  )),
              onPressed: onPressed,
            ),
          ));
        }
        break;

      case "noBorder":
        {
          return (SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(fontSize: textFontSize, color: textColor),
              ),
              style: const ButtonStyle(),
              onPressed: onPressed,
            ),
          ));
        }
        break;
    }

    throw UnimplementedError();
  }
}
