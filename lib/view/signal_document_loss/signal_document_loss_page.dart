import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/reusable_widgets/app_part_container_with_back_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';



class SignalDocumentLossPage extends StatefulWidget {
  const SignalDocumentLossPage({Key? key}) : super(key: key);

  @override
  SignalDocumentLossPageState createState() =>
      SignalDocumentLossPageState();
}

class SignalDocumentLossPageState
    extends State<SignalDocumentLossPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppPartContainerWithBackButton(
                  partName: "Signal Document Loss ",
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NavBarPagesManager(
                                selectedIndex: 0,
                              )),
                    );
                  }),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Document Information',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomizedTextField(
                      //controller: emailController,
                      labelText: 'Enter your Name',
                      prefixIcon: Icon(FontAwesomeIcons.solidUser,
                          color: CustomColor.primaryColor, size: 15),
                      suffixIcon: const Icon(null),
                      suffixIconBeforeTap: const Icon(null),
                      suffixIconOnTap: const Icon(null),
                      isStringInputType: true,
                      isPassword: false,
                      width: 343,
                      height: 52,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomizedTextField(
                      //controller: emailController,
                      labelText: 'Enter address where lost',
                      prefixIcon: Icon(FontAwesomeIcons.solidAddressBook,
                          color: CustomColor.primaryColor, size: 15),
                      suffixIcon: const Icon(null),
                      suffixIconBeforeTap: const Icon(null),
                      suffixIconOnTap: const Icon(null),
                      isStringInputType: true,
                      isPassword: false,
                      width: 343,
                      height: 52,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Comments',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B6A6A)),
                        )),
                    const SizedBox(
                      height: 10,
                    ),

                    const SizedBox(
                      height: 80,
                    ),
                    CustomizedTextButton(
                      text: 'Next',
                      buttonWidth: 247,
                      buttonHeight: 43,
                      border: "border",
                      textColor: Colors.white,
                      textFontSize: 16,
                      backgroundColor: CustomColor.primaryColor,
                      onPressed: () {

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
