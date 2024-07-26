import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('HitBackButton');
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.only(top: 10, right: 7, left: 10, bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: AppColors.black, blurRadius: 6, offset: Offset(0.1, 0.1))
          ],
        ),
        // child: Image.asset(
        //   AppImages.backButton,
        //   height: 25,
        //   width: 25,
        //   fit: BoxFit.cover,
        // ),
        child: Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: AppColors.pink,
        ),
      ),
    );
  }
}
