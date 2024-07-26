import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/otp.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/models/user_portal/profile/widgets/upload_pic_profile.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';

import '../../../../global/alertboxes.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/assets.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';

class verify_number extends StatefulWidget {
  const verify_number({super.key});

  @override
  State<verify_number> createState() => _verify_numberState();
}

class _verify_numberState extends State<verify_number> {
  TextEditingController numberController = TextEditingController();
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
                  'Verify Number',
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
                textarea(numberController, "+1223123456789"),

                vertical(40),
                buttonMain(0.6, "Next", () {
                  showLoadingDialog();
                  if (numberController.text.isEmpty) {
                    showInSnackBar('Please Enter Phone Number',
                        color: Colors.red);
                  }
                  // else if (numberController.text.length != 14) {
                  //   showInSnackBar('Please Enter Valid Phone Number',
                  //       color: Colors.red);
                  // }
                  else {
                    _auth.verifyPhoneNumber(
                      phoneNumber: numberController.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) async {
                        //start loading
                        print("Start Loading $credential");
                      },
                      verificationFailed: (FirebaseAuthException e) {
                        if (e.code == 'invalid-phone-number') {
                          showInSnackBar(
                              'The provided phone number is not valid.',
                              color: Colors.red);
                        } else {
                          print('**************${e.toString()}');
                          showInSnackBar(e.toString().split("]").last,
                              color: Colors.red);
                        }

                        hideLoadingDialog();
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {
                        print("Time out");
                      },
                      codeSent:
                          (String verificationId, int? resendToken) async {
                        print("Code sent");
                        showInSnackBar("OTP sent ${numberController.text} ");
                        hideLoadingDialog();
                        Get.to(() => otp(
                              verificationId: verificationId,
                              phoneNumber: numberController.text,
                            ));
                      },
                    );
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
      height: 60,
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

// sendotp(String phonenumber) async {
//   showLoadingDialog();
//   // setState(() {
//   //   loader = true;
//   // });
//   try {
//     var response = await http.post(Uri.parse(AppUrl.phoneURL), headers: {
//       'Authorization': "Bearer  $userToken ",
//       'Accept': "application/json"
//     }, body: {
//       'phone': phonenumber,
//     });
//     print(phonenumber);
//     if (response.statusCode == 200) {
//       print(response.body);
//       Map<String, dynamic> data = jsonDecode(response.body);
//       if (data["success"] == true) {
//         hideLoadingDialog();
//         print(data["otp"]);
//         showInSnackBar(data["message"], color: Colors.green);
//         Get.to(() => otp());
//       } else {
//         hideLoadingDialog();
//         showInSnackBar(data["message"], color: Colors.red);
//         // Get.to(UploadPicture());
//       }
//     }
//   } catch (e) {
//     print('errorr  $e');
//   }
// }
