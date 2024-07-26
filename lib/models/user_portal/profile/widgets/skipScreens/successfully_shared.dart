import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../helpers/assets.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/spacer.dart';
import '../../../discover/view/discoverMain.dart';

class SuccessfullyShared extends StatefulWidget {
  const SuccessfullyShared({super.key});

  @override
  State<SuccessfullyShared> createState() => _SuccessfullySharedState();
}

class _SuccessfullySharedState extends State<SuccessfullyShared> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => DiscoverMain());
            },
            icon: Icon(
              Icons.home,
              color: AppColors.gradientLight,
            )),
      ),
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
                'Link Successfully Shared',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              )),
            ),
            vertical(150),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
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
