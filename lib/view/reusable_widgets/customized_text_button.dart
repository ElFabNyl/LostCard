import 'package:flutter/material.dart';

class CustomizedTextButton extends StatelessWidget {
  String text = "";
  Widget widget;
  double buttonWidth;
  double buttonHeight;
  String borderType;
  Color textColor;
  double textFontSize;

  CustomizedTextButton(
      {required this.text,
      required this.widget,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.borderType,
      required this.textColor,
      required this.textFontSize});

  @override
  Widget build(BuildContext context) {
    switch (borderType) {
      case "border":
        {
          return (SizedBox(
            width: buttonWidth,
            height: buttonHeight,
            child: TextButton(
              child: Text(
                text,
                style: TextStyle(fontSize: textFontSize, color: textColor),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
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
                style: TextStyle(fontSize: 18.0, color: textColor),
              ),
              style: const ButtonStyle(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => widget),
                );
              },
            ),
          ));
        }
        break;
    }

    throw UnimplementedError();
  }
}
