import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../helpers/onboarding_custom_button.dart';

class OnboardingSixScreen extends StatefulWidget {
  OnboardingSixScreen({super.key});

  @override
  State<OnboardingSixScreen> createState() => _OnboardingSixScreenState();
}

class _OnboardingSixScreenState extends State<OnboardingSixScreen> {
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
                AppImages.onboarding6,
                height: Get.height * 0.5,
              ),
              vertical(20),
              Text(
                "Secure Converstion with",
                style: TextStyle(
                    color: AppColors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.normal),
              ),
              vertical(10),
              Text(
                "FACE ID VERIFICATION",
                style: TextStyle(
                  color: AppColors.pink,
                  fontSize: 25,
                ),
              ),
              vertical(10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Experience in every interaction our unique Face ID Recognition! It ensures you're always chatting with verified individuals",
                    textAlign: TextAlign.center,
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
