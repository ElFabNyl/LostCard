import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/custom_color.dart';
import '../../reusable_widgets/customized_text_button.dart';
import '../../reusable_widgets/customized_text_field.dart';
import 'otp_verification_signin.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  NewPasswordState createState() => NewPasswordState();
}

class NewPasswordState extends State<NewPassword> {
  TextEditingController enterNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 264,
                child: Text(
                  'New Password',
                  style: TextStyle(
                    fontSize: 20,
                    //fontFamily:'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF023607),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter new password',
                  style: TextStyle(
                    fontSize: 20,
                    //fontFamily:'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                child: CustomizedTextField(
                  controller: enterNewPasswordController,
                  labelText: 'Password',
                  prefixIcon: Icon(FontAwesomeIcons.key,
                      color: CustomColor().IconsColor, size: 15),
                  suffixIcon: const Icon(null),
                  suffixIconBeforeTap: Icon(FontAwesomeIcons.eyeLowVision,
                      color: CustomColor().IconsColor, size: 15),
                  suffixIconOnTap: Icon(FontAwesomeIcons.solidEye,
                      color: CustomColor().IconsColor, size: 15),
                  isStringInputType: true,
                  isPassword: true,
                  hintText: '********************',
                  width: 350,
                  height: 52,
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              CustomizedTextButton(
                text: 'SUBMIT',
                buttonWidth: 129,
                buttonHeight: 43,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
                  backgroundColor: CustomColor().IconsColor,
              ),
            ],
          ),
        ),
      ),
    ));
    throw UnimplementedError();
  }
}
