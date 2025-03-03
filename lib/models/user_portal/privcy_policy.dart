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
                        'Privacy Policy for LoveLove',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.06,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    vertical(10),
                    // MyText(firstText: "Effective Date: 23/01/2025", lastText:"Your privacy is important to us at LoveLove (“we,” “us,” or “our”). This Privacy Policy explains how we collect, use, share, and protect your personal information. It applies to users of our mobile application, website, and related services (collectively, the “Services”). By using our Services, you agree to the collection and use of your information in accordance with this Policy."),

                    MyText(firstText: "Effective Date: 1/25/2025",lastText:"\n\n Your privacy is important to us at LoveLove (“we,” “us,” or “our”). This Privacy Policy explains how we collect, use, share, and protect your personal information. It applies to users of our mobile application, website, and related services (collectively, the “Services”). By using our Services, you agree to the collection and use of your information in accordance with this Policy."),


                    // MyText(firstText: "1. Information We Collect",lastText:""),

                    // Row(
                    //   children: [
                    //     Text('\n1. Information We Collect',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    //   SizedBox(width: 50,),
                    //   ],
                    // ),
                    //
                    // MyText(firstText: "Personal Information: ",lastText:"\nWe may collect information you provide during registration or profile creation, such as your name, email address, age, gender, sexual orientation, photos, and any other details you choose to include in your profile."),

                    //
                    // MyText(firstText: "1. Information We Collect \n\n",lastText:"Personal Information: We may collect information you provide during registration or profile creation, such as your name, email address, age, gender, sexual orientation, photos, and any other details you choose to include in your profile.Usage Information: We may automatically collect data about how you interact with the Services, including your device type, IP address, browser type, operating system, and app usage patterns.Location Data: With your permission, we may collect and use your location to help improve matching results and suggest potential matches nearby.User-Generated Content: Any information, text, images, or other content you choose to share on your profile or in messages with other users may be collected and stored."),
                    //
                    // MyText(firstText: "2. How We Use Your Information",lastText:"Providing and Improving the Services: We use the information we collect to create and manage your account, provide customer support, and improve your overall experience.Matching Algorithm: We use the personal information you provide—such as your age, location, preferences, and other profile data—alongside aggregated user behavior data, to power our proprietary matching algorithm. This algorithm aims to present you with potential matches that align with your stated preferences and increase the likelihood of meaningful connections.Personalization: We may use your information to personalize content, recommendations, and features, tailoring the user experience to your interests and behaviors.Analytics and Research: We use aggregated and anonymized information for analytics, including understanding user behavior, monitoring usage trends, and improving our Services and matching algorithms."),
                    // MyText(firstText: "",lastText:""),
                    //
                    // MyText(firstText: "3. How We Share Your Information",lastText:"With Other Users: Certain profile details, such as your name, photos, age, and general interests, may be visible to other users. You control what information appears on your profile.Third-Party Service Providers: We may share your information with trusted third-party vendors that help us operate our Services. For example, we may use analytics providers, cloud storage, or customer support tools. These providers are bound by contractual obligations to keep your information confidential and secure.Legal and Regulatory Requirements: We may disclose your information as required by law, or if we believe in good faith that such action is necessary to protect the safety, rights, or property of LoveLove, our users, or others."),
                    //
                    // MyText(firstText: "4. Your Choices",lastText:"Updating Your Information: You can update or remove certain information in your profile at any time.Opt-Out of Location Tracking: You can disable location-based features by changing your device or app settings, though doing so may affect certain matching results.Deleting Your Account: You may request deletion of your account at any time. Upon deletion, we will remove or anonymize your personal information as required by applicable law."),
                    //
                    // MyText(firstText: "5. Security",lastText:"We take reasonable security measures to protect your data from unauthorized access, misuse, loss, or disclosure. Despite these efforts, no method of data transmission or storage is completely secure. We encourage you to safeguard your account credentials and promptly report any suspicious activity to our support team."),
                    //
                    // MyText(firstText: "6. International Data Transfers",lastText:"If you access the Services from outside of your home country, your information may be transferred to, stored, and processed in other countries where our servers or facilities are located. We strive to ensure that international transfers comply with applicable data protection laws."),
                    //
                    //
                    // MyText(firstText: "7. Children’s Privacy",lastText:"Our Services are intended for users aged 18 and older. We do not knowingly collect personal information from children under the age of 18. If you believe we have inadvertently collected such information, please contact us, and we will take steps to delete it."),
                    //
                    // MyText(firstText: "8. Changes to This Privacy Policy",lastText:"We may update this Policy from time to time. If we make significant changes, we will notify you through our Services or by other appropriate means. Your continued use of our Services after any changes indicates your acceptance of the revised Policy."),
                    //
                    // MyText(firstText: "9. Meeting Connections Outside the LoveLove Platform",lastText:"While our Services are designed to help users connect and interact, any decision to meet in person or communicate outside of the LoveLove platform is made at your own risk. LoveLove does not conduct background checks or guarantee the behavior, intentions, or authenticity of other users. We are not liable for any outcomes, disputes, damages, or harm resulting from such interactions. We encourage users to exercise caution, meet in public spaces, and follow safety best practices when meeting individuals from our platform."),
                    //
                    //
                    // MyText(firstText: "10. Contact Us",lastText:"If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:\n\nEmail: [Insert Contact Email]\nMailing Address: [Insert Mailing Address]"),

             // old
                    // MyText(firstText:"2. User Accounts and Security:" , lastText: " You must provide accurate and complete information when creating an account. You are responsible for maintaining the confidentiality of your account and password and for all activities that occur under your account."),
                    // MyText(firstText: "3. Content and Conduct:", lastText: " ou are solely responsible for your conduct and any data, text, information, usernames, graphics, photos, profiles, audio, video, and links (content) that you submit, post, and display on the LoveLove App. Illegal, harmful, or offensive content is strictly prohibited."),
                    // MyText(firstText: "4. Use of the Service:", lastText: " The LoveLove App is intended for personal, non-commercial use only. You may not use the app for any illegal or unauthorized purpose."),
                    // MyText(firstText: "5. Intellectual Property Rights:", lastText: " The LoveLove App and its original content, features, and functionality are owned by LoveLove App and are protected by copyright, trademark, patent, trade secret, and other intellectual property or proprietary rights laws."),
                    // MyText(firstText: "6. Termination:", lastText: " LoveLove App reserves the right to terminate your account if you violate any terms, engage in illegal activity, or for any other reason deemed necessary."),
                    // MyText(firstText: "7. Dispute Resolution:", lastText:" All disputes related to these terms will be settled through final and binding arbitration, except for disputes related to intellectual property rights."),
                    // MyText(firstText: "8. Changes to Terms: ", lastText: " LoveLove App reserves the right, at our sole discretion, to modify or replace these terms at any time. We will provide notice of significant changes."),
                    // MyText(firstText: "9. Contact Information:", lastText: " For any questions or concerns regarding these terms, please contact us at mailto:rose2love4everallways@gmail.com"),

                    
                        
                      
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20),
                    //   child: lighttext(
                    //       AppColors.black,
                    //       Get.height * 0.017,
                    //       "The LoveLove App Privacy Policy emphasizes user privacy, detailing how user data like personal details and app usage are collected and utilized to improve services and user connections. It outlines user rights regarding their data, including access and modification, and explains data sharing with third parties under certain conditions. The policy also addresses data retention, ensuring data is held no longer than necessary. Updates to the policy will be communicated to users. For further details, users can contact LoveLove App directly."),
                    // ),
                  //   vertical(30),
                  //   Center(
                  //     child: Text(
                  //       'Terms and Conditions',
                  //       style: TextStyle(
                  //           fontSize: MediaQuery.of(context).size.width * 0.06,
                  //           fontWeight: FontWeight.w900),
                  //     ),
                  //   ),
                  //   vertical(10),
                  // Text( "Reporting Fake Profiles and Harassment :  If you encounter a fake profile, harassment, or any user causing harm or discomfort, please notify us immediately through the in-app reporting feature or by contacting our support team. We are committed to maintaining a safe and respectful environment for all users and will take prompt action, including removing offending profiles and implementing additional measures as necessary.",style: TextStyle(
                  //   color: Colors.black,
                  //   fontSize:14,
                  //   fontWeight: FontWeight.w900
                  // ),),
                  //
                  //       // weig: FontWeight.w0,
                  //  MyText(firstText: "User Responsibility :", lastText:" Users are expected to behave respectfully and responsibly while using the platform. Engaging in activities such as impersonation, harassment, abuse, or any form of harmful conduct will result in account suspension or permanent removal."),
                  //
                  //   MyText(firstText: "	Safety and Caution : ", lastText:"LoveLove does not conduct background checks on users. Interactions within the app and decisions to meet outside the platform are at your own discretion. Exercise caution, particularly when meeting in person, and follow safety best practices. "),
                  //
                  //
                  //   MyText(firstText: "	Content Moderation :", lastText:"LoveLove reserves the right to review, moderate, and remove any content, profile, or interaction that violates our community guidelines or policies."),
                  //
                  //   MyText(firstText: "", lastText:" "),


                      sectionTitle('1. Information We Collect'),
                      sectionContent(
                        'Personal Information:',
                        'We may collect information you provide during registration or profile creation, such as your name, email address, age, gender, sexual orientation, photos, and any other details you choose to include in your profile.',
                      ),
                      sectionContent(
                        'Usage Information:',
                        'We may automatically collect data about how you interact with the Services, including your device type, IP address, browser type, operating system, and app usage patterns.',
                      ),
                      sectionContent(
                        'Location Data:',
                        'With your permission, we may collect and use your location to help improve matching results and suggest potential matches nearby.',
                      ),
                      sectionContent(
                        'User-Generated Content:',
                        'Any information, text, images, or other content you choose to share on your profile or in messages with other users may be collected and stored.',
                      ),
                      sectionTitle('2. How We Use Your Information'),
                      sectionContent(
                        'Providing and Improving the Services:',
                        'We use the information we collect to create and manage your account, provide customer support, and improve your overall experience.',
                      ),
                      sectionContent(
                        'Matching Algorithm:',
                        'We use the personal information you provide—such as your age, location, preferences, and other profile data—alongside aggregated user behavior data, to power our proprietary matching algorithm.',
                      ),
                      sectionContent(
                        'Personalization:',
                        'We may use your information to personalize content, recommendations, and features, tailoring the user experience to your interests and behaviors.',
                      ),
                      sectionContent(
                        'Analytics and Research:',
                        'We use aggregated and anonymized information for analytics, including understanding user behavior, monitoring usage trends, and improving our Services and matching algorithms.',
                      ),
                      sectionTitle('3. How We Share Your Information'),
                      sectionContent(
                        'With Other Users:',
                        'Certain profile details, such as your name, photos, age, and general interests, may be visible to other users. You control what information appears on your profile.',
                      ),
                      sectionContent(
                        'Third-Party Service Providers:',
                        'We may share your information with trusted third-party vendors that help us operate our Services.',
                      ),
                      sectionContent(
                        'Legal and Regulatory Requirements:',
                        'We may disclose your information as required by law, or if we believe in good faith that such action is necessary to protect safety, rights, or property.',
                      ),
                      sectionTitle('4. Your Choices'),
                      sectionContent(
                        'Updating Your Information:',
                        'You can update or remove certain information in your profile at any time.',
                      ),
                      sectionContent(
                        'Opt-Out of Location Tracking:',
                        'You can disable location-based features by changing your device or app settings, though doing so may affect certain matching results.',
                      ),
                      sectionContent(
                        'Deleting Your Account:',
                        'You may request deletion of your account at any time. Upon deletion, we will remove or anonymize your personal information as required by applicable law.',
                      ),
                      sectionTitle('5. Security'),
                      sectionContent(
                        '',
                        'We take reasonable security measures to protect your data from unauthorized access, misuse, loss, or disclosure. No method of data transmission or storage is completely secure.',
                      ),
                      sectionTitle('6. International Data Transfers'),
                      sectionContent(
                        '',
                        'If you access the Services from outside of your home country, your information may be transferred to, stored, and processed in other countries.',
                      ),
                      sectionTitle('7. Children’s Privacy'),
                      sectionContent(
                        '',
                        'Our Services are intended for users aged 18 and older. We do not knowingly collect personal information from children under the age of 18.',
                      ),
                      sectionTitle('8. Changes to This Privacy Policy'),
                      sectionContent(
                        '',
                        'We may update this Policy from time to time. Your continued use of our Services after any changes indicates your acceptance of the revised Policy.',
                      ),
                      sectionTitle('9. Meeting Connections Outside the Platform'),
                      sectionContent(
                        '',
                        'Any decision to meet in person or communicate outside of the platform is made at your own risk. We encourage caution and safety best practices.',
                      ),


                      // Privacy Policy Header
                      Text(
                        'Privacy Policy',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      // Section 1: Information We Collect
                      Text(
                        '1. Information We Collect',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      MyText(
                        firstText: 'Personal Information: ',
                        lastText:
                        'We may collect information you provide during registration or profile creation, such as your name, email address, age, gender, sexual orientation, photos, and any other details you choose to include in your profile.',
                      ),
                      MyText(
                        firstText: 'Usage Information: ',
                        lastText:
                        'We may automatically collect data about how you interact with the Services, including your device type, IP address, browser type, operating system, and app usage patterns.',
                      ),
                      MyText(
                        firstText: 'Location Data: ',
                        lastText:
                        'With your permission, we may collect and use your location to help improve matching results and suggest potential matches nearby.',
                      ),
                      MyText(
                        firstText: 'User-Generated Content: ',
                        lastText:
                        'Any information, text, images, or other content you choose to share on your profile or in messages with other users may be collected and stored.',
                      ),
                      SizedBox(height: 20),

                      // Section 2: How We Use Your Information
                      Text(
                        '2. How We Use Your Information',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      MyText(
                        firstText: 'Providing and Improving the Services: ',
                        lastText:
                        'We use the information we collect to create and manage your account, provide customer support, and improve your overall experience.',
                      ),
                      MyText(
                        firstText: 'Matching Algorithm: ',
                        lastText:
                        'We use the personal information you provide—such as your age, location, preferences, and other profile data—alongside aggregated user behavior data, to power our proprietary matching algorithm. This algorithm aims to present you with potential matches that align with your stated preferences and increase the likelihood of meaningful connections.',
                      ),
                      MyText(
                        firstText: 'Personalization: ',
                        lastText:
                        'We may use your information to personalize content, recommendations, and features, tailoring the user experience to your interests and behaviors.',
                      ),
                      SizedBox(height: 20),

                      // Other Privacy Policy Sections
                      _sectionTitle('3. How We Share Your Information'),
                      _sectionContent(
                          'With Other Users: Certain profile details, such as your name, photos, age, and general interests, may be visible to other users. You control what information appears on your profile.'),
                      _sectionContent(
                          'Third-Party Service Providers: We may share your information with trusted third-party vendors that help us operate our Services. These providers are bound by contractual obligations to keep your information confidential and secure.'),
                      SizedBox(height: 20),

                      // Contact Us Section
                      Text(
                        '10. Contact Us',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      MyText(
                        firstText: 'Email: ',
                        lastText: 'lovelove5b@gmail.com',
                      ),
                      MyText(
                        firstText: 'Mailing Address: ',
                        lastText: '[Insert Mailing Address]',
                      ),
                      SizedBox(height: 20),

                      // Terms and Conditions Header
                      Text(
                        'Terms and Conditions',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

                      // Terms Content
                      MyText(
                        firstText: 'Reporting Fake Profiles and Harassment: ',
                        lastText:
                        'If you encounter a fake profile, harassment, or any user causing harm or discomfort, please notify us immediately through the in-app reporting feature or by contacting our support team.',
                      ),
                      MyText(
                        firstText: 'User Responsibility: ',
                        lastText:
                        'Users are expected to behave respectfully and responsibly while using the platform. Engaging in activities such as impersonation, harassment, abuse, or any form of harmful conduct will result in account suspension or permanent removal.',
                      ),
                      MyText(
                        firstText: 'Safety and Caution: ',
                        lastText:
                        'LoveLove does not conduct background checks on users. Interactions within the app and decisions to meet outside the platform are at your own discretion. Exercise caution, particularly when meeting in person, and follow safety best practices.',
                      ),
                      MyText(
                        firstText: 'Content Moderation: ',
                        lastText:
                        'LoveLove reserves the right to review, moderate, and remove any content, profile, or interaction that violates our community guidelines or policies.',
                      ),
                    ],

                    
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

Widget _sectionTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
  );
}

Widget _sectionContent(String content) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Text(
      content,
      style: TextStyle(fontSize: 14, color: Colors.black87),
    ),
  );
}


Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  );
}

Widget sectionContent(String firstText, String lastText) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        children: [
          if (firstText.isNotEmpty)
            TextSpan(
              text: '$firstText ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          TextSpan(text: lastText),
        ],
      ),
    ),
  );
}

