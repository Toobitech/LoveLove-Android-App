import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'colors.dart';

class OnBoardngCustomButton extends StatelessWidget {
  final String title;
  final Color bgColor;
  VoidCallback? ontap;
  OnBoardngCustomButton(
      {super.key,
      required this.title,
      required this.bgColor,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        // width: Get.width * width,
        // height: height ?? 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              bgColor ?? AppColors.gradientLight,
              bgColor ?? AppColors.gradientDark
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // border: Border.all(width: 1,  Colors.transparent),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                fontSize: Get.height * 0.02),
          ),
        ),
      ),
    );
  }
}
