// import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:LoveLove/models/authentication/view/signin.dart';
//
// import '../../../global/snackbar.dart';
// import '../../../helpers/assets.dart';
// import '../../../helpers/button.dart';
// import '../../../helpers/colors.dart';
// import '../../../helpers/const_text.dart';
// import '../../../helpers/spacer.dart';
// import '../controllers/signupController.dart';
//
// import '../widgets/socialLogin.dart';
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   final signUpController = Get.put(SignUpController());
//   TextEditingController emailController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController referralEmailController = TextEditingController();
//   TextEditingController ageController = TextEditingController();
//
//
//   bool viewPass = true;
//   bool selected = false;
//   bool selected1 = false;
//   bool lovedOne=false;
//   bool isChecked=false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 vertical(10),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Image.asset(
//                     AppImages.logo_Icon,
//                     height: Get.height * 0.08,
//                   ),
//                 ),
//                 vertical(10),
//                 Image.asset(
//                   AppImages.chatLove,
//                   height: Get.height * 0.18,
//                 ),
//                 boldtext(AppColors.black, 30, "Sign Up Now"),
//                 vertical(10),
//                 lighttext(
//                     AppColors.black, 12, "Let’s Get Your Account Set Up!"),
//                 lighttext(
//                     AppColors.black, 12, "This will hardly take 5 minutes."),
//                 vertical(25),
//                 textarea(nameController,   "Full Name"),
//                 vertical(10),
//                 textarea(emailController, lovedOne?"Another Person Email" :"Email"),
//                 vertical(10),
//                 textarea(ageController, "Age"),
//                 vertical(10),
//                 textarea(passController, "Password"),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//
//                         SizedBox(width: 40,),
//                         Checkbox(
//                           value: isChecked, // yahan `isChecked` ek boolean variable hoga
//                           onChanged: (value) {
//                             setState(() {
//                               isChecked = value!;
//                             });
//                           },
//                         ),
//                         Text('User Agreement'),
//                       ],
//                     ),
//                     SizedBox(width: 60),
//                   ],
//                 ),
//
//                 vertical(20),
//                 lovedOne? textarea(referralEmailController, "Your Email"):Container(),
//                 vertical(20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selected = true;
//                           selected1 = false;
//                           lovedOne=false;
//                         });
//                       },
//                       child: Container(
//                         width: Get.width * 0.3,
//                         height: Get.height * 0.07,
//                         decoration: BoxDecoration(
//                             color: selected == true
//                                 ? Color(0xff75A6D3)
//                                 : Colors.white,
//                             border: Border.all(
//                                 width: 1,
//                                 color: selected == true
//                                     ? Colors.transparent
//                                     : Colors.grey),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(30.0),
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color(0xFF75A6D3),
//                                 blurRadius: 12,
//                                 offset: Offset(0, 4),
//                                 spreadRadius: 0,
//                               )
//                             ]),
//                         child: Center(
//                             child: mediumtext(
//                                 selected == true
//                                     ? AppColors.white
//                                     : Colors.black,
//                                 14,
//                                 'Yourself')),
//                       ),
//                     ),
//                     horizental(10),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           selected1 = true;
//                           selected = false;
//                           lovedOne=true;
//                         });
//                       },
//                       child: Container(
//                         width: Get.width * 0.3,
//                         height: Get.height * 0.07,
//                         decoration: BoxDecoration(
//                             color: selected1 == true
//                                 ? Color(0xff75A6D3)
//                                 : Colors.white,
//                             border: Border.all(
//                                 width: 1,
//                                 color: selected1 == true
//                                     ? Colors.transparent
//                                     : Colors.grey),
//                             borderRadius: const BorderRadius.all(
//                               Radius.circular(30.0),
//                             ),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Color(0xFF75A6D3),
//                                 blurRadius: 12,
//                                 offset: Offset(0, 4),
//                                 spreadRadius: 0,
//                               )
//                             ]),
//                         child: Center(
//                             child: mediumtext(
//                                 selected1 == true
//                                     ? AppColors.white
//                                     : Colors.black,
//                                 14,
//                                 'For Self')),
//                       ),
//                     ),
//                   ],
//                 ),
//                 vertical(30),
//                 buttonMain(0.55, "Sign Up", () {
//                   if (nameController.text.isEmpty) {
//                     showInSnackBar('Please Enter Full Name', color: Colors.red);
//                   } else if (emailController.text.isEmpty) {
//                     showInSnackBar('Please Enter Email', color: Colors.red);
//                   } else if (ageController.text.isEmpty ||
//                       int.parse(ageController.text) < 18) {
//                     showInSnackBar('Please Enter Age. Must 18 0r Older',
//                         color: Colors.red);
//                   } else if (passController.text.isEmpty) {
//                     showInSnackBar('Please Enter Password', color: Colors.red);
//                   } else if (!selected && !selected1) {
//                     showInSnackBar('Please Select Account Type',
//                         color: Colors.red);
//                   } else {
//                     signUpController.sendpost(
//                       nameController.text,
//                       emailController.text,
//                       ageController.text,
//                       passController.text,
//                       selected == true ? '1' : '0',
//                     );
//                   }
//                 }),
//                 accountLogin("Already have an account ?", "Log In", () {
//                   Get.to(() => WelcomeScreen());
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget textarea(TextEditingController controller, String hint) {
//     return SizedBox(
//       width: Get.width * 0.65,
//       height: 50,
//       child: TextField(
//         controller: controller,
//         obscureText: hint == "Password" ? viewPass : false,
//         decoration: InputDecoration(
//           suffixIcon: hint == "Password"
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       viewPass = !viewPass;
//                     });
//                   },
//                   icon: Icon(
//                     viewPass
//                         ?Icons.visibility_off_outlined
//                         :  Icons.visibility_outlined,
//                     color: AppColors.black,
//                   ))
//               : null,
//           contentPadding: const EdgeInsets.only(left: 20),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: const BorderSide(color: Colors.grey, width: 1.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30.0),
//             borderSide: const BorderSide(color: Colors.grey, width: 1.0),
//           ),
//           hintText: hint,
//         ),
//       ),
//     );
//   }
// }





import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/authentication/view/signin.dart';

import '../../../global/snackbar.dart';
import '../../../helpers/assets.dart';
import '../../../helpers/button.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/const_text.dart';
import '../../../helpers/spacer.dart';
import '../../../useragreement.dart';
import '../controllers/signupController.dart';
import '../widgets/socialLogin.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signUpController = Get.put(SignUpController());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController referralEmailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  bool viewPass = true;
  bool selected = false;
  bool selected1 = false;
  bool lovedOne = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                vertical(10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppImages.logo_Icon,
                    height: Get.height * 0.08,
                  ),
                ),
                vertical(10),
                Image.asset(
                  AppImages.chatLove,
                  height: Get.height * 0.18,
                ),
                boldtext(AppColors.black, 30, "Sign Up Now"),
                vertical(10),
                lighttext(AppColors.black, 12, "Let’s Get Your Account Set Up!"),
                lighttext(AppColors.black, 12, "This will hardly take 5 minutes."),
                vertical(25),
                textarea(nameController, "Full Name"),
                vertical(10),
                textarea(emailController, lovedOne ? "Another Person Email" : "Email"),
                vertical(10),
                textarea(ageController, "Age"),
                vertical(10),
                textarea(passController, "Password"),
                //vertical(5),

                // Checkbox with User Agreement
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 40,),
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;

                        });
                      },
                    ),

                    InkWell(
                      onTap: () {
                        Get.to(UserAgreementScreen());
                      },
                      child: Text('User Agreement'),
                    ),

                  ],
                ),
                vertical(20),

                lovedOne ? textarea(referralEmailController, "Your Email") : Container(),
                vertical(20),

                // Account Type Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected = true;
                          selected1 = false;
                          lovedOne = false;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        height: Get.height * 0.07,
                        decoration: BoxDecoration(
                          color: selected == true ? Color(0xff75A6D3) : Colors.white,
                          border: Border.all(
                              width: 1,
                              color: selected == true ? Colors.transparent : Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF75A6D3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                            child: mediumtext(
                                selected == true ? AppColors.white : Colors.black,
                                14,
                                'Yourself')),
                      ),
                    ),
                    horizental(10),
                    InkWell(
                      onTap: () {
                        setState(() {
                          selected1 = true;
                          selected = false;
                          lovedOne = true;
                        });
                      },
                      child: Container(
                        width: Get.width * 0.3,
                        height: Get.height * 0.07,
                        decoration: BoxDecoration(
                          color: selected1 == true ? Color(0xff75A6D3) : Colors.white,
                          border: Border.all(
                              width: 1,
                              color: selected1 == true ? Colors.transparent : Colors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF75A6D3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                            child: mediumtext(
                                selected1 == true ? AppColors.white : Colors.black,
                                14,
                                'For Self')),
                      ),
                    ),
                  ],
                ),
                vertical(30),

                // Sign Up Button
                buttonMain(0.55, "Sign Up", () {
                  if (nameController.text.isEmpty) {
                    showInSnackBar('Please Enter Full Name', color: Colors.red);
                  } else if (emailController.text.isEmpty) {
                    showInSnackBar('Please Enter Email', color: Colors.red);
                  } else if (ageController.text.isEmpty ||
                      int.parse(ageController.text) < 18) {
                    showInSnackBar('Please Enter Age. Must be 18 or Older', color: Colors.red);
                  } else if (passController.text.isEmpty) {
                    showInSnackBar('Please Enter Password', color: Colors.red);
                  } else if (!selected && !selected1) {
                    showInSnackBar('Please Select Account Type', color: Colors.red);
                  } else if (!isChecked) {
                    showInSnackBar('Please Accept the User Agreement', color: Colors.red);
                  } else {
                    signUpController.sendpost(
                      nameController.text,
                      emailController.text,
                      ageController.text,
                      passController.text,
                      selected == true ? '1' : '0',
                    );
                  }
                }),
                accountLogin("Already have an account ?", "Log In", () {
                  Get.to(() => WelcomeScreen());
                }),
              ],
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
              viewPass ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: AppColors.black,
            ),
          )
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

