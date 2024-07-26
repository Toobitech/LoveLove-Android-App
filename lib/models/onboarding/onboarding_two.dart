import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:LoveLove/models/onboarding/onboarding_three.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingTwoScreen extends StatefulWidget {
  OnboardingTwoScreen({super.key});

  @override
  State<OnboardingTwoScreen> createState() => _OnboardingTwoScreenState();
}

class _OnboardingTwoScreenState extends State<OnboardingTwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Column(
            children: [
              // vertical(70),
              // Image.asset(
              //   AppImages.logo_Icon,
              //   height: Get.height * 0.1,
              // ),
              vertical(20),
              Image.asset(
                AppImages.onboarding3,
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
              // .animate()
              // .slide(delay: 300.ms, duration: Duration(milliseconds: 5000)),

              Text(
                "Find a connection",
                style: TextStyle(
                  color: AppColors.pink,
                  fontWeight: FontWeight.bold,
                  fontSize: Get.height * 0.028,
                ),
              ),
              // Text(
              //   "FACE ID VERIFICATION",
              //   style: TextStyle(
              //     color: AppColors.pink,
              //     fontSize: 25,
              //   ),
              // ).animate().fadeIn(curve: Curves.easeInOut).scale(),
              vertical(10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Text(
                    "Engaging in fulfilling coversations",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Get.height * 0.018),
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
                      Get.to(OnboardingThreeScreen());
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
