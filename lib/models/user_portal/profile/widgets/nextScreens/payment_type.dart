import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/payment_approved.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../global/snackbar.dart';
import '../../../../../helpers/assets.dart';
import '../../../../../helpers/button.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/const_text.dart';
import '../../../../../helpers/spacer.dart';
import 'controller/paymentController.dart';

class PaymentType extends StatefulWidget {
  Map<String, dynamic> paymenttype;
  PaymentType({super.key, required this.paymenttype});

  @override
  State<PaymentType> createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {
  final paymentcontroller = Get.put(PaymentController());

  TextEditingController cardnumber = TextEditingController();
  TextEditingController cvv = TextEditingController();
  TextEditingController expiryMonth = TextEditingController();
  TextEditingController expiryYear = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
              )),
          elevation: 0,
        ),
        body: BottomSmallStyle(
            top: false,
            body: SizedBox(
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      boldtext(AppColors.black, 26, 'Payment Type'),
                      vertical(30),

                      Image.asset(AppImages.card_payment),
                      vertical(20),
                      textarea(cardnumber, "Card Number", 16),

                      Align(
                          alignment: Alignment.centerLeft,
                          child:
                              textarea(cvv, "CVV", 3, width: Get.width * 0.4)),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: textarea(expiryMonth, "Expiry Month", 2,
                              width: Get.width * 0.4)),

                      Align(
                          alignment: Alignment.centerLeft,
                          child: textarea(expiryYear, "Expiry Year", 2,
                              width: Get.width * 0.4)),

                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: SizedBox(
                      //     width: Get.width * 0.8,
                      //     child: mediumtext(Colors.red, 14,
                      //         '*Payment Denial,  check the details or choose another card'),
                      //   ),
                      // ),
                      vertical(30),
                      buttonMain(0.6, 'Next',
                          tColor: AppColors.black,
                          bgColor: Colors.transparent,
                          bColor: AppColors.black, () {
                        if (cardnumber.text.isEmpty) {
                          showInSnackBar('Please Enter Card Number',
                              color: Colors.red);
                        } else if (cardnumber.text.length < 12 ||
                            cardnumber.text.length > 16) {
                          showInSnackBar('Please Enter Valid Card Number',
                              color: Colors.red);
                        } else if (cvv.text.isEmpty) {
                          showInSnackBar('Please Enter CVV', color: Colors.red);
                        } else if (cvv.text.length != 3) {
                          showInSnackBar('Please Enter Valid CVV',
                              color: Colors.red);
                        } else if (expiryMonth.text.isEmpty) {
                          showInSnackBar('Please Enter Expiry Month',
                              color: Colors.red);
                        } else if (expiryMonth.text.length != 2) {
                          showInSnackBar('Please Enter Valid Expiry Month',
                              color: Colors.red);
                        } else if (expiryYear.text.isEmpty) {
                          showInSnackBar('Please Enter Expiry Year',
                              color: Colors.red);
                        } else if (expiryMonth.text.length != 2) {
                          showInSnackBar('Please Enter Valid Expiry Year',
                              color: Colors.red);
                        } else {
                          Map<String, dynamic> paymenttype2 = {
                            'number': cardnumber.text,
                            'cvc': cvv.text,
                            'exp_month': expiryMonth.text,
                            'exp_year': expiryYear.text,
                          };
                          Map<String, dynamic> paymenttype3 = {};
                          paymenttype3.addAll(widget.paymenttype);
                          paymenttype3.addAll(paymenttype2);

                          paymentcontroller.sendPaymentDetails(paymenttype3);
                        }
                      })
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  Widget textarea(
    TextEditingController controller,
    String hint,
    int maxlength, {
    double? width,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
          child: boldtext(
            AppColors.blackShade,
            14,
            hint,
          ),
        ),
        SizedBox(
          height: 60,
          width: width ?? Get.width,
          child: TextField(
            controller: controller,
            maxLength: maxlength,
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
