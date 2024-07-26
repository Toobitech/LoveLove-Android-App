import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/bottomsmallStyle.dart';
import 'package:LoveLove/helpers/colors.dart';

import '../../components/custom_backbutton.dart';
import '../../helpers/const_text.dart';
import '../../helpers/spacer.dart';
import '../authentication/widgets/card_widget.dart';
import 'NotificationController.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(),
      ),
      body: BottomSmallStyle(
        topHeight: 0.23,
        body: Container(
          height: Get.height * 0.95,
          child: Padding(
            padding: const EdgeInsets.only(top: 225),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Terms & Condition',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    vertical(10),
                    MyText(firstText: "1. Acceptance of Terms:", lastText:" By accessing or using the LoveLove App, you agree to be bound by these Terms and Conditions. If you do not agree, do not use the app."),
                    MyText(firstText:"2. User Accounts and Security:" , lastText: " You must provide accurate and complete information when creating an account. You are responsible for maintaining the confidentiality of your account and password and for all activities that occur under your account."),
                    MyText(firstText: "3. Content and Conduct:", lastText: " ou are solely responsible for your conduct and any data, text, information, usernames, graphics, photos, profiles, audio, video, and links (content) that you submit, post, and display on the LoveLove App. Illegal, harmful, or offensive content is strictly prohibited."),
                    MyText(firstText: "4. Use of the Service:", lastText: " The LoveLove App is intended for personal, non-commercial use only. You may not use the app for any illegal or unauthorized purpose."),
                    MyText(firstText: "5. Intellectual Property Rights:", lastText: " The LoveLove App and its original content, features, and functionality are owned by LoveLove App and are protected by copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws."),
                    MyText(firstText: "6. Termination:", lastText: " LoveLove App reserves the right to terminate your account if you violate any terms, engage in illegal activity, or for any other reason deemed necessary."),
                    MyText(firstText: "7. Dispute Resolution:", lastText:" All disputes related to these terms will be settled through final and binding arbitration, except for disputes related to intellectual property rights."),
                    MyText(firstText: "8. Changes to Terms: ", lastText: " LoveLove App reserves the right, at our sole discretion, to modify or replace these terms at any time. We will provide notice of significant changes."),
                    MyText(firstText: "9. Contact Information:", lastText: " For any questions or concerns regarding these terms, please contact us at mailto:rose2love4everallways@gmail.com"),

                    
                        
                      
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: lighttext(
                    //       AppColors.black,
                    //       Get.height * 0.017,
                    //       "The LoveLove App Privacy Policy emphasizes user privacy, detailing how user data like personal details and app usage are collected and utilized to improve services and user connections. It outlines user rights regarding their data, including access and modification, and explains data sharing with third parties under certain conditions. The policy also addresses data retention, ensuring data is held no longer than necessary. Updates to the policy will be communicated to users. For further details, users can contact LoveLove App directly."),
                    // ),
                    vertical(30),
                    Center(
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    vertical(10),
                  Text( "The LoveLove App Privacy Policy emphasizes user privacy, detailing how user data like personal details and app usage are collected and utilized to improve services and user connections. It outlines user rights regarding their data, including access and modification, and explains data sharing with third parties under certain conditions. The policy also addresses data retention, ensuring data is held no longer than necessary. Updates to the policy will be communicated to users. For further details, users can contact LoveLove App directly.",style: TextStyle(
                    color: Colors.black,
                    fontSize:14,
                    fontWeight: FontWeight.w900
                  ),),
                    
                        // weig: FontWeight.w0,
                   MyText(firstText: "Our Commitment:", lastText:" At LoveLove App, your privacy and security are paramount. We design our services with your privacy in mind, ensuring transparency and security."),
                    MyText(firstText: "1. Information Collection:", lastText: " We collect personal data (e.g., name, contact details) and usage data to provide and improve our services."),
                    MyText(firstText: "2. Use of Information:", lastText: " Your information is used to manage your account, connect you with other users, improve our service, and for marketing."),
                    MyText(firstText: "3. Sharing of Information:", lastText: "  Information is shared with other users (as per your settings), service providers, and as required by law."),
                    MyText(firstText: "4. Your Rights:", lastText: " You have rights to access, update, delete, or restrict the use of your information."),
                    MyText(firstText: "5. Data Retention:", lastText: "We retain your informaion only as long as necessary for our legitimate business purposes and as required by law."),
                    MyText(firstText: "6. Updates to Policy:", lastText: " We may update this policy and will notify you of significant changes."),
                    MyText(firstText: "Contact Us:", lastText: "For questions or concerns regarding your privacy, please contact us at mailto:rose2love4everallways@gmail.com")
                    

                    
                    // SizedBox(
                    //   height: Get.height * 0.67,
                    //   child: notifycontroller.NotifyList.isEmpty
                    //       ? Center(
                    //           child: boldtext(Colors.grey, 14, "No Data Available"))
                    //       : ListView.builder(
                    //           shrinkWrap: true,
                    //           physics: AlwaysScrollableScrollPhysics(),
                    //           padding: EdgeInsets.zero,
                    //           itemCount: notifycontroller.NotifyList.length,
                    //           itemBuilder: (BuildContext context, int index) {
                    //             return CardWidget(
                    //               child: ListTile(
                    //                 title: mediumtext(AppColors.white, 14,
                    //                     "${notifycontroller.NotifyList[index].description}"),
                    //                 trailing: mediumtext(AppColors.white, 10,
                    //                     "${notifycontroller.NotifyList[index].createdAt.toString().split('T').first}"),
                    //               ),
                    //             );
                    //           }),
                    // )
                
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),


  
    );
  }
}



class MyText extends StatelessWidget {
  final String firstText;
  final String lastText;
  MyText({required this.firstText, required this.lastText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: RichText(
                              text: TextSpan(
                  // Default text style applies to all child TextSpans unless overridden
                  style: TextStyle(
                    fontSize: Get.width*0.035,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  
                  ),
                  children: <TextSpan>[
                    TextSpan(text: firstText),
                    TextSpan(
                      text: lastText,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    
                  ],
                              ),
                            ),
    );
  }
}