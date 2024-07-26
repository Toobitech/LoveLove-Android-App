import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/newProfile.dart';
import '../../../../global/bottomstyle.dart';
import '../../../../helpers/button.dart';
import '../controller/relationController.dart';
import '../widgets/profile_data1.dart';

class EditProfileMain extends StatefulWidget {
  const EditProfileMain({super.key});

  @override
  State<EditProfileMain> createState() => _EditProfileMainState();
}

class _EditProfileMainState extends State<EditProfileMain> {
  final relationIncontroller = Get.put(RelationController());
  bool checkBoxValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    relationIncontroller.fetchrelationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(),
        elevation: 0,
      ),
      body: BottomStyle(body: GetX<RelationController>(builder: (controller) {
        return relationIncontroller.isLoading.value == true
            ? SizedBox(
                height: Get.height * 0.7,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(
                          color: AppColors.pink,
                        )),
                  ],
                ),
              )
            : Column(
                children: [
                  vertical(Get.height * 0.15),
                  SizedBox(
                    height: Get.height * 0.3,
                    width: Get.width,
                    child: Image.asset(AppImages.edit_profile_img),
                  ),
                  vertical(Get.height * 0.1),
                  SizedBox(
                    height: Get.height * 0.45,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // boldtext(AppColors.white, 25, "Edit Profile"),
                          vertical(60),
                          appStorage.read(ACCOUNT_FOR) == null ||
                                  appStorage.read(ACCOUNT_FOR) == '0'
                              ? buttonMain(0.65, "Edit Profile", () {
                                  Get.to(() => NewProfileMain());
                                },
                                  bgColor: Colors.transparent,
                                  bColor: AppColors.white)
                              : buttonMain(0.65, "Edit Profile", () {
                                  Get.to(() => ProfileData1(
                                        id: appStorage
                                            .read(ACCOUNT_FOR)
                                            .toString(),
                                      ));
                                },
                                  bgColor: AppColors.white,
                                  tColor: AppColors.black),
                          vertical(20),
                        ],
                      ),
                    ),
                  ),
                ],
              );
      })),
    );
  }
}
