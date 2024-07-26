import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';

class BottomStyle extends StatelessWidget {
  Widget body;
  BottomStyle({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Get.height * 0.6,
            width: Get.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bottom_style),
                    fit: BoxFit.fill)),
          ),
        ),
        body
        // body,
      ],
    );
  }
}
