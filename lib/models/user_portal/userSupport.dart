import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/snackbar.dart';

import '../../components/globalvariables.dart';
import '../../global/bottomsmallStyle.dart';
import '../../helpers/button.dart';
import '../../helpers/colors.dart';
import '../../helpers/spacer.dart';
import 'UserSupportController.dart';
import 'discover/appbarchat/view/appbarChat.dart';
import 'discover/appbarchat/widgets/textBoxWidget.dart';
import 'discover/controllers/ProfileViewController.dart';

class userSupport extends StatefulWidget {
  const userSupport({super.key});

  @override
  State<userSupport> createState() => _userSupportState();
}

class _userSupportState extends State<userSupport> {
  TextEditingController supportcontroller = TextEditingController();
  final usersupportController = Get.put(UserSupportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: BottomSmallStyle(
        topHeight: 0.23,
        // top: false,
        body: Padding(
          padding: const EdgeInsets.only(top: 150, left: 30, right: 30),
          child: SingleChildScrollView(
            child: GetX<UserSupportController>(builder: (support) {
              return support.isLoading.value == true
                  ? Center(
                      child: CircularProgressIndicator(
                      color: AppColors.pink,
                    ))
                  : Column(
                      children: [
                        vertical(100),
                        // Padding(
                        // padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                        Center(
                          child: Text(
                            'Help & Support',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text(
                          'Write the problem you are facing?',
                          style: TextStyle(
                              fontSize: Get.height * 0.015,
                              fontWeight: FontWeight.bold),
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextField(
                          controller: supportcontroller,
                          maxLines: 6,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            focusedBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(30.0),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                        ),
                        vertical(40),
                        GetX<ProfileViewController>(builder: (profile) {
                          return profile.firebaseLoad.value == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                  color: AppColors.pink,
                                ))
                              : buttonMain(0.5, "Send", () async {
                                  if (profile.isChatAvailable.value == true) {
                                    sendMessageFirebase(profile.chatDocId.value,
                                        supportcontroller.text, 0);
                                    Get.to(() => AppBarChat(
                                        data: profile.chatDocId.value));
                                  } else {
                                    List users = [
                                      support.data!.id,
                                      appStorage.read(USERID)
                                    ];
                                    users.sort();
                                    print(users);
                                    await FirebaseFirestore.instance
                                        .collection('chats')
                                        .add({
                                      'userId': users,
                                      support.data!.id.toString():
                                          support.data!.firstName,
                                      appStorage.read(USERID).toString():
                                          appStorage.read(userName),
                                      'time': DateTime.now().toUtc(),
                                      'img${appStorage.read(USERID)}':
                                          appStorage
                                              .read(profileUrl)
                                              .toString(),
                                      'img${support.data!.id}':
                                          support.data!.profile.toString(),
                                      'msg': null
                                    }).then((value) => {
                                              profile.updateAvailable(
                                                  value.id.toString()),
                                              // FirebaseFirestore.instance.collection('chats').doc(value.id)

                                              sendMessageFirebase(
                                                  value.id.toString(),
                                                  supportcontroller.text,
                                                  0),
                                              Get.to(() => AppBarChat(
                                                  data: value.id.toString()))
                                            });
                                  }
                                  // if (supportcontroller.text.isNotEmpty) {
                                  //   usersupportController.sendquery(supportcontroller.text);
                                  // } else {
                                  //   showInSnackBar('Please Write Problem you are facing',
                                  //       color: Colors.red);
                                  // }
                                },
                                  bgColor: Colors.transparent,
                                  bColor: AppColors.black,
                                  tColor: Colors.black);
                        }),

                        vertical(25),
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: CustomBackButton(),
                        ),
                      ],
                    );
            }),
          ),
        ),
      ),
    );
  }
}
