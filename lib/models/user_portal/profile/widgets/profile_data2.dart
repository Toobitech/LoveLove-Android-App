// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../../../components/custom_backbutton.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/snackbar.dart';
import '../../../../helpers/assets.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../../discover/widgets/discoverWidget.dart';
import '../controller/profileDataController.dart';
import '../controller/relationController.dart';

class ProfileData2 extends StatefulWidget {
  Map<String, dynamic> profiledata1;

  ProfileData2({super.key, required this.profiledata1});

  @override
  State<ProfileData2> createState() => _ProfileData2State();
}

class _ProfileData2State extends State<ProfileData2> {
  var controller = Get.find<RelationController>();
  final profileIncontroller = Get.put(ProfileController());
  final myprofileIncontroller = Get.find<MyProfileController>();
  final medicalIncontroller = Get.find<MedicalConditionController>();
  var interestIncontroller = Get.find<InterestController>();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController about = TextEditingController();
  bool viewMedical = false;
  bool viewsharable = false;
  String medicalValue = "Select";
  bool showhealth = true;
  String medicalValueID = "";
  List<String> AddList = [];
  List<int> AddListID = [];
  String sharableValue = "Select";
  bool showSharable = true;
  String sharableValueID = "";
  List<String> addSharableList = [];
  List<int> addSharableListID = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() {
    // print(myprofileIncontroller.UserDataList!.userMedicalCondition.toString());
    // print('Sharable Condition');
    // print(myprofileIncontroller.UserDataList!.userSharableCondition.toString());
    city.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.city ?? ''
        : '';
    country.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.country ?? ''
        : '';
    about.text = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.about ?? ''
        : '';
    AddList = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.userMedicalCondition == null
            ? []
            : myprofileIncontroller.UserDataList!.userMedicalCondition!
                .map((e) => e.medicalCondition!.name.toString())
                .toList()
        : [];
    addSharableList = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.userSharableCondition == null
            ? []
            : myprofileIncontroller.UserDataList!.userSharableCondition!
                .map((e) => e.sharableCondition!.name.toString())
                .toList()
        : [];
    showhealth =
        myprofileIncontroller.UserDataList!.isMedicalCondition.toString() == "1"
            ? true
            : false;
    showSharable =
        myprofileIncontroller.UserDataList!.isShareableCondition.toString() ==
                "1"
            ? true
            : false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // var count = (medicalIncontroller.MedicalConditionList.length / 2).toInt();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: BottomSmallStyle(
            top: false,
            body: SizedBox(
              width: Get.width,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      vertical(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textarea(city, "City"),
                          textarea(country, "Country"),
                          
                        ],
                      ),
                        textarea(state, "State"),
                      // textarea(education, "Education"),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              (Get.width * 0.00 + 15), 30, 0, 5),
                          child: boldtext(AppColors.blackShade, 14, "About"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: about,
                        maxLength: 250,
                        maxLines: 5,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 15, left: 20),
                            hintText: 'Enter',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                      vertical(5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: mediumtext(
                              AppColors.blackShade, 14, "Life Style"),
                        ),
                      ),
                      vertical(10),
                      IntrestDiscover(),
                      vertical(10),
                      Row(
                        children: [
                          boldtext(
                              AppColors.black, 12, "Match with Same issues"),
                          horizental(40),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                activeColor: AppColors.pink,
                                value: showhealth,
                                onChanged: (val) {
                                  setState(() {
                                    showhealth = val;
                                  });
                                }),
                          )
                        ],
                      ),
                      vertical(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: boldtext(
                              AppColors.blackShade, 14, "Health Conditions"),
                        ),
                      ),
                      vertical(10),
                      Stack(
                        children: [
                          viewMedical == false
                              ? SizedBox.shrink()
                              : Container(
                                  height: 200,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      vertical(60),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 140,
                                            width: 110,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: medicalIncontroller
                                                  .MedicalConditionList1.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              FocusNode());
                                                      setState(() {
                                                        medicalValue =
                                                            medicalIncontroller
                                                                .MedicalConditionList1[
                                                                    index]
                                                                .name;
                                                        if (AddList.contains(
                                                            medicalIncontroller
                                                                .MedicalConditionList1[
                                                                    index]
                                                                .name)) {
                                                        } else {
                                                          AddList.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList1[
                                                                      index]
                                                                  .name);
                                                          AddListID.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList1[
                                                                      index]
                                                                  .id);
                                                        }

                                                        medicalValueID =
                                                            medicalIncontroller
                                                                .MedicalConditionList1[
                                                                    index]
                                                                .id
                                                                .toString();

                                                        viewMedical = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: medicalValue ==
                                                                  medicalIncontroller
                                                                      .MedicalConditionList1[
                                                                          index]
                                                                      .name
                                                              ? AppColors.pink
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: boldtext(
                                                        center: true,
                                                          medicalValue ==
                                                                  medicalIncontroller
                                                                      .MedicalConditionList1[
                                                                          index]
                                                                      .name
                                                              ? AppColors.white
                                                              : AppColors.black,
                                                          12,
                                                          medicalIncontroller
                                                              .MedicalConditionList1[
                                                                  index]
                                                              .name),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Image.asset(AppImages.line_vertical),
                                          SizedBox(
                                            height: 140,
                                            width: 100,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: medicalIncontroller
                                                  .MedicalConditionList2.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              FocusNode());
                                                      setState(() {
                                                        medicalValue =
                                                            medicalIncontroller
                                                                .MedicalConditionList2[
                                                                    index]
                                                                .name;
                                                        if (AddList.contains(
                                                            medicalIncontroller
                                                                .MedicalConditionList2[
                                                                    index]
                                                                .name)) {
                                                        } else {
                                                          AddList.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList2[
                                                                      index]
                                                                  .name);
                                                          AddListID.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList1[
                                                                      index]
                                                                  .id);
                                                        }

                                                        medicalValueID =
                                                            medicalIncontroller
                                                                .MedicalConditionList2[
                                                                    index]
                                                                .id
                                                                .toString();

                                                        viewMedical = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: medicalValue ==
                                                                  medicalIncontroller
                                                                      .MedicalConditionList2[
                                                                          index]
                                                                      .name
                                                              ? AppColors.pink
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: boldtext(
                                                          medicalValue ==
                                                                  medicalIncontroller
                                                                      .MedicalConditionList2[
                                                                          index]
                                                                      .name
                                                              ? AppColors.white
                                                              : AppColors.black,
                                                          12,
                                                          medicalIncontroller
                                                              .MedicalConditionList2[
                                                                  index]
                                                              .name),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                viewMedical = !viewMedical;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffCACACA),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffCACACA))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: Get.width *
                                          (AddList.isEmpty ? 0.01 : 0.65),
                                      child: ListView.builder(
                                          itemCount: AddList.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 15),
                                              decoration: BoxDecoration(
                                                  color: AppColors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Row(
                                                children: [
                                                  // margin:
                                                  //     const EdgeInsets.all(5),

                                                  boldtext(
                                                      AppColors.white,
                                                      10,
                                                      AddList[index]
                                                          .toString()),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (AddList.contains(
                                                          AddList[index]
                                                              .toString())) {
                                                        AddList.remove(
                                                            AddList[index]
                                                                .toString());
                                                        AddListID
                                                          ..remove(
                                                              AddList[index]
                                                                  .toString());
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.highlight_remove,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    boldtext(AppColors.blackShade, 14,
                                        AddList.isEmpty ? 'Select' : ''),
                                    const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      vertical(15),
                      Row(
                        children: [
                          boldtext(AppColors.black, 12,
                              "Comfortable having conversations"),
                          horizental(40),
                          Transform.scale(
                            scale: 0.6,
                            child: CupertinoSwitch(
                                activeColor: AppColors.pink,
                                value: showSharable,
                                onChanged: (val) {
                                  setState(() {
                                    showSharable = val;
                                  });
                                }),
                          )
                        ],
                      ),
                      vertical(10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: boldtext(
                              AppColors.blackShade, 14, "Sharable Conditions"),
                        ),
                      ),
                      vertical(10),
                      Stack(
                        children: [
                          viewsharable == false
                              ? SizedBox.shrink()
                              : Container(
                                  height: 200,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    children: [
                                      vertical(60),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 140,
                                            width: 200,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: medicalIncontroller
                                                  .sharableConditionList1
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              FocusNode());
                                                      setState(() {
                                                        medicalValue =
                                                            medicalIncontroller
                                                                .sharableConditionList1[
                                                                    index]
                                                                .name;
                                                        if (addSharableList.contains(
                                                            medicalIncontroller
                                                                .sharableConditionList1[
                                                                    index]
                                                                .name)) {
                                                        } else {
                                                          addSharableList.add(
                                                              medicalIncontroller
                                                                  .sharableConditionList1[
                                                                      index]
                                                                  .name);
                                                          addSharableListID.add(
                                                              medicalIncontroller
                                                                  .sharableConditionList1[
                                                                      index]
                                                                  .id);
                                                        }

                                                        sharableValueID =
                                                            medicalIncontroller
                                                                .sharableConditionList1[
                                                                    index]
                                                                .id
                                                                .toString();

                                                        viewsharable = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: sharableValue ==
                                                                  medicalIncontroller
                                                                      .sharableConditionList1[
                                                                          index]
                                                                      .name
                                                              ? AppColors.pink
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: boldtext(
                                                          sharableValue ==
                                                                  medicalIncontroller
                                                                      .sharableConditionList1[
                                                                          index]
                                                                      .name
                                                              ? AppColors.white
                                                              : AppColors.black,
                                                          12,
                                                          medicalIncontroller
                                                              .sharableConditionList1[
                                                                  index]
                                                              .name),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          // Image.asset(AppImages.line_vertical),
                                          // SizedBox(
                                          //   height: 140,
                                          //   width: 100,
                                          //   child: ListView.builder(
                                          //     shrinkWrap: true,
                                          //     padding: EdgeInsets.zero,
                                          //     itemCount: medicalIncontroller
                                          //         .sharableConditionList2
                                          //         .length,
                                          //     itemBuilder:
                                          //         (BuildContext context,
                                          //             int index) {
                                          //       return Center(
                                          //         child: InkWell(
                                          //           onTap: () {
                                          //             FocusScope.of(context)
                                          //                 .requestFocus(
                                          //                     FocusNode());
                                          //             setState(() {
                                          //               sharableValue =
                                          //                   medicalIncontroller
                                          //                       .sharableConditionList2[
                                          //                           index]
                                          //                       .name;
                                          //               if (addSharableList.contains(
                                          //                   medicalIncontroller
                                          //                       .sharableConditionList2[
                                          //                           index]
                                          //                       .name)) {
                                          //               } else {
                                          //                 addSharableList.add(
                                          //                     medicalIncontroller
                                          //                         .sharableConditionList2[
                                          //                             index]
                                          //                         .name);
                                          //                 addSharableListID.add(
                                          //                     medicalIncontroller
                                          //                         .sharableConditionList1[
                                          //                             index]
                                          //                         .id);
                                          //               }

                                          //               sharableValueID =
                                          //                   medicalIncontroller
                                          //                       .sharableConditionList2[
                                          //                           index]
                                          //                       .id
                                          //                       .toString();

                                          //               viewsharable = false;
                                          //             });
                                          //           },
                                          //           child: Container(
                                          //             padding: const EdgeInsets
                                          //                 .symmetric(
                                          //                 vertical: 8,
                                          //                 horizontal: 20),
                                          //             decoration: BoxDecoration(
                                          //                 color: sharableValue ==
                                          //                         medicalIncontroller
                                          //                             .sharableConditionList2[
                                          //                                 index]
                                          //                             .name
                                          //                     ? AppColors.pink
                                          //                     : Colors
                                          //                         .transparent,
                                          //                 borderRadius:
                                          //                     BorderRadius
                                          //                         .circular(
                                          //                             15)),
                                          //             child: boldtext(
                                          //                 sharableValue ==
                                          //                         medicalIncontroller
                                          //                             .sharableConditionList2[
                                          //                                 index]
                                          //                             .name
                                          //                     ? AppColors.white
                                          //                     : AppColors.black,
                                          //                 12,
                                          //                 medicalIncontroller
                                          //                     .sharableConditionList2[
                                          //                         index]
                                          //                     .name),
                                          //           ),
                                          //         ),
                                          //       );
                                          //     },
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              setState(() {
                                viewsharable = !viewsharable;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffCACACA),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffCACACA))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: Get.width *
                                          (addSharableList.isEmpty
                                              ? 0.01
                                              : 0.65),
                                      child: ListView.builder(
                                          itemCount: addSharableList.length,
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 15),
                                              decoration: BoxDecoration(
                                                  color: AppColors.pink,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              child: Row(
                                                children: [
                                                  // margin:
                                                  //     const EdgeInsets.all(5),

                                                  boldtext(
                                                      AppColors.white,
                                                      10,
                                                      addSharableList[index]
                                                          .toString()),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (addSharableList
                                                          .contains(
                                                              addSharableList[
                                                                      index]
                                                                  .toString())) {
                                                        addSharableList.remove(
                                                            addSharableList[
                                                                    index]
                                                                .toString());
                                                        addSharableListID.remove(
                                                            addSharableList[
                                                                    index]
                                                                .toString());
                                                      }
                                                      setState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.highlight_remove,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                    ),
                                    boldtext(
                                        AppColors.blackShade,
                                        14,
                                        addSharableList.isEmpty
                                            ? 'Select'
                                            : ''),
                                    const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      vertical(30),
                      buttonMain(0.6, "Next", () {
                        if (city.text.isEmpty) {
                          showInSnackBar('Please Enter City',
                              color: Colors.red);
                        } else if (country.text.isEmpty) {
                          showInSnackBar('Please Enter Country',
                              color: Colors.red);
                        } else if (about.text.isEmpty) {
                          showInSnackBar('Please Write About YourSelf',
                              color: Colors.red);
                        } else if (AddList.isEmpty) {
                          showInSnackBar('Please Enter Health Inconvenience',
                              color: Colors.red);
                        }
                        // else if (addSharableList.isEmpty) {
                        //   showInSnackBar('Please Enter Sharable Conditions',
                        //       color: Colors.red);
                        // }
                        else {
                          print(
                            showSharable ? "1" : "0",
                          );
                          Map<String, dynamic> data2 = {
                            'city': city.text,
                            'country': country.text,
                            'about': about.text,
                            'intrest_id': "${interestIncontroller.selected}",
                            "is_medical_condition": showhealth ? "1" : "0",
                            // 'medical_condition_id': "$AddList",
                            // "is_sharable_condition": showSharable ? "1" : "0",
                            'medical_condition_id': "$AddListID",
                            "is_sharable_condition": showSharable ? "1" : "0",
                            'sharable_conditions_id': "$addSharableListID",
                            // 'images[]': '[]',
                            // ...widget.profiledata1
                          };
                          print(data2);
                          Map<String, dynamic> profiledata3 = {};
                          profiledata3.addAll(widget.profiledata1);
                          profiledata3.addAll(data2);
                          appStorage.write(ACCOUNT_FOR,
                              widget.profiledata1['account_for_id'].toString());
                          profileIncontroller.sendProfileData(profiledata3);
                          // Get.to(() => verify_number());
                        }
                      },
                          bgColor: Colors.transparent,
                          bColor: AppColors.black,
                          tColor: AppColors.black),
                      vertical(10),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomBackButton(),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
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
          width: Get.width * 0.4,
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
