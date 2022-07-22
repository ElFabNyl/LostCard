import 'package:flutter/material.dart';

class CustomizedTextButton extends StatelessWidget {
  CustomizedTextButton({
    Key? key,
    required this.text,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.border,
    required this.textColor,
    required this.textFontSize,
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
                      MaterialStateProperty.all(const Color(0xFF082E02)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                          color: Color(0xFF082E02),
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
