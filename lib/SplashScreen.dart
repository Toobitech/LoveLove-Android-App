import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'models/authentication/view/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  moveto() async {
    Future.delayed(Duration(seconds: 0), () => {Get.to(() => WelcomeScreen())});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            ScaleAnimatedText(
              'You are Awesome',
              duration: Duration(milliseconds: 3000),
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 44.0,
                  fontWeight: FontWeight.w900),
            ),
            ScaleAnimatedText(
              'Welcome',
              duration: Duration(milliseconds: 4000),
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
