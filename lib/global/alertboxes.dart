import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/models/authentication/view/signin.dart';

import '../helpers/colors.dart';
import '../helpers/const_text.dart';
import '../helpers/spacer.dart';
import '../models/authentication/controllers/signinController.dart';
import '../models/user_portal/professional/call/calling_service.dart';
import '../models/user_portal/professional/facelock/db/databse_helper.dart';

// imagePreviewAlert(List<String> images) {
//   Get.dialog(ImagePreviewList(images: images));
// }
final authcontroller = Get.put(SignInController());

showLoadingDialog() {
  Get.dialog(
    Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: AppColors.pink,
            ),
          ),
        ),
      ),
    ),
    // barrierDismissible: false,
  );
}

hideLoadingDialog() {
  Get.back();
}

showExitPopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width * 0.8,
      height: 200,
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.black, 18, 'Exit App', center: true)),
          vertical(30),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.black, 14, 'Do you want to exit App?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: const Center(child: Text("No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  SystemNavigator.pop();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: boldtext(Colors.black, 14, "Yes")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

showLogoutPopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width * 0.8,
      height: 200,
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.black, 18, 'Logout', center: true)),
          vertical(30),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.black, 14, 'Do you want to Logout?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: const Center(child: Text("No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  onUserLogout();
                  DatabaseHelper _dataBaseHelper = DatabaseHelper.instance;
                  _dataBaseHelper.deleteAll();
                  appStorage.erase();
                  Get.to(WelcomeScreen());
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: Text("YES")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}

showDeletePopup() {
  Get.dialog(Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: Get.width * 0.8,
      height: 220,
      child: Column(
        children: [
          Material(
              type: MaterialType.transparency,
              child: boldtext(Colors.black, 18, 'Delete', center: true)),
          vertical(20),
          Material(
            type: MaterialType.transparency,
            child: mediumtext(Colors.black, 14,
                'Are you Sure! you want to Delete you Account?',
                center: true),
          ),
          vertical(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: const Center(child: Text("No")),
                  ),
                ),
              ),
              horizental(20),
              GestureDetector(
                onTap: () {
                  authcontroller.deleteUserAccount();
                },
                child: Card(
                  elevation: 15,
                  child: Container(
                    width: 100,
                    height: 40,
                    alignment: Alignment.topLeft,
                    child: Center(child: Text("YES")),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  ));
}
