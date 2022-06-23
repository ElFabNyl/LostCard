import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signup/signup1.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
          child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            alignment: Alignment.centerLeft,
            child: const Image(
              image: AssetImage('assets/images/small_logo.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Text(
              "Sign up",
              style: TextStyle(
                fontSize: 40,
                //fontFamily:'Roboto',
                fontWeight: FontWeight.bold,
                color: Color(0xFF023607),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
              alignment: Alignment.centerLeft,
              child: CustomizedTextField(
                labelText: 'Email Address',
                icon:
                    Icon(FontAwesomeIcons.solidUser, color: Color(0xFF023607)),
              )),
          Container(
              margin: EdgeInsets.fromLTRB(20, 00, 20, 41),
              child: CustomizedTextField(
                labelText: 'Password',
                icon: Icon(FontAwesomeIcons.key, color: Color(0xFF023607)),
              )),
          Container(
            child: CustomizedTextButton(
              text: 'Continue',
              widget: Signup1(),
              buttonWidth: 129,
              buttonHeight: 43,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 103, 20, 0),
            alignment: Alignment.center,
            child: SizedBox(
              width: 130,
              height: 39,
              child: TextButton(
                child: Text(
                  'sign in instead',
                  style: TextStyle(fontSize: 14.0, color: Color(0xFF012405)),
                ),
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                },
              ),
            ),
          ),
        ],
      )),
    ));
    throw UnimplementedError();
  }
}
