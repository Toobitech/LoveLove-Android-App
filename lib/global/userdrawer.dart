import 'package:LoveLove/models/user_portal/professional/call_logs_screen.dart';
import 'package:LoveLove/models/user_portal/professional/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/heart_sent/view/heart_sentScreen.dart';
import 'package:LoveLove/models/user_portal/profile/view/editProfileMain.dart';
import '../components/globalvariables.dart';
import '../helpers/assets.dart';
import '../helpers/colors.dart';
import '../models/user_portal/UserSupportController.dart';
import '../models/user_portal/heart_sent/controller/heart_sentController.dart';
import '../models/user_portal/privcy_policy.dart';
import '../models/user_portal/professional/user_profile_screen.dart';
import '../models/user_portal/userSupport.dart';
import 'alertboxes.dart';

class userdrawer extends StatefulWidget {
  final bool professionalUser;
  const userdrawer({super.key, this.professionalUser = false});

  @override
  State<userdrawer> createState() => _userdrawerState();
}

class _userdrawerState extends State<userdrawer> {
  String selectedID = '';
  final heartsentIncontroller = Get.put(HeartSentController());
  final usersupportController = Get.put(UserSupportController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      width: Get.width * 0.6,
      elevation: 0,
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(30))),
                child: ListTile(
                  leading: Image.asset(
                    AppImages.edit_profile,
                    width: 25,
                  ),
                  title: Text("Edit Profile",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.black)),
                  onTap: () {
                    Get.to(() => EditProfileMain());
                  },
                ),
              ),
              widget.professionalUser
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // borderRadius:
                        //     BorderRadius.only(topRight: Radius.circular(30))
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          AppImages.home,
                          width: 25,
                        ),
                        title: Text("Professional",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.03,
                                color: Colors.black)),
                        onTap: () {
                          Get.to(() => UserProfileScreen());
                        },
                      ),
                    ),
              Visibility(
                visible: widget.professionalUser,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.asset(
                      AppImages.deposite,
                      width: 25,
                    ),
                    title: Text("Deposit",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            color: Colors.black)),
                    onTap: () {
                      Get.to(() => PaymentScreen());
                    },
                  ),
                ),
              ),
              Visibility(
                visible: widget.professionalUser,
                child: Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Image.asset(
                      AppImages.call_icon,
                      color: AppColors.black,
                      width: 20,
                    ),
                    title: Text("Call Logs",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            color: Colors.black)),
                    onTap: () {
                      Get.to(() => CallLogsScreen());
                    },
                  ),
                ),
              ),
              widget.professionalUser
                  ? SizedBox()
                  : appStorage.read(ACCOUNT_FOR) != '1'
                      ? const SizedBox.shrink()
                      : Column(children: [
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Image.asset(
                                AppImages.heart_sent,
                                width: 25,
                              ),
                              title: Text("Heart Sent",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      color: Colors.black)),
                              onTap: () {
                                heartsentIncontroller
                                    .fetchHeartSentData('Heart Sent');

                                Get.to(() => heart_sent(
                                      title: 'Heart Sent',
                                    ));
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Image.asset(
                                AppImages.heart_sent,
                                width: 25,
                              ),
                              title: Text("Heart Received",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      color: Colors.black)),
                              onTap: () {
                                heartsentIncontroller
                                    .fetchHeartSentData('Heart Received');
                                Get.to(() => heart_sent(
                                      title: 'Heart Received',
                                    ));
                              },
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Image.asset(
                                AppImages.recommendations,
                                width: 25,
                              ),
                              title: Text("Recommendations",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.03,
                                      color: Colors.black)),
                              onTap: () {
                                heartsentIncontroller
                                    .fetchHeartSentData('Recommendations');
                                Get.to(() => heart_sent(
                                      title: 'Recommendations',
                                    ));
                              },
                            ),
                          ),
                        ]),
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: Image.asset(
                    AppImages.support,
                    width: 25,
                  ),
                  title: Text("Help and Support",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.black)),
                  onTap: () {
                    usersupportController.SendQuery();
                    print(usersupportController.data?.id);
                    Get.to(() => userSupport());
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: ListTile(
                  leading: Image.asset(
                    AppImages.privacy_policy,
                    width: 25,
                  ),
                  title: Text("Privacy Policy",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.black)),
                  onTap: () {
                    Get.to(() => PrivacyPolicyScreen());
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius:
                  //     BorderRadius.only(bottomRight: Radius.circular(30))
                ),
                child: ListTile(
                  leading: Image.asset(
                    AppImages.logout,
                    width: 25,
                  ),
                  title: Text("Logout",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.black)),
                  onTap: () {
                    showLogoutPopup();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30))),
                child: ListTile(
                  leading: Image.asset(
                    AppImages.delete_icon,
                    width: 20,
                    color: AppColors.black,
                  ),
                  title: Text("Delete Account",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          color: Colors.black)),
                  onTap: () {
                    // print(usersupportController.data);
                    showDeletePopup();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
