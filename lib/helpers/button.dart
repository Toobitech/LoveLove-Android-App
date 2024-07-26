import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';

import 'const_text.dart';

Widget buttonMain(
  double width,
  String text,
  VoidCallback ontap, {
  Color? bgColor,
  Color? tColor,
  Color? bColor,
  FontWeight? fweight,
  double? height,
  double? tsize,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      width: Get.width * width,
      height: height ?? 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            bgColor ?? AppColors.gradientLight,
            bgColor ?? AppColors.gradientDark
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        border: Border.all(width: 1, color: bColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontWeight: fweight ?? FontWeight.bold,
              color: tColor ?? AppColors.white,
              fontSize: tsize ?? Get.height * 0.024),
        ),
      ),
    ),
  );
}
