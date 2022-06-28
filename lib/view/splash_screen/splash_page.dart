import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  SplashPage({required this.goToPage, required this.duration});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => goToPage));
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF082E02),
          alignment: Alignment.center,
          child: const Image(
            image: AssetImage('assets/images/logo.png'),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}
