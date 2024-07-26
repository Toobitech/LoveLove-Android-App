import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:LoveLove/models/onboarding/onboarding_two.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingOneScreen extends StatefulWidget {
  OnboardingOneScreen({super.key});

  @override
  State<OnboardingOneScreen> createState() => _OnboardingOneScreenState();
}

class _OnboardingOneScreenState extends State<OnboardingOneScreen> {
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
                AppImages.onboarding2,
                height: Get.height * 0.5,
              ),

              vertical(20),
              Text(
                "Secure Converstion with",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: Get.height * 0.026,
                    fontWeight: FontWeight.normal),
              ),

              vertical(10),
              // .animate()
              // .slide(delay: 300.ms, duration: Duration(milliseconds: 5000)),

              Text(
                "FACE ID VERIFICATION",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: Get.height * 0.026,
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
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Text(
              //       "Experience in every interaction our unique Face ID Recognition! It ensures you're always chatting with verified individuals",
              //       textAlign: TextAlign.center,
              //     )),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Come experience our unique facial recognization ID software to ensure you're always chatting with a verified individual",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Get.height * 0.017),
                  )),
              vertical(10),
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
                      Get.to(OnboardingTwoScreen());
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
