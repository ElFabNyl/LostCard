import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lostcard/view/home_page/home_page.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/splash_screen/splash_page.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_searching.dart';

import 'constant/custom_color.dart';









Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();




  runApp(MyApp());

}


class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(duration: 10, goToPage:NavBarPagesManager(selectedIndex: 0) )

        //goToPage: NavBarPagesManager(selectedIndex: 0)

        //goToPage: OnboardingPageSearching()

    );
  }
}
