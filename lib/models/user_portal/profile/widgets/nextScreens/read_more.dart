import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/models/user_portal/profile/view/userPrivacyPolicy.dart';

import '../../../../../components/custom_backbutton.dart';
import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/spacer.dart';

class ReadMore extends StatefulWidget {
  const ReadMore({super.key});

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BottomSmallStyle(
          topHeight: 0.23,
          top: false,
          body: Column(
            children: [
              vertical(30),
              boldtext(AppColors.black, 20, "Terms And Conditions"),
              vertical(30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: lighttext(
                      AppColors.black,
                      Get.height * 0.017,
                      "Welcome to our dating app! Before you use our app, please read these terms and conditions carefully as they form a legally binding agreement between you and our company.Eligibility: You must be at least 18 years old to use our dating app. By using our app, you confirm that you are 18 years old or above"
                      "User Account: You must create an account to use our dating app. You are responsible for maintaining the confidentiality of your account information, including your password. You agree"),
                ),
              ),
              // Expanded(
              //   child: FutureBuilder(
              //       future: getContent(),
              //       builder: ((context, snapshot) {
              //         if (snapshot.connectionState == ConnectionState.waiting) {
              //           return Center(child: CircularProgressIndicator());
              //         } else if (snapshot.hasError) {
              //           return Center(child: Text('Error fetching HTML'));
              //         } else {
              //           return SingleChildScrollView(
              //               child: SizedBox(
              //             width: Get.width * 0.85,
              //             height: Get.height * 0.7,
              //             child: Html(
              //                 data:
              //                     """${snapshot.data['data']['term_and_condition']}"""),
              //           ));
              //         }
              //       })),
              // ),
              Align(alignment: Alignment.bottomLeft, child: CustomBackButton()),

              vertical(30)
            ],
          ),
        ),
      ),
    );
  }

  Widget rowView(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              text2,
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
