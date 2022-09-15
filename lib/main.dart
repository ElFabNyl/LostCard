import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/utils/manage_shared_preferences.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_searching.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    ManageSharedPreferences.isNewUser = await SharedPreferences.getInstance();





  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        home:!(ManageSharedPreferences.isNewUser.getBool('seenOnboardingScreens')!=null&&ManageSharedPreferences.isNewUser.getBool('seenOnboardingScreens'))?const OnboardingPageSearching():const SignIn()



        //goToPage: NavBarPagesManager(selectedIndex: 0)

        //goToPage: OnboardingPageSearching()

        );
  }
}
