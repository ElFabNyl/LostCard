import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_searching.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnboardingPageSearching()



        //goToPage: NavBarPagesManager(selectedIndex: 0)

        //goToPage: OnboardingPageSearching()

        );
  }
}
