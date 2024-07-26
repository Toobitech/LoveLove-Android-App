import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback tap;
  const CustomButton({super.key, required this.title, required this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: tap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.gradientLight, AppColors.gradientDark],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: Get.height * 0.02,
              fontWeight: FontWeight.w700,
              color: AppColors.white),
        )),
      ),
    );
  }
}
