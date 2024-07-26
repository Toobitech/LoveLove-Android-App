import 'package:LoveLove/global/alertboxes.dart';
import 'package:LoveLove/global/imagePreview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/global/bottomsmallStyle.dart';
import 'package:LoveLove/global/customAppBar.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/appbarchat/view/appbarChat.dart';
import 'package:LoveLove/models/user_portal/discover/controllers/ProfileViewController.dart';
import 'package:LoveLove/models/user_portal/heart_sent/widgets/AnimationScreen.dart';

import '../../../../components/custom_backbutton.dart';
import '../../../../global/userdrawer.dart';
import '../../../../helpers/assets.dart';
import '../../heart_sent/controller/heart_sentController.dart';

class ProfileView extends StatefulWidget {
  final String? isFrom;
  ProfileView({Key? key, this.isFrom}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final userinterestcontroller = Get.put(ProfileViewController());
  final controller3 = Get.find<HeartSendController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: userdrawer(),
      body: BottomSmallStyle(
        botom: false,
        topHeight: 0.5,
        body: GetX<ProfileViewController>(
          builder: (controller) {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              );
            }

            if (controller.userId.isEmpty) {
              return Center(
                child: Text("No User Data Available"),
              );
            }

            final user = controller.userId[0];

            String getImagePath() {
              switch (user.healthScore) {
                case 0:
                  return AppImages.heart0;
                case 10:
                  return AppImages.heart10;
                case 25:
                  return AppImages.heart25;
                case 50:
                  return AppImages.heart50;
                case 75:
                  return AppImages.heart75;
                case 100:
                  return AppImages.heart100;
                default:
                  return AppImages.heart0;
              }
            }

            return Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  vertical(Get.height * 0.065),
                  SizedBox(
                    height: Get.height * 0.30,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomBackButton(),
                        InkWell(
                          onTap: () {
                            if (user.images!.isNotEmpty) {
                              Get.to(() => ImagePreviewList(
                                  images: user.images!
                                      .map((e) => e.image.toString())
                                      .toList()));
                            }
                          },
                          child: CircleAvatar(
                            radius: 75,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: AppColors.pink,
                              radius: 70,
                              backgroundImage: NetworkImage(
                                "${AppUrl.impath}/${user.profile.toString()}",
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          if (appStorage.read(ACCOUNT_FOR) != '1' &&
                              appStorage.read(ACCOUNT_FOR) != 'null') {
                            controller3.heartsend(
                              user.id.toString(),
                              recomendation: true,
                            );
                          } else {
                            if (widget.isFrom == "Heart Received") {
                              controller.accept(
                                user.id.toString(),
                                user.profile.toString(),
                                user.firstName.toString(),
                              );
                            } else if (user.isFriend == true) {
                              Get.to(() => AnimationScreen(
                                    image:
                                        "${AppUrl.impath}/${user.profile.toString()}",
                                    userId: user.id!.toInt(),
                                    userName: user.firstName.toString(),
                                  ));
                            } else {
                              controller3.heartsend(user.id.toString());
                            }
                          }
                        },
                        child: SizedBox(
                          height: Get.height * 0.092,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.transparent,
                            child: appStorage.read(ACCOUNT_FOR) != '1' &&
                                    appStorage.read(ACCOUNT_FOR) != 'null'
                                ? user.isRecomended == true
                                    ? Image.asset(AppImages.recommendations_red)
                                    : Image.asset(
                                        AppImages.recommendations_white)
                                : user.isFriend == true
                                    ? Image.asset(AppImages.heart_blue)
                                    : Image.asset(AppImages.heart_grey),
                          ),
                        ),
                      ),
                      widget.isFrom != "Heart Received"
                          ? SizedBox.shrink()
                          : InkWell(
                              onTap: () {
                                controller.cancel(user.id.toString());
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SizedBox(
                                  height: Get.height * 0.093,
                                  child: const CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 246, 231, 231),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.black26,
                                      size: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                  vertical(10),
                  Expanded(
                    child: SingleChildScrollView(
                      controller: ScrollController(),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: const EdgeInsets.all(5),
                                child: Image.asset(
                                  getImagePath(),
                                  height: 35,
                                  width: 35,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            boldtext(AppColors.black, 20,
                                "${user.firstName} , ${user.age} "),
                            vertical(10),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.pink,
                                ),
                                horizental(5),
                                mediumtext(
                                  AppColors.black,
                                  12,
                                  user.city == null && user.country == null
                                      ? "N/A"
                                      : "${user.city ?? ""} , ${user.country ?? ""}",
                                ),
                              ],
                            ),
                            vertical(15),
                            mediumtext(AppColors.black, 12, "About"),
                            vertical(15),
                            lighttext(AppColors.black, 10,
                                "${user.about ?? "N/A"}"),
                            vertical(15),
                            mediumtext(AppColors.black, 12, "Life Style"),
                            vertical(10),
                            user.userIntrest!.isEmpty
                                ? boldtext(AppColors.black, 15, "N/A")
                                : Wrap(
                                    children: user.userIntrest!
                                        .map(
                                          (index) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 7, horizontal: 20),
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: AppColors.pink,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: mediumtext(
                                              AppColors.white,
                                              10,
                                              "${index.intrest == null ? '' : index.intrest!.name}",
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                            vertical(15),
                            user.isMedicalCondition == 0
                                ? const SizedBox.shrink()
                                : mediumtext(AppColors.black, 12,
                                    "Health Inconvenience"),
                            vertical(10),
                            user.isMedicalCondition == 0
                                ? const SizedBox.shrink()
                                : user.userMedicalCondition!.isEmpty
                                    ? boldtext(AppColors.black, 15, "N/A")
                                    : Wrap(
                                        children: user.userMedicalCondition!
                                            .map(
                                              (index) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7,
                                                        horizontal: 20),
                                                margin:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: AppColors.pink,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: mediumtext(
                                                  AppColors.white,
                                                  10,
                                                  "${index.medicalCondition!.name}",
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                            vertical(15),
                            user.isMedicalCondition == 0
                                ? const SizedBox.shrink()
                                : mediumtext(AppColors.black, 12,
                                    "Sharable Conditions"),
                            vertical(10),
                            user.isSharableCondition == 0
                                ? const SizedBox.shrink()
                                : user.userSharableCondition!.isEmpty
                                    ? boldtext(AppColors.black, 15, "N/A")
                                    : Wrap(
                                        children: user.userSharableCondition!
                                            .map(
                                              (index) => Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 7,
                                                        horizontal: 20),
                                                margin:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: AppColors.pink,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: mediumtext(
                                                  AppColors.white,
                                                  10,
                                                  "${index.sharableCondition!.name}",
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
