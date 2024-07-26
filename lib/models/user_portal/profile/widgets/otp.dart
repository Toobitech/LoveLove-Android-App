import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/upload_pic_profile.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/models/user_portal/profile/widgets/verify_number.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';

class otp extends StatefulWidget {
  final String verificationId;
  String phoneNumber;
  otp({super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BottomSmallStyle(
        topHeight: 0.23,
        top: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 90, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                vertical(180),
                // Padding(
                // padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                Text(
                  'Enter OTP',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w800),
                ),

                vertical(40),
                // ? Padding(
                //     padding: const EdgeInsets.only(top: 15.0),
                //     child: CircularProgressIndicator(),
                //   )
                // :
                textarea(otpController, "6 Digit OTP"),

                vertical(40),
                buttonMain(0.6, "Next", () async {
                  showLoadingDialog();
                  // recieveotp(otpController.text);
                  AuthCredential phoneAuth = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: otpController.text);
                  try {
                    await _auth
                        .signInWithCredential(phoneAuth)
                        .then((value) => {
                              hideLoadingDialog(),
                              sendphoneNumber(widget.phoneNumber),
                              Get.to(() => UploadPicture()),
                              print("success $value")
                            });
                  } catch (e) {
                    hideLoadingDialog();
                    showInSnackBar(e.toString().split("]").last,
                        color: Colors.red);
                    print(e.toString());
                    print("error");
                  }
                }),
                vertical(200),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.black,
                      )),
                ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textarea(
    TextEditingController controller,
    String hint,
  ) {
    return SizedBox(
      width: Get.width * 0.7,
      height: 50,
      child: TextField(
        controller: controller,
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
    );
  }
}

sendphoneNumber(String phonenumber) async {
  showLoadingDialog();

  try {
    var response = await http.post(Uri.parse(AppUrl.phoneURL), headers: {
      'Authorization': "Bearer  $userToken ",
      'Accept': "application/json"
    }, body: {
      'phone': phonenumber,
    });

    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["success"] == true) {
      } else {
        hideLoadingDialog();
        showInSnackBar(data["message"], color: Colors.red);
      }
    }
  } catch (e) {
    print('error  $e');
  }
}
