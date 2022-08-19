import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import '../reusable_widgets/customized_text_field.dart';

class ModifyProfileDialog extends StatefulWidget {
  final String title;
  final String hintText;

  const ModifyProfileDialog(
      {Key? key, required this.title, required this.hintText})
      : super(key: key);

  @override
  ModifyProfileDialogState createState() => ModifyProfileDialogState();
}

class ModifyProfileDialogState extends State<ModifyProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        width: 395,
        height: 191,
        decoration:const BoxDecoration(
            color: Color(0xFFFDEAF5),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        child:  Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: widget.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    overflow: TextOverflow.clip,
                  ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomizedTextField(
                //controller: emailController,
                hintText: widget.hintText,
                prefixIcon: const Icon(null),
                suffixIcon: const Icon(null),
                suffixIconBeforeTap: const Icon(null),
                suffixIconOnTap: const Icon(null),
                isStringInputType: true,
                isPassword: false,
                width: 340,
                height: 52,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CustomizedTextButton(
                        text: 'Cancel',
                        buttonWidth: 85,
                        buttonHeight: 39,
                        border: "noBorder",
                        textColor: CustomColor.primaryColor,
                        textFontSize: 16,
                        backgroundColor: CustomColor.primaryColor,

                        onPressed: () {
                          Navigator.of(context).pop();
                        },

                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: CustomizedTextButton(
                        text: 'Save',
                        buttonWidth: 85,
                        buttonHeight: 39,
                        border: "noBorder",
                        textColor: CustomColor.primaryColor,
                        textFontSize: 16,
                        backgroundColor: CustomColor.primaryColor,

                        onPressed: () {
                          Navigator.of(context).pop();
                        },

                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );

  }
}
