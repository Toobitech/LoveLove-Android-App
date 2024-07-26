import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/models/user_portal/messages/view/messages_main.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/skipScreens/reference_link.dart';

import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/button.dart';
import '../../../../helpers/spacer.dart';
import '../../discover/controllers/ProfileViewController.dart';
import '../../discover/view/discoverMain.dart';
import '../controller/invitelinkController.dart';

class waiting_approval extends StatefulWidget {
  final String userType;
  const waiting_approval({super.key, required this.userType});

  @override
  State<waiting_approval> createState() => _waiting_approvalState();
}

class _waiting_approvalState extends State<waiting_approval> {
  final myprofileIncontroller = Get.find<ProfileViewController>();
  var invitationcontroller = Get.put(InviteLinkController());
  // var data;
  // String? inviteLinkis;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // invitationcontroller.referencelink();
    myprofileIncontroller.getInviteLink(
        widget.userType == 'user' ? 'reference_link' : 'user_link', true);
    // print(data);
    // print(data!['url']);
  }

  @override
  Widget build(BuildContext context) {
    print('UserReferenceType ${widget.userType}');

    print('UserReferenceInviteLink ${myprofileIncontroller.inviteLink}');
    // inviteLinkis = myprofileIncontroller.getInviteLink(
    //     widget.userType == 'user' ? 'reference_link' : 'user_link', true);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => DiscoverMain());
            },
            icon: Icon(
              Icons.home,
              color: AppColors.gradientLight,
            )),
      ),
      body: BottomSmallStyle(
        topHeight: 0.23,
        top: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                vertical(200),
                // Padding(
                // padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                Text(
                  'Request for Profile has ',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  ' been submitted to the ',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  'Admin',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w800),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                vertical(40),
                buttonMain(0.7, "Waiting for Approval", () {}),
                vertical(10),
                Obx(() => myprofileIncontroller.linkisLoading.isTrue
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.pink,
                        ),
                      )
                    : buttonMain(0.7, "Reference Link", () {
                        Get.to(() => ReferenceLink(
                              link: myprofileIncontroller.inviteLink.value,
                            ));
                      })),

                vertical(180),
                Align(
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

                // )
              ],
            ),
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
          Text(text1),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Text(
              text2,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
