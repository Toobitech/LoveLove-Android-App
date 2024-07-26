// ignore_for_file: sized_box_for_whitespace

import 'dart:developer';

import 'package:LoveLove/models/user_portal/profile/controller/profileDataController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/custom_button.dart';
import '../../../global/snackbar.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/const_text.dart';
import 'calender.dart';
import 'controller/profession_controller.dart';
import 'model/pricing_model.dart';

class ProffessionalPlanDialog extends StatefulWidget {
  final String proffID;
  final String proffName;
  const ProffessionalPlanDialog(
      {super.key, required this.proffID, required this.proffName});

  @override
  State<ProffessionalPlanDialog> createState() =>
      _ProffessionalPlanDialogState();
}

class _ProffessionalPlanDialogState extends State<ProffessionalPlanDialog> {
  int selectedAmountIndex = -1;
  PricingModel? dataSet;
  final proffController = Get.put(ProfessionController());
  final myprofileIncontroller = Get.put(MyProfileController());

  @override
  void initState() {
    super.initState();
    proffController.getProfessionaPlanID(widget.proffID);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Container(
          width: 160,
          child: const Text(
            'Choose Your Plan',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
      content: Obx(() => proffController.isLoadingPlan.value
          ? Container(
              width: double.maxFinite,
              height: 300,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              ),
            )
          : proffController.professionPlanData.isEmpty
              ? Container(
                  width: double.maxFinite,
                  height: 300,
                  child: Center(
                      child: mediumtext(AppColors.black, 18, 'List is Empty')))
              : Container(
                  width: double.maxFinite,
                  height: 300,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: proffController.professionPlanData.length,
                    itemBuilder: (context, index) {
                      PricingModel item =
                          proffController.professionPlanData[index];
                      return GestureDetector(
                        onTap: () {
                          print(
                              'Selected Amount: ${proffController.professionPlanData[index]}');
                          setState(() {
                            selectedAmountIndex = index;
                            dataSet = item;
                            print('object12121212');
                            log(dataSet.toString());
                            log(dataSet!.amount);
                          });
                        },
                        child: Stack(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8),
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                  color: selectedAmountIndex == index
                                      ? AppColors.pink
                                      : Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                children: [
                                  selectedAmountIndex == index
                                      ? Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(20),
                                                      bottomLeft:
                                                          Radius.circular(20)),
                                              color: AppColors.pink,
                                            ),
                                            child: Icon(
                                              Icons.check,
                                              color: AppColors.white,
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '\$ ${item.amount}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          '${item.mins} Minutes',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomButton(
            title: 'Confirm',
            tap: () async {
              print(myprofileIncontroller.UserDataList!.walletBalance);
              print(proffController.professionPlanData);
              if (proffController.professionPlanData.isEmpty) {
                Get.back();
                print('object!!');
                showInSnackBar("Sorry this Proffessional Havn't Plans",
                    color: Colors.red);
              } else if (myprofileIncontroller.UserDataList!.walletBalance !=
                      '0' ||
                  myprofileIncontroller.UserDataList!.walletBalance != null) {
                await showDialog<DateTime>(
                  context: context,
                  builder: (context) => CalendarDialog(
                    dataSet: dataSet!,
                    professionUid: int.parse(widget.proffID),
                    professioName: widget.proffName,
                  ),
                );
                print('Succfully Payments');
              } else {
                showInSnackBar('Please Deposite Amount in your Account',
                    color: Colors.red);
              }
            },
          ),
        )
      ],
    );
  }
}
