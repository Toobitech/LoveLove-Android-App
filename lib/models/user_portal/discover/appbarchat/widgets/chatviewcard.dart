import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/colors.dart';
import '../../../../../helpers/const_text.dart';

class ChatViewCard extends StatelessWidget {
  bool isMe;
  String text;
  ChatViewCard({super.key, required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Get.width * 0.6,
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.only(
          bottom: 10,
          left: isMe == true ? 0 : 100,
          right: isMe == true ? 100 : 0),
      decoration: BoxDecoration(
          color: AppColors.lightpink,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomRight: Radius.circular(isMe == true ? 20 : 0),
            bottomLeft: Radius.circular(isMe == true ? 0 : 20),
          )),
      child: Align(
          alignment:
              isMe == true ? Alignment.centerLeft : Alignment.centerRight,
          child: boldtext(AppColors.black, 12, text)),
    );
  }
}
