import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/helpers/const_text.dart';
import '../../../../components/custom_backbutton.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/spacer.dart';
import 'package:flutter_html/flutter_html.dart';

class userPrivacyPolicy extends StatefulWidget {
  const userPrivacyPolicy({super.key});

  @override
  State<userPrivacyPolicy> createState() => _userPrivacyPolicyState();
}

class _userPrivacyPolicyState extends State<userPrivacyPolicy> {
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: BottomSmallStyle(
          top: false,
          body: SizedBox(
            width: Get.width,
            child: Column(
              children: [
                vertical(30),
                boldtext(AppColors.black, 20, "Privacy Policy"),
                vertical(30),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: lighttext(
                          AppColors.black,
                          14,
                          "Welcome to our dating app! Before you use our app, please read these terms and conditions carefully as they form a legally binding agreement between you and our company.Eligibility: You must be at least 18 years old to use our dating app. By using our app, you confirm that you are 18 years old or above"
                          "User Account: You must create an account to use our dating app. You are responsible for maintaining the confidentiality of your account information, including your password. You agree"
                          "Eligibility: You must be at least 18 years old to use our dating app. By using our app, you confirm that you are 18 years old or above"
                          "User Account: You must create an account to use our dating app. You are responsible for maintaining the confidentiality of your account information, including your password. You agree")),
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
                //                     """${snapshot.data['data']['privacy_policy']}"""),
                //           ));
                //         }
                //       })),
                // ),

                // vertical(30),
                Align(
                    alignment: Alignment.bottomLeft, child: CustomBackButton()),

                vertical(30)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<dynamic> getContent() async {
  dynamic posts = {};
  try {
    // This is an open REST API endpoint for testing purposes
    var apiUrl = AppUrl.contentURL;

    final http.Response response = await http.get(Uri.parse(apiUrl), headers: {
      'Authorization': "Bearer  $userToken ",
      'Accept': "application/json"
    });
    posts = json.decode(response.body);
  } catch (err) {
    print(err.toString());
  }

  return posts;
}
