import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';

import '../../../profile/controller/profileDataController.dart';
import '../../widgets/discoverWidget.dart';
import '../controller/FilterController.dart';

class FiltersSetting extends StatefulWidget {
  const FiltersSetting({super.key});

  @override
  State<FiltersSetting> createState() => _FiltersSettingState();
}

class _FiltersSettingState extends State<FiltersSetting> {
  final filterIncontroller = Get.find<FilterController>();
  String gender = "Male";
  bool viewMedical = false;
  bool filter = true;
  String medicalValue = "Select";
  List<String> AddList = [];
  List medicalValueID = [];
  bool viewsharable = false;
  String sharableValue = "Select";
  List<String> AddsharableList = [];
  List sharableValueID = [];
  final medicalIncontroller = Get.find<MedicalConditionController>();
  RangeValues _currentRangeValues = const RangeValues(40, 80);
// [curre.start.t,curr.end.t]
  bool viewDistance = false;
  String distanceValue = "0 miles - 10 miles ";
  List<String> distance = [
    "0 miles ",
    "1 miles ",
    "2 miles ",
    "3 miles ",
    "4 miles ",
    "5 miles ",
    "6 miles ",
    "7 miles",
    "8 miles ",
    "9 miles ",
    "10 miles ",
    "none",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.05,
            color: AppColors.pink,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: Get.width,
            decoration: const BoxDecoration(
                color: Color(0xffF0F0F0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back)),
                    boldtext(AppColors.black, 18, "Filters"),
                    IconButton(
                      onPressed: () {
                        print(distanceValue);
                        print(_currentRangeValues.start);
                        print(gender);
                        print(medicalValueID);
                        print(sharableValueID);
                        if (filter == true) {
                          filterIncontroller.fetchFilterData(
                              "${distanceValue == 'none' ? '' : 'distance=${distanceValue.split(' miles').first}'}&age=${_currentRangeValues.start},${_currentRangeValues.end}&gender=${gender.toLowerCase()}${medicalValueID.isEmpty ? '' : '&medical_condition_id=$medicalValueID'}${sharableValueID.isEmpty ? '' : '&sharable_condition_id=$sharableValueID'}"
                              // ,
                              // ,
                              // ,
                              // ,
                              );
                        }
                        setState(() {
                          filter = !filter;
                        });
                      },
                      icon: Icon(
                        Icons.check,
                        color: AppColors.pink,
                      ),
                    ),
                  ],
                ),
                vertical(filter == false ? 0 : 20),
                filter == false
                    ? SizedBox.shrink()
                    : boldtext(AppColors.black, 14, "Distance"),
                vertical(filter == false ? 0 : 10),
                filter == false
                    ? SizedBox.shrink()
                    : Stack(
                        children: [
                          viewDistance == false
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
                                            width: 100,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount: distance.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Center(
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        distanceValue =
                                                            distance[index];
                                                        viewDistance = false;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8,
                                                          horizontal: 20),
                                                      decoration: BoxDecoration(
                                                          color: distanceValue ==
                                                                  distance[
                                                                      index]
                                                              ? Color(
                                                                  0xffCACACA)
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: boldtext(
                                                          AppColors.black,
                                                          12,
                                                          distance[index]),
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
                              setState(() {
                                viewDistance = !viewDistance;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      width: 2, color: AppColors.black)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    boldtext(
                                        AppColors.black, 14, distanceValue),
                                    const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                vertical(filter == false ? 0 : 20),
                filter == false
                    ? SizedBox.shrink()
                    : boldtext(AppColors.black, 14, "Gender"),
                vertical(filter == false ? 0 : 10),
                filter == false
                    ? SizedBox.shrink()
                    : Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(width: 2, color: AppColors.black)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            gender == "Male"
                                ? Expanded(
                                    child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.pink,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                                    width: gender == "Male"
                                                        ? 0
                                                        : 2,
                                                    color: AppColors.black),
                                                right: BorderSide(
                                                    width: gender == "Other"
                                                        ? 0
                                                        : 2,
                                                    color: AppColors.black))),
                                        child: Center(
                                          child: mediumtext(
                                              AppColors.blackShade,
                                              12,
                                              "Female"),
                                        )),
                                  )),
                            gender == "Other"
                                ? Expanded(
                                    child: Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.pink,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                vertical(filter == false ? 0 : 20),
                filter == false
                    ? SizedBox.shrink()
                    : boldtext(AppColors.black, 14, "Age"),
                vertical(filter == false ? 0 : 10),
                filter == false
                    ? SizedBox.shrink()
                    : Row(
                        children: [
                          Text(
                            '18',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.pink),
                          ),
                          Expanded(
                            child: RangeSlider(
                              values: _currentRangeValues,
                              min: 18,
                              max: 100,
                              divisions: 100,
                              activeColor: AppColors.pink,
                              inactiveColor: AppColors.black,
                              labels: RangeLabels(
                                _currentRangeValues.start.round().toString(),
                                _currentRangeValues.end.round().toString(),
                              ),
                              onChanged: (RangeValues values) {
                                setState(() {
                                  _currentRangeValues = values;
                                  print(values.start);
                                });
                              },
                            ),
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.pink),
                          ),
                        ],
                      ),
                vertical(filter == false ? 0 : 20),
                filter == false
                    ? SizedBox.shrink()
                    : boldtext(AppColors.black, 14, "Health Inconvenience"),
                vertical(filter == false ? 0 : 10),
                filter == false
                    ? SizedBox.shrink()
                    : Stack(
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
                                            width: 100,
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
                                                          medicalValueID.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList1[
                                                                      index]
                                                                  .id);
                                                        }

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
                                                              ? AppColors.black
                                                              : Colors
                                                                  .transparent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: boldtext(
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
                                                          medicalValueID.add(
                                                              medicalIncontroller
                                                                  .MedicalConditionList2[
                                                                      index]
                                                                  .id);
                                                        }

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
                                                              ? AppColors.black
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
                              setState(() {
                                viewMedical = !viewMedical;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
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
                                          (AddList.isEmpty ? 0.01 : 0.7),
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
                vertical(filter == false ? 0 : 20),
                filter == false
                    ? SizedBox.shrink()
                    : boldtext(AppColors.black, 14, "Sharable Conditions"),
                vertical(filter == false ? 0 : 10),
                filter == false
                    ? SizedBox.shrink()
                    : Stack(
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
                                      SizedBox(
                                        height: 140,
                                        width: 100,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.zero,
                                          itemCount: medicalIncontroller
                                              .sharableConditionList1.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Center(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    sharableValue =
                                                        medicalIncontroller
                                                            .sharableConditionList1[
                                                                index]
                                                            .name;
                                                    if (AddsharableList.contains(
                                                        medicalIncontroller
                                                            .sharableConditionList1[
                                                                index]
                                                            .name)) {
                                                    } else {
                                                      AddsharableList.add(
                                                          medicalIncontroller
                                                              .sharableConditionList1[
                                                                  index]
                                                              .name);
                                                      sharableValueID.add(
                                                          medicalIncontroller
                                                              .sharableConditionList1[
                                                                  index]
                                                              .id);
                                                    }

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
                                                          ? AppColors.black
                                                          : Colors.transparent,
                                                      borderRadius:
                                                          BorderRadius.circular(
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

                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceEvenly,
                                      //   children: [
                                      //     SizedBox(
                                      //       height: 140,
                                      //       width: 100,
                                      //       child: ListView.builder(
                                      //         shrinkWrap: true,
                                      //         padding: EdgeInsets.zero,
                                      //         itemCount: medicalIncontroller
                                      //             .sharableConditionList1
                                      //             .length,
                                      //         itemBuilder:
                                      //             (BuildContext context,
                                      //                 int index) {
                                      //           return Center(
                                      //             child: InkWell(
                                      //               onTap: () {
                                      //                 setState(() {
                                      //                   sharableValue =
                                      //                       medicalIncontroller
                                      //                           .sharableConditionList1[
                                      //                               index]
                                      //                           .name;
                                      //                   if (AddsharableList.contains(
                                      //                       medicalIncontroller
                                      //                           .sharableConditionList1[
                                      //                               index]
                                      //                           .name)) {
                                      //                   } else {
                                      //                     AddsharableList.add(
                                      //                         medicalIncontroller
                                      //                             .sharableConditionList1[
                                      //                                 index]
                                      //                             .name);
                                      //                     sharableValueID.add(
                                      //                         medicalIncontroller
                                      //                             .sharableConditionList1[
                                      //                                 index]
                                      //                             .id);
                                      //                   }

                                      //                   viewsharable = false;
                                      //                 });
                                      //               },
                                      //               child: Container(
                                      //                 padding: const EdgeInsets
                                      //                     .symmetric(
                                      //                     vertical: 8,
                                      //                     horizontal: 20),
                                      //                 decoration: BoxDecoration(
                                      //                     color: sharableValue ==
                                      //                             medicalIncontroller
                                      //                                 .sharableConditionList1[
                                      //                                     index]
                                      //                                 .name
                                      //                         ? AppColors.black
                                      //                         : Colors
                                      //                             .transparent,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(
                                      //                                 15)),
                                      //                 child: boldtext(
                                      //                     sharableValue ==
                                      //                             medicalIncontroller
                                      //                                 .sharableConditionList1[
                                      //                                     index]
                                      //                                 .name
                                      //                         ? AppColors.white
                                      //                         : AppColors.black,
                                      //                     12,
                                      //                     medicalIncontroller
                                      //                         .sharableConditionList1[
                                      //                             index]
                                      //                         .name),
                                      //               ),
                                      //             ),
                                      //           );
                                      //         },
                                      //       ),
                                      //     ),
                                      //     Image.asset(AppImages.line_vertical),
                                      //     SizedBox(
                                      //       height: 140,
                                      //       width: 100,
                                      //       child: ListView.builder(
                                      //         shrinkWrap: true,
                                      //         padding: EdgeInsets.zero,
                                      //         itemCount: medicalIncontroller
                                      //             .sharableConditionList2
                                      //             .length,
                                      //         itemBuilder:
                                      //             (BuildContext context,
                                      //                 int index) {
                                      //           return Center(
                                      //             child: InkWell(
                                      //               onTap: () {
                                      //                 setState(() {
                                      //                   sharableValue =
                                      //                       medicalIncontroller
                                      //                           .sharableConditionList2[
                                      //                               index]
                                      //                           .name;
                                      //                   if (AddsharableList.contains(
                                      //                       medicalIncontroller
                                      //                           .sharableConditionList2[
                                      //                               index]
                                      //                           .name)) {
                                      //                   } else {
                                      //                     AddsharableList.add(
                                      //                         medicalIncontroller
                                      //                             .sharableConditionList2[
                                      //                                 index]
                                      //                             .name);
                                      //                     sharableValueID.add(
                                      //                         medicalIncontroller
                                      //                             .sharableConditionList2[
                                      //                                 index]
                                      //                             .id);
                                      //                   }

                                      //                   viewsharable = false;
                                      //                 });
                                      //               },
                                      //               child: Container(
                                      //                 padding: const EdgeInsets
                                      //                     .symmetric(
                                      //                     vertical: 8,
                                      //                     horizontal: 20),
                                      //                 decoration: BoxDecoration(
                                      //                     color: sharableValue ==
                                      //                             medicalIncontroller
                                      //                                 .sharableConditionList2[
                                      //                                     index]
                                      //                                 .name
                                      //                         ? AppColors.black
                                      //                         : Colors
                                      //                             .transparent,
                                      //                     borderRadius:
                                      //                         BorderRadius
                                      //                             .circular(
                                      //                                 15)),
                                      //                 child: boldtext(
                                      //                     sharableValue ==
                                      //                             medicalIncontroller
                                      //                                 .sharableConditionList2[
                                      //                                     index]
                                      //                                 .name
                                      //                         ? AppColors.white
                                      //                         : AppColors.black,
                                      //                     12,
                                      //                     medicalIncontroller
                                      //                         .sharableConditionList2[
                                      //                             index]
                                      //                         .name),
                                      //               ),
                                      //             ),
                                      //           );
                                      //         },
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                viewsharable = !viewsharable;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
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
                                          (AddsharableList.isEmpty
                                              ? 0.01
                                              : 0.7),
                                      child: ListView.builder(
                                          itemCount: AddsharableList.length,
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
                                                      AddsharableList[index]
                                                          .toString()),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      if (AddsharableList
                                                          .contains(
                                                              AddsharableList[
                                                                      index]
                                                                  .toString())) {
                                                        AddsharableList.remove(
                                                            AddsharableList[
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
                                        AddsharableList.isEmpty
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
                vertical(filter == false ? 0 : 20),
              ],
            ),
          ),
          Expanded(
            child: discoverWidget(
              padding: 15,
              filter: true,
            ),
          )
        ],
      ),
    );
  }
}
