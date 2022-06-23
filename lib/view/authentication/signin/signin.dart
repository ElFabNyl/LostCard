import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_screen1.dart';

class Signin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
          child: Container(

              child: Column(
                children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                    alignment: Alignment.centerLeft,
                    child: const Image(
                      image: AssetImage('assets/images/small_logo.png'),


                    ),

                  ),
                  Container(

                    margin: EdgeInsets.fromLTRB(20, 50, 20, 0),


                    child: Text(
                      "Sign in",
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

                    child: CustomizedTextField(labelText: 'Email Address',icon: const Icon(FontAwesomeIcons.solidUser, color: Color(0xFF023607)),)

                  ),



                  Container(

                      margin: EdgeInsets.fromLTRB(20, 00, 20, 0),

                      child: CustomizedTextField(labelText: 'Password',icon: Icon(FontAwesomeIcons.key, color: Color(0xFF023607), ),)

                  ),

                  Container(margin:  EdgeInsets.fromLTRB(20, 20, 20, 0),
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 130,
                      height: 39,
                      child: TextButton(

                        child: Text('Forgot password',
                          style: TextStyle(fontSize: 12.0, color: Color(0xFF444444)),),
                        style: ButtonStyle(



                            ), onPressed: () {

                      },

                        ),

                      ),),



                  Container(child: CustomizedTextButton(text: 'LOGIN', widget: OnboardingScreeen1(),buttonWidth:340,buttonHeight: 55,),),


                  Container(

                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),


                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 16,
                        //fontFamily:'Roboto',
                        fontWeight: FontWeight.normal,
                        color: Colors.black,


                      ),
                      textAlign: TextAlign.center,
                    ),

                  ),
                  Container(margin: EdgeInsets.all(25),
                    child: SizedBox(
                      width: 340,
                      height: 55,
                      child: TextButton(

                        child: Text('Connect with Google',
                          style: TextStyle(fontSize: 16.0, color: Color(0xFF003363)
                              ),),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color(
                                0x30296803),),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  //side: BorderSide(color: Colors.black,)

                              ),


                            )

                        ), onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OnboardingScreeen1()),
                        );
                      },

                      ),
                    ),),

                  Container(//margin:EdgeInsets.fromLTRB(20, 0, 0, 20),
                    //width: 236,
                    //height: 27,
                    margin: EdgeInsets.fromLTRB(90, 20, 90, 0),
                    alignment: Alignment.center,

                    child:Row(

                      crossAxisAlignment: CrossAxisAlignment.center,

                      children: [
                        Container(

                         // margin: EdgeInsets.all(20),

                          child: Text(
                            "Don't have an account yet?",

                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,

                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Container(//margin: EdgeInsets.all(20),
                          alignment: Alignment.centerRight,

                          child: SizedBox(
                            //width: 20,
                            //height: 55,

                            child: TextButton(

                              child: Text('Sign up',
                                style: TextStyle(fontSize: 14.0, color: Color(0xFF133E04)
                                ),),
                               onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signup()),
                              );
                            },

                            ),
                          ),),

                      ],
                    )
                  ),

                ],


              )
          ),



        ));
    throw UnimplementedError();
  }

}