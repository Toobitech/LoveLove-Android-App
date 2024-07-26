import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/authentication/forgetpassword/view/verifyemail.dart';
import 'package:LoveLove/models/authentication/view/signupScreen.dart';
import '../../../global/alertboxes.dart';
import '../../../helpers/assets.dart';
import '../../../helpers/button.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/const_text.dart';
import '../../../helpers/spacer.dart';

import '../controllers/signinController.dart';
import '../widgets/socialLogin.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final signIncontroller = Get.put(SignInController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool viewPass = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signIncontroller.checkGps();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showExitPopup();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  vertical(8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AppImages.logo_Icon,
                      height: Get.height * 0.08,
                    ),
                  ),
                  Image.asset(
                    AppImages.world_Icon,
                    height: Get.height * 0.28,
                  ),

                  boldtext(
                    AppColors.black,
                    28,
                    "Log In Now",
                  ),
                  vertical(10),
                  lighttext(AppColors.black, 12, "Are you here for"),
                  lighttext(
                      AppColors.black, 12, "yourself or for your friend?"),
                  vertical(25),
                  // ? Padding(
                  //     padding: const EdgeInsets.only(top: 15.0),
                  //     child: CircularProgressIndicator(),
                  //   )
                  // :
                  textarea(emailController, "Email"),
                  vertical(10),
                  textarea(passController, "Password"),

                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => verifyemail());
                        },
                        child: Text(
                          'Forget Password',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),

                  vertical(20),
                  buttonMain(0.55, "Log In", () {
                    if (emailController.text.isEmpty) {
                      showInSnackBar('Please Enter Email', color: Colors.red);
                    } else if (passController.text.isEmpty) {
                      showInSnackBar('Please Enter Password',
                          color: Colors.red);
                    } else {
                      signIncontroller.sendpost(
                          emailController.text, passController.text);
                    }
                  }),
                  accountLogin("Don't have an account ? ", "Sign up", () {
                    Get.to(() => SignupScreen());
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textarea(TextEditingController controller, String hint) {
    return SizedBox(
      width: Get.width * 0.65,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: hint == "Password" ? viewPass : false,
        decoration: InputDecoration(
          suffixIcon: hint == "Password"
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      viewPass = !viewPass;
                    });
                  },
                  icon: Icon(
                    viewPass
                        ?Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.black,
                  ))
              : null,
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
