import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../helpers/assets.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/spacer.dart';
import 'successfully_shared.dart';

class ShareLink extends StatefulWidget {
  const ShareLink({super.key});

  @override
  State<ShareLink> createState() => _ShareLinkState();
}

class _ShareLinkState extends State<ShareLink> {
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
            InkWell(
              onTap: () {
                Get.to(() => SuccessfullyShared());
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: ((context) => successfully_shared())));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 300,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: Color(0xff60D669)),
                      color: Color(0xff60D669)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.1, left: 20),
                    child: ListTile(
                      leading: Image.asset(AppImages.email),
                      title: Text(
                        'Text Message',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(() => SuccessfullyShared());
                //  Navigator.push(context,
                // MaterialPageRoute(builder: ((context) => ShareLink())));
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(width: 1, color: Color(0xff006BDA)),
                      color: Color(0xff006BDA)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0.1, left: 30),
                    child: ListTile(
                      leading: Image.asset(AppImages.email),
                      title: Text(
                        'Email',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            vertical(230),
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
