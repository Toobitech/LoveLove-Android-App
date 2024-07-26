import 'package:LoveLove/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';

class BottomSmallStyle extends StatelessWidget {
  Widget body;
  bool? botom;
  bool? top;
  double? topHeight;
  BottomSmallStyle(
      {super.key, required this.body, this.botom, this.top, this.topHeight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        top == false
            ? const SizedBox.shrink()
            : Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: Get.height * (topHeight ?? 0.32),
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // colorFilter:
                          //     ColorFilter.mode(AppColors.pink, BlendMode.color),
                          image: AssetImage(AppImages.topX),
                          fit: BoxFit.fill)),
                ),
              ),
        botom == false
            ? const SizedBox.shrink()
            : Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: Get.height * 0.1,
                  width: Get.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          // colorFilter:
                          //     ColorFilter.mode(AppColors.pink, BlendMode.color),
                          image: AssetImage(AppImages.bottomsmall),
                          fit: BoxFit.fill)),
                ),
              ),
        body
        // body,
      ],
    );
  }
}

class BottomSmallStyle2 extends StatelessWidget {
  Widget body;
  BottomSmallStyle2({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: Get.height * 0.32,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.topX), fit: BoxFit.fill)),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height * 0.1,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bottomsmall),
                    fit: BoxFit.fill)),
          ),
        ),
        body
        // body,
      ],
    );
  }
}
