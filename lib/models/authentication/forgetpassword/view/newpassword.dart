import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:LoveLove/models/authentication/forgetpassword/view/passwordchanged.dart';

import '../../../../helpers/assets.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';
import '../../view/signupScreen.dart';
import '../../widgets/socialLogin.dart';
import '../controller/verifyemailController.dart';

class newpassword extends StatefulWidget {
  const newpassword({super.key});

  @override
  State<newpassword> createState() => _newpasswordState();
}

class _newpasswordState extends State<newpassword> {
  TextEditingController newpassController = TextEditingController();
  TextEditingController confirmpassController = TextEditingController();
  final confirmpasscontroller = Get.put(VerifyEmailController());

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
              boldtext(AppColors.black, 28, "New Password"),

              vertical(40),
              // ? Padding(
              //     padding: const EdgeInsets.only(top: 15.0),
              //     child: CircularProgressIndicator(),
              //   )
              // :
              textarea(newpassController, "New Password"),
              vertical(10),
              textarea(confirmpassController, "Confirm Password"),
              vertical(40),
              buttonMain(0.6, "Submit", () {
                if (newpassController.text == confirmpassController.text) {
                  confirmpasscontroller
                      .verificationcode(confirmpassController.text);
                } else {}
              }),

              vertical(90),

              accountLogin("Don`t have an account ? ", "Sign up", () {
                Get.to(() => SignupScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget textarea(TextEditingController controller, String hint) {
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
