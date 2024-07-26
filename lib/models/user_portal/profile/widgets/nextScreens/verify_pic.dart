import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/read_more.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/waiting_approval.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../global/snackbar.dart';
import '../../../../../helpers/assets.dart';
import '../../../../../helpers/colors.dart';
import '../../controller/profileDataController.dart';

class VerifyPic extends StatefulWidget {
  const VerifyPic({super.key});

  @override
  State<VerifyPic> createState() => _VerifyPicState();
}

class _VerifyPicState extends State<VerifyPic> {
  final myprofileIncontroller = Get.find<MyProfileController>();
  TextStyle defaultStyle = TextStyle(color: Colors.black, fontSize: 12.0);
  // TextStyle linkStyle = TextStyle(color: Colors.blue, fontSize: 12.0);
  bool checkBoxValue = false;
  bool checkBoxValue2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: BottomSmallStyle(
        top: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 80,
                  child: Image.asset(
                    AppImages.camera,
                    height: 70,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: Text(
                'Verified Your Picture',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              )),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                AppImages.camera_dark,
                height: 70,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50),
                child: Row(
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
                    Text(
                      'Picture has been uploaded',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 50),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          checkBoxValue2 = !checkBoxValue2;
                        });
                      },
                      child: Icon(
                        checkBoxValue2
                            ? Icons.check_box
                            : Icons.check_box_outline_blank_rounded,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Agreement form',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 30),
                child: RichText(
                  text: TextSpan(
                    style: defaultStyle,
                    children: [
                      TextSpan(
                        text:
                            'Welcome to our dating app! Before you use our app, please read these terms and conditions',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      TextSpan(
                          text: '    Read More',
                          style: TextStyle(fontSize: 12, color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => ReadMore());
                            }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (checkBoxValue == false) {
                    showInSnackBar("Please Select Uploaded Picture ",
                        color: Colors.red);
                  } else if (checkBoxValue2 == false) {
                    showInSnackBar("Please Select Agreement Form",
                        color: Colors.red);
                  } else {
                    Get.to(() => waiting_approval(
                          userType: myprofileIncontroller.UserDataList!.type
                              .toString(),
                        ));
                  }
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.transparent),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Align(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
