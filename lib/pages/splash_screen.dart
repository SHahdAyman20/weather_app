import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
    splash: Image.asset(
          'assets/Sun cloud angled rain.png',
      ),
      nextScreen: HomePage(),
    splashTransition: SplashTransition.fadeTransition,
        duration: 2000,
    splashIconSize: 350,
    //pageTransitionType: PageTransitionType.leftToRightWithFade,
    animationDuration: Duration(seconds: 1),
      backgroundColor: Color(0xff0A2C63),



      );
  }
}
