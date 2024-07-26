import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/authentication/forgetpassword/view/newpassword.dart';

import '../../../../helpers/assets.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';
import '../../view/signupScreen.dart';
import '../../widgets/socialLogin.dart';
import '../controller/verifyemailController.dart';

class verifycode extends StatefulWidget {
  int matchcode;
  String email;
  verifycode({super.key, required this.matchcode, required this.email});

  @override
  State<verifycode> createState() => _verifycodeState();
}

class _verifycodeState extends State<verifycode> {
  TextEditingController codeController = TextEditingController();
  final verifyemailcontroller = Get.find<VerifyEmailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              vertical(40),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  AppImages.logo_Icon,
                  height: Get.height * 0.08,
                ),
              ),
              vertical(120),
              boldtext(AppColors.black, 28, "Enter a Code"),

              vertical(40),
              // ? Padding(
              //     padding: const EdgeInsets.only(top: 15.0),
              //     child: CircularProgressIndicator(),
              //   )
              // :
              textarea(codeController, "Code"),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    verifyemailcontroller.verifyemailcode(widget.email);
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ),

              vertical(10),
              buttonMain(0.6, "Submit", () {
                if (codeController.text ==
                    verifyemailcontroller.matchCode.value.toString()) {
                  Get.to(() => newpassword());
                } else {
                  showInSnackBar("Incorrect OTP", color: Colors.red);
                }
              }),

              vertical(130),
              accountLogin("Don`t have an account ? ", "Sign up", () {
                Get.to(() => SignupScreen());
              }),
            ],
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
