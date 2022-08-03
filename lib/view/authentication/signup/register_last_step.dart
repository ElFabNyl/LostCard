import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/services/signup/phone_otp_verification.dart';
import 'package:lostcard/utils/validate_number.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/custom_color.dart';
import '../../reusable_widgets/custom_snack_bar.dart';
import '../../reusable_widgets/loading_indicator.dart';

class RegisterLastStep extends StatefulWidget {
  final String email;
  final String password;

  const RegisterLastStep({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  RegisterLastStepState createState() => RegisterLastStepState();
}

class RegisterLastStepState extends State<RegisterLastStep> {
  bool isPhoneNumberEmpty = false;

  bool isNameEmpty = false;

  TextEditingController enterNameController = TextEditingController();
  TextEditingController enterPhoneNumberController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  var verificationCode = '';

  String setData(String verificationId) {
    setState(() {
      verificationCode = verificationId;
    });

    return verificationCode;
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 99,
                    height: 37,
                    child: Image(
                      image: AssetImage('assets/images/small_logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 225,
                  height: 47,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 40,
                      //fontFamily:'Roboto',
                      fontWeight: FontWeight.bold,
                      color: CustomColor.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 350,
                    //height: 55,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.31,
                            height: 55,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFB1B1B1),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //Center Row contents vertically,

                              children: [
                                const SizedBox(
                                  height: 18,
                                  width: 20,
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/flag.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                const Text(
                                  "+237",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                        CustomizedTextField(
                          controller: enterPhoneNumberController,
                          labelText: 'Enter Phone Number',
                          prefixIcon: Icon(FontAwesomeIcons.phone,
                              color: CustomColor.primaryColor, size: 15),
                          suffixIcon: const Icon(null),
                          suffixIconBeforeTap: const Icon(null),
                          suffixIconOnTap: const Icon(null),
                          isStringInputType: false,
                          isPassword: false,
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: 52,
                          errorText:
                              isPhoneNumberEmpty ? "Can't be empty" : null,
                          onChanged: (_) {
                            enterPhoneNumberController.value.text.isEmpty
                                ? isPhoneNumberEmpty = true
                                : isPhoneNumberEmpty = false;

                            setState(() {});
                          },
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 46,
                ),
                CustomizedTextField(
                  controller: enterNameController,
                  labelText: 'Enter Name',
                  prefixIcon: Icon(FontAwesomeIcons.solidUser,
                      color: CustomColor.primaryColor, size: 15),
                  suffixIcon: const Icon(null),
                  suffixIconBeforeTap: const Icon(null),
                  suffixIconOnTap: const Icon(null),
                  isStringInputType: true,
                  isPassword: false,
                  width: 350,
                  height: 52,
                  errorText: isNameEmpty ? "Can't be empty" : null,
                  onChanged: (_) {
                    enterNameController.value.text.isEmpty
                        ? isNameEmpty = true
                        : isNameEmpty = false;

                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 86,
                ),
                SizedBox(
                  child: CustomizedTextButton(
                    text: 'CONTINUE',
                    buttonWidth: 129,
                    buttonHeight: 43,
                    border: 'border',
                    textColor: Colors.white,
                    textFontSize: 18,
                    backgroundColor: CustomColor.primaryColor,
                    onPressed: () async {
                      if (enterPhoneNumberController.value.text.isNotEmpty &&
                          enterNameController.value.text.isNotEmpty) {
                        if (enterPhoneNumberController.value.text.length != 9) {
                          CustomSnackBar().showCustomSnackBar(context,
                              'A good phone number must have 9 digits');
                        } else {
                          if (ValidateNumber().isNumber(
                              enterPhoneNumberController.value.text)) {
                            LoadingIndicator(this.context).startLoading();

                            await PhoneOTPVerification(FirebaseAuth.instance)
                                .verifyPhone(
                                    enterPhoneNumberController.value.text,
                                    setData,
                                    context,
                                    widget.email,
                                    widget.password);
                          } else {
                            CustomSnackBar().showCustomSnackBar(
                                context, 'A number cannot contain characters');
                          }
                        }
                      } else {
                        CustomSnackBar().showCustomSnackBar(
                            context, 'Please fill all the empty fields');

                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          )),
    ));
  }
}
