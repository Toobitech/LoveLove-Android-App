import 'package:flutter/material.dart';

import '../../../helpers/assets.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/const_text.dart';

Widget accountLogin(String text1, String text2, VoidCallback ontap) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mediumtext(AppColors.black, 12, text1),
          TextButton(
              onPressed: ontap, child: mediumtext(Colors.blue, 12, text2))
        ],
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     socialWidget(AppImages.facebook_Icon, () {}),
      //     socialWidget(AppImages.instagram_Icon, () {}),
      //     socialWidget(AppImages.twiter_Icon, () {}),
      //   ],
      // )
    ],
  );
}

Widget socialWidget(String img, VoidCallback ontap) {
  return InkWell(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Image.asset(
        img,
        height: 20,
        fit: BoxFit.cover,
      ),
    ),
  );
}
