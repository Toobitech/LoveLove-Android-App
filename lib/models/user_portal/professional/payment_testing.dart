import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../components/custom_backbutton.dart';
import '../../../components/custombutton_wigdet.dart';
import '../profile/controller/profileDataController.dart';
import 'controller/profession_controller.dart';

class PaymentScreenTesting extends StatefulWidget {
  PaymentScreenTesting({
    super.key,
  });

  @override
  State<PaymentScreenTesting> createState() => _PaymentScreenTestingState();
}

class _PaymentScreenTestingState extends State<PaymentScreenTesting> {
  final myprofileIncontroller = Get.put(MyProfileController());

  final professionalcontroller = Get.put(ProfessionController());

  double selectAmount = 0.0;
  List<double> amountlist = [100, 250, 500, 1000, 1250, 1500];
  bool loading = false;
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    super.initState();
  }

  int selectedAmountIndex = -1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vertical(125),
                Center(
                    child: Image.asset(
                  'assets/images/icons/payment_heart.png',
                  height: 100,
                  width: 100,
                )),
                const SizedBox(height: 20),
                Container(
                  height: Get.height * 0.1,
                  width: 200,
                  padding:
                      const EdgeInsets.only(right: 10, left: 10, bottom: 15),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/icons/balance_group.png'),
                        fit: BoxFit.fill),
                  ),
                  child: Center(
                      child: FittedBox(
                    child: Text(
                      '\$${myprofileIncontroller.UserDataList!.walletBalance!}',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                  )),
                ),
                vertical(25),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       'Select Amount',
                //       style: TextStyle(
                //           fontSize: 15,
                //           fontWeight: FontWeight.w600,
                //           color: AppColors.black),
                //     ),
                //   ),
                // ),
                // vertical(15),
                Container(
                  height: Get.height * 0.3,
                  child: Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.pink),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(
                              "Love",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            subtitle: Text(
                              'SubLove',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            trailing: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  '\$99.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.pink),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.pink),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(
                              "Love",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            subtitle: Text(
                              'SubLove',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            trailing: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  '\$99.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.pink),
                                )),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.pink),
                              borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Text(
                              "Love",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            subtitle: Text(
                              'SubLove',
                              style: TextStyle(
                                  // fontWeight: FontWeight.bold,
                                  color: AppColors.pink),
                            ),
                            trailing: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  '\$99.0',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.pink),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Wrap(
                //   children: amountlist
                //       .asMap()
                //       .entries
                //       .map(
                //         (entry) => GestureDetector(
                //           onTap: () {
                //             print('Selected Amount: ${entry.value}');
                //             setState(() {
                //               selectedAmountIndex = entry.key;
                //               selectAmount = entry.value;
                //             });
                //           },
                //           child: Container(
                //             width: 100,
                //             margin: const EdgeInsets.all(8),
                //             padding: const EdgeInsets.symmetric(
                //                 horizontal: 10, vertical: 10),
                //             decoration: BoxDecoration(
                //               color: selectedAmountIndex == entry.key
                //                   ? AppColors.pink
                //                   : AppColors.white,
                //               border: Border.all(
                //                 color: selectedAmountIndex == entry.key
                //                     ? AppColors.white
                //                     : AppColors.amount,
                //               ),
                //               borderRadius: BorderRadius.circular(20),
                //             ),
                //             child: Center(
                //               child: Text(
                //                 // '\$ ${entry.value.toStringAsFixed(1)}',
                //                 '\$ ${entry.value}',
                //                 style: TextStyle(
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.bold,
                //                     color: selectedAmountIndex == entry.key
                //                         ? AppColors.white
                //                         : AppColors.amount),
                //               ),
                //             ),
                //           ),
                //         ),
                //       )
                //       .toList(),
                // ),

                vertical(25),
                // Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 80),
                //     child: CustomButtonWidget(
                //       imageonly: 'assets/images/icons/payment_button.png',
                //       isLoading: loading,
                //       title: 'Top up',
                //       tap: () async {},
                //     )),
              ],
            ),
            BottomSmallStyle(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  vertical(Get.height * 0.16),
                ],
              ),
            )),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomBackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
