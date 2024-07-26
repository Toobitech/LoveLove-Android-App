import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback tap;
  final Color? lgradient;
  final Color? dgradient;
  final bool isLoading;
  final String imageonly;
  const CustomButtonWidget(
      {super.key,
      required this.title,
      required this.tap,
      this.isLoading = false,
      required this.imageonly,
      this.lgradient,
      this.dgradient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                lgradient ?? AppColors.gradientLight,
                dgradient ?? AppColors.gradientDark
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(50)),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: AppColors.white,
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    imageonly,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: Get.height * 0.025,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                  SizedBox(
                    width: Get.width * 0.1,
                  )
                ],
              ),
      ),
    );
  }
}
