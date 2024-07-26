import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:LoveLove/models/onboarding/onboarding_four.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingThreeScreen extends StatefulWidget {
  OnboardingThreeScreen({super.key});

  @override
  State<OnboardingThreeScreen> createState() => _OnboardingThreeScreenState();
}

class _OnboardingThreeScreenState extends State<OnboardingThreeScreen> {
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
                AppImages.onboarding4,
                height: Get.height * 0.5,
              ),
              vertical(20),
              Text(
                "Become",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: Get.height * 0.025,
                    fontWeight: FontWeight.normal),
              ),
              vertical(10),
              Text(
                "Your Own Best Friend",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: Get.height * 0.029,
                ),
              ),
              vertical(10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Find the self confidence you're looking for!! Select a guide to chat with or listen to our self love meditition and earn points ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: Get.height * 0.017),
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
                      Get.to(OnboardingFourScreen());
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
