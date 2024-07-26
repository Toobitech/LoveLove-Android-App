import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';

import '../../global/bottomsmallStyle.dart';
import '../../helpers/assets.dart';
import '../../helpers/colors.dart';
import '../../helpers/spacer.dart';

class QuertSentToAdmin extends StatefulWidget {
  const QuertSentToAdmin({super.key});

  @override
  State<QuertSentToAdmin> createState() => _QuertSentToAdminState();
}

class _QuertSentToAdminState extends State<QuertSentToAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: BottomSmallStyle(
        top: false,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200, left: 50),
              child: Center(child: Image.asset(AppImages.successfully)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Center(
                  child: Text(
                'Your request has been',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Center(
                  child: Text(
                'sent to the admin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              )),
            ),
            vertical(130),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: () {
                      Get.to(DiscoverMain());
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
