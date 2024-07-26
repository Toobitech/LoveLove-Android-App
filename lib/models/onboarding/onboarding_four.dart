import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:LoveLove/models/onboarding/onboarding_five.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingFourScreen extends StatefulWidget {
  OnboardingFourScreen({super.key});

  @override
  State<OnboardingFourScreen> createState() => _OnboardingFourScreenState();
}

class _OnboardingFourScreenState extends State<OnboardingFourScreen> {
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
                AppImages.onboarding5,
                height: Get.height * 0.5,
              ),
              vertical(20),
              Text(
                "Bring More Love into Your",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: Get.height * 0.024,
                    fontWeight: FontWeight.normal),
              ),
              // vertical(10),
              Text(
                "Friends & Family Group",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: Get.height * 0.028,
                ),
              ),
              vertical(10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    // "The opportunity to involve both yourself and your\nfamily in the heartwarming journey of finding love\nCouldn't be more magical",
                    "What couldn't be more magical than seeing the people you love in love!! Here we offer the opportunity for you to help them!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.black,
                        fontSize: Get.height * 0.017,
                        fontWeight: FontWeight.normal),
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
                      Get.to(OnboardingFiveScreen());
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
