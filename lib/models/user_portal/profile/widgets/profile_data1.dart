import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/profile_data2.dart';

import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/snackbar.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../controller/profileDataController.dart';

class ProfileData1 extends StatefulWidget {
  String id;
  ProfileData1({super.key, required this.id});

  @override
  State<ProfileData1> createState() => _ProfileData1State();
}

class _ProfileData1State extends State<ProfileData1> {
  final profileIncontroller = Get.put(ProfileController());
  final myprofileIncontroller = Get.find<MyProfileController>();
  final medicalIncontroller = Get.put(MedicalConditionController());
  final interestIncontroller = Get.put(InterestController());
  TextEditingController first_name = TextEditingController();
  TextEditingController mid_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController preferred_name = TextEditingController();
  TextEditingController age = TextEditingController();
  // TextEditingController description = TextEditingController();
  TextEditingController education = TextEditingController();
  String gender = "Male";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    interestIncontroller.fetchInterestData();
    medicalIncontroller.fetchMedicalCondition();
    medicalIncontroller.getSharableCondition();
    first_name.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.firstName ?? ''
        : '';
    mid_name.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.midName ?? ''
        : '';
    last_name.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.lastName ?? ''
        : '';
    preferred_name.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.preferredName ?? ''
        : '';
    age.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.age == null
            ? " "
            : myprofileIncontroller.UserDataList!.age.toString()
        : '';
    gender = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.gender ?? ''
        : '';
    education.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.education ?? ''
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BottomSmallStyle(
          top: false,
          body: SizedBox(
            width: Get.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    vertical(20),
                    textarea(first_name, "First Name"),
                    textarea(mid_name, "Mid Name"),
                    textarea(last_name, "Last Name"),
                    textarea(preferred_name, "Preferred Name"),
                    textarea(age, "Age"),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.fromLTRB(
                    //         (Get.width * 0.05 + 15), 20, 0, 5),
                    //     child: boldtext(AppColors.blackShade, 14, "Description"),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    vertical(10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: boldtext(
                          AppColors.blackShade,
                          14,
                          "Gender",
                        ),
                      ),
                    ),
                    vertical(10),
                    Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1, color: const Color(0xffCACACA))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          gender == "Male"
                              ? Expanded(
                                  child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.pink,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: boldtext(
                                          AppColors.white, 12, gender)),
                                ))
                              : Expanded(
                                  child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      gender = "Male";
                                    });
                                  },
                                  child: Center(
                                      child: mediumtext(
                                          AppColors.blackShade, 12, "Male")),
                                )),
                          gender == "Female"
                              ? Expanded(
                                  child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.pink,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: boldtext(
                                          AppColors.white, 12, gender)),
                                ))
                              : Expanded(
                                  child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      gender = "Female";
                                    });
                                  },
                                  child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  width: 1,
                                                  color: gender == "Male"
                                                      ? Colors.transparent
                                                      : const Color(
                                                          0xffCACACA)),
                                              right: BorderSide(
                                                  width: 1,
                                                  color: gender == "Other"
                                                      ? Colors.transparent
                                                      : const Color(
                                                          0xffCACACA)))),
                                      child: Center(
                                        child: mediumtext(
                                            AppColors.blackShade, 12, "Female"),
                                      )),
                                )),
                          gender == "Other"
                              ? Expanded(
                                  child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: AppColors.pink,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: boldtext(
                                          AppColors.white, 12, gender)),
                                ))
                              : Expanded(
                                  child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      gender = "Other";
                                    });
                                  },
                                  child: Center(
                                      child: mediumtext(
                                          AppColors.blackShade, 12, "Other")),
                                )),
                        ],
                      ),
                    ),

                    textarea(education, "Education"),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                    //   child: TextField(
                    //     maxLength: 200,
                    //     maxLines: 7,
                    //     decoration: InputDecoration(
                    //         contentPadding: EdgeInsets.only(top: 20, left: 20),
                    //         hintText: 'Description',
                    //         border: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(25))),
                    //   ),
                    // ),
                    vertical(20),
                    buttonMain(0.6, "Next", () {
                      if (first_name.text.isEmpty) {
                        showInSnackBar('Please Enter First Name',
                            color: Colors.red);
                      } else if (last_name.text.isEmpty) {
                        showInSnackBar('Please Enter Last Name',
                            color: Colors.red);
                      } else if (preferred_name.text.isEmpty) {
                        showInSnackBar('Please Enter Preferred Name',
                            color: Colors.red);
                      } else if (age.text.isEmpty) {
                        showInSnackBar('Please Enter Age', color: Colors.red);
                      } else if (education.text.isEmpty) {
                        showInSnackBar('Please Enter Education',
                            color: Colors.red);
                      } else {
                        Get.to(() => ProfileData2(profiledata1: {
                              'first_name': first_name.text,
                              'mid_name': mid_name.text,
                              'last_name': last_name.text,
                              'preferred_name': preferred_name.text,
                              'age': age.text,
                              'education': education.text,
                              'gender': gender,
                              "account_for_id": widget.id.toString()
                            }));
                      }
                    },
                        bgColor: Colors.transparent,
                        bColor: AppColors.black,
                        tColor: AppColors.black),
                    vertical(10),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomBackButton()),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget textarea(TextEditingController controller, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 0, 5),
          child: boldtext(AppColors.blackShade, 14, hint),
        ),
        SizedBox(
          height: 40,
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 20),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              hintText: hint,
            ),
          ),
        ),
      ],
    );
  }
}
