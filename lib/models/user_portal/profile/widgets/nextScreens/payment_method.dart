import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/button.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/payment_type.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/read_more.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../global/snackbar.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/const_text.dart';
import '../../../../../helpers/spacer.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController areacode = TextEditingController();
  TextStyle defaultStyle = TextStyle(color: Colors.black, fontSize: 12.0);

  bool checkBoxValue = false;

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
                      vertical(20),
                      textarea(first_name, "First Name"),
                      textarea(last_name, "Last  Name"),
                      textarea(email, "Email"),
                      textarea(number, "Phone Number"),
                      vertical(40),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: mediumtext(
                              AppColors.black, 14, 'Terms & Condition')),
                      vertical(10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                checkBoxValue = !checkBoxValue;
                              });
                            },
                            child: Icon(
                              checkBoxValue
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank_rounded,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          SizedBox(
                            width: Get.width * 0.8,
                            child: RichText(
                              text: TextSpan(
                                style: defaultStyle,
                                children: [
                                  TextSpan(
                                    text:
                                        'Welcome to our dating app! Before you use our app, please read these terms and conditions',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  ),
                                  TextSpan(
                                      text: '    Read More',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.blue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(() => ReadMore());
                                        }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      vertical(50),
                      buttonMain(0.6, 'Next',
                          tColor: AppColors.black,
                          bgColor: Colors.transparent,
                          bColor: AppColors.black, () {
                        if (first_name.text.isEmpty) {
                          showInSnackBar('Please Enter First Name',
                              color: Colors.red);
                        } else if (last_name.text.isEmpty) {
                          showInSnackBar('Please Enter Last Name',
                              color: Colors.red);
                        } else if (email.text.isEmpty) {
                          showInSnackBar('Please Enter Email',
                              color: Colors.red);
                        } else if (number.text.isEmpty) {
                          showInSnackBar('Please Enter Phone Number',
                              color: Colors.red);
                        } else if (checkBoxValue == false) {
                          showInSnackBar('Please Select Terms & Conditions',
                              color: Colors.red);
                        } else {
                          Get.to(() => PaymentType(paymenttype: {
                                'first_name': first_name.text,
                                'last_name': last_name.text,
                                'email': email.text,
                                'phone_number': number.text,
                              }));
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
