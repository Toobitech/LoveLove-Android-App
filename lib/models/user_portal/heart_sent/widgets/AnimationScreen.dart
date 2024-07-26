import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/appbarchat/view/appbarChat.dart';
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/payment_method.dart';

import '../../../../components/circleAnimation.dart';
import '../../../../components/globalvariables.dart';
import '../../../../helpers/colors.dart';
import '../../discover/controllers/ProfileViewController.dart';

class AnimationScreen extends StatefulWidget {
  var image;
  int userId;
  String userName;
  AnimationScreen(
      {super.key,
      required this.image,
      required this.userId,
      required this.userName});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  var controller = Get.put(AnimationCont());
  var profile = Get.find<ProfileViewController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    print('objectAnimation');
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xffE895BF),
          Color(0xff872C5A),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: GetX<AnimationCont>(builder: (controller) {
          return controller.isLoading.value == true
              ? SizedBox.shrink()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimationWidget2(),
                        AnimationWidget(
                          image: widget.image,
                        ),
                      ],
                    ),
                    vertical(25),
                    boldtext(Colors.white, 20, 'You got a new match'),
                    controller.isAnimation.value == true
                        ? SizedBox.shrink()
                        : Column(
                            children: [
                              vertical(20),
                              InkWell(
                                onTap: () async {
                                  if (profile.isChatAvailable.value == true) {
                                    Get.to(() => AppBarChat(
                                        data: profile.chatDocId.value));
                                  } else {
                                    print(appStorage.read(USERID).runtimeType);
                                    print(widget.userId.runtimeType);
                                    List users = [
                                      widget.userId,
                                      appStorage.read(USERID)
                                    ];
                                    print(users);
                                    users.sort();
                                    await FirebaseFirestore.instance
                                        .collection('chats')
                                        .add({
                                      'userId': users,
                                      widget.userId.toString():
                                          widget.userName.toString(),
                                      appStorage.read(USERID).toString():
                                          appStorage.read(userName),
                                      'time': DateTime.now().toUtc(),
                                      'img${appStorage.read(USERID)}':
                                          appStorage
                                              .read(profileUrl)
                                              .toString(),
                                      'img${widget.userId}': 'default.png',
                                      'msg': null
                                    }).then((value) => {
                                              profile.updateAvailable(
                                                  value.id.toString()),
                                              Get.to(() => AppBarChat(
                                                  data: value.id.toString()))
                                            });
                                  }
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Image.asset(AppImages.messaging)),
                              ),
                              vertical(20),
                              InkWell(
                                onTap: () {
                                  Get.to(() => PaymentMethodScreen());
                                },
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 25,
                                    child: Image.asset(AppImages.calling)),
                              ),
                            ],
                          ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                            onPressed: () {
                              Get.to(() => DiscoverMain());
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColors.black,
                            )),
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
