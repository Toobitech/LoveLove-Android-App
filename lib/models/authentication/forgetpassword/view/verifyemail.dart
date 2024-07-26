import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';

import '../../../../helpers/assets.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';
import '../../controllers/signinController.dart';
import '../../view/signupScreen.dart';
import '../../widgets/socialLogin.dart';
import '../controller/verifyemailController.dart';

class verifyemail extends StatefulWidget {
  const verifyemail({super.key});

  @override
  State<verifyemail> createState() => _verifyemailState();
}

class _verifyemailState extends State<verifyemail> {
  final signIncontroller = Get.put(SignInController());
  final verifyemailcontroller = Get.put(VerifyEmailController());
  TextEditingController emailController = TextEditingController();

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
              boldtext(AppColors.black, 28, "Verify Email"),

              vertical(40),
              // ? Padding(
              //     padding: const EdgeInsets.only(top: 15.0),
              //     child: CircularProgressIndicator(),
              //   )
              // :
              textarea(emailController, "Email"),

              vertical(40),
              buttonMain(0.6, "Next", () {
                if (emailController.text.isNotEmpty) {
                  verifyemailcontroller.verifyemailcode(emailController.text);
                } else {
                  showInSnackBar('Please Enter Verification Email',
                      color: Colors.red);
                }
              }),

              vertical(200),
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
