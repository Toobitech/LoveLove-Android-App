import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/apiurl.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/assets.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';
import '../../discover/controllers/ProfileViewController.dart';
import '../../discover/widgets/profileview.dart';
import '../controller/heart_sentController.dart';

class heart_sent extends StatefulWidget {
  String title;
  heart_sent({super.key, required this.title});

  @override
  State<heart_sent> createState() => _heart_sentState();
}

class _heart_sentState extends State<heart_sent> {
  final heartsentIncontroller = Get.put(HeartSentController());
  @override
  Widget build(BuildContext context) {
    return GetX<HeartSentController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: CustomBackButton(),
        ),
        body: BottomSmallStyle(
          topHeight: 0.23,
          // top: false,
          body: heartsentIncontroller.isLoading.value == true
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
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        vertical(100),
                        // Padding(
                        // padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                        Center(
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.063,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),

                        heartsentIncontroller.HeartSentList.isEmpty
                            ? Center(
                                child: boldtext(
                                    Colors.grey, 14, "No Data Available"))
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemCount:
                                    heartsentIncontroller.HeartSentList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () {
                                      // Get.to(() => AnimationScreen());
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColors.gradientLight,
                                              AppColors.gradientDark
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    "${AppUrl.impath}/${heartsentIncontroller.HeartSentList[index].user?.profile}")
                                                // AssetImage(
                                                //     AppImages.personimg),
                                                ),
                                            horizental(10),
                                            SizedBox(
                                              width: Get.width * 0.4,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  boldtext(AppColors.white, 13,
                                                      "${heartsentIncontroller.HeartSentList[index].user?.firstName.toString()}"),
                                                  mediumtext(
                                                      AppColors.white,
                                                      11,
                                                      "${heartsentIncontroller.HeartSentList[index].user?.city ?? "City : N/A"}, ${heartsentIncontroller.HeartSentList[index].user?.country ?? "Country : N/A"}")
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            InkWell(
                                              onTap: () {
                                                var controller2 = Get.put(
                                                    ProfileViewController());
                                                controller2.fetchUserId(
                                                    "${heartsentIncontroller.HeartSentList[index].user?.id}");
                                                Get.to(() => ProfileView(
                                                      isFrom: widget.title,
                                                    ));
                                              },
                                              child: CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Image.asset(
                                                  AppImages.person_grey,
                                                  height: 30,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  );
                                })

                        // )
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
