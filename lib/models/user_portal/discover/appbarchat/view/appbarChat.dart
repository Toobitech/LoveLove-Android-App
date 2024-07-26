// import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: must_be_immutable

import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';

import '../widgets/textBoxWidget.dart';

class AppBarChat extends StatelessWidget {
  String data;
  AppBarChat({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: CustomBackButton()
          //  IconButton(
          //     onPressed: () {
          //       Get.back();
          //     },
          //     icon: Icon(
          //       Icons.arrow_back_ios_new_outlined,
          //       color: AppColors.black,
          //     )),
          ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats')
              .doc('$data')
              .collection('messages')
              .orderBy("count", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data1 = snapshot.data?.docs;
              var msgs = snapshot.data!.docs.map((e) => e.data()).toList();

              print(data1!.length);

              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * 0.25,
                      child: Image.asset(AppImages.topchat, fit: BoxFit.fill),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height * 0.2,
                      child: Image.asset(
                        AppImages.bottomChat,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        vertical(Get.height * 0.2),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            width: Get.width,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                reverse: true,
                                padding: EdgeInsets.zero,
                                itemCount: msgs.length,
                                itemBuilder: (context, index) {
                                  // children: [
                                  return Column(
                                    children: [
                                      //=========================================================================
                                      Align(
                                        alignment: appStorage.read(USERID) !=
                                                msgs[index]['id']
                                            ? Alignment.centerLeft
                                            : Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          margin: EdgeInsets.only(
                                              bottom: 10,
                                              left: appStorage.read(USERID) !=
                                                      msgs[index]['id']
                                                  ? 0
                                                  : 100,
                                              right: appStorage.read(USERID) !=
                                                      msgs[index]['id']
                                                  ? 200
                                                  : 0),
                                          decoration: BoxDecoration(
                                            color: AppColors.lightpink,
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(10),
                                                topRight:
                                                    const Radius.circular(10),
                                                bottomRight: Radius.circular(
                                                    appStorage.read(USERID) !=
                                                            msgs[index]['id']
                                                        ? 10
                                                        : 0),
                                                bottomLeft: Radius.circular(
                                                    appStorage.read(USERID) !=
                                                            msgs[index]['id']
                                                        ? 0
                                                        : 10)),
                                          ),
                                          child: Text("${msgs[index]['msg']}"),
                                        ),
                                      ),
                                      //======================================================================
                                    ],
                                  );

                                  // ChatViewCard(
                                  //     isMe: true,
                                  //     text:
                                  //         "I'm doing pretty well, thanks for asking. So, tell me a little bit about yourself. What do you like to do for fun?"),
                                  // ],
                                }),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.07,
                        ),
                        Expanded(
                            child: SendMsgBox(
                          docId: data,
                          count: data1.length,
                        ))
                      ],
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          }),
    );
  }
}
