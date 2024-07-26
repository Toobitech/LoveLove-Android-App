import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingFiveScreen extends StatefulWidget {
  OnboardingFiveScreen({super.key});

  @override
  State<OnboardingFiveScreen> createState() => _OnboardingFiveScreenState();
}

class _OnboardingFiveScreenState extends State<OnboardingFiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              vertical(20),
              Image.asset(
                AppImages.onboarding1,
                height: Get.height * 0.5,
              ),
              vertical(20),
              // Text(
              //   "Secure Converstion with",
              //   style: TextStyle(
              //       color: AppColors.black,
              //       fontSize: 24.0,
              //       fontWeight: FontWeight.normal),
              // ),
              // vertical(10),
              Text(
                "Ready to Start",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.pink,
                  fontSize: Get.height * 0.03,
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Begin your journey to love and serenity now",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                        fontSize: Get.height * 0.015),
                  )),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnBoardngCustomButton(
                    title: 'Login',
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    bgColor: Color.fromARGB(255, 6, 106, 189),
                  ),
                  SizedBox(width: 30),
                  OnBoardngCustomButton(
                    title: 'Signup',
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    bgColor: AppColors.pink,
                  ),
                ],
              ),
              vertical(100)
            ],
          ),
        ));
  }
}
