import 'dart:convert';
import 'dart:developer';

import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/models/user_portal/professional/proffessional_plan_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/customAppBar.dart';
import '../../../../global/userdrawer.dart';
import '../../../components/custom_backbutton.dart';
import '../../../components/custombutton_wigdet.dart';
import '../../../components/globalvariables.dart';
import '../../../global/snackbar.dart';
import '../discover/appbarchat/view/appbarChat.dart';
import '../discover/controllers/ProfileViewController.dart';
import '../profile/controller/profileDataController.dart';
import 'calender.dart';
import 'call/calling_service.dart';
import 'controller/notification_service.dart';
import 'controller/profession_controller.dart';
import 'model/pricing_model.dart';

class ProfessionDetailScreen extends StatefulWidget {
  UserData professionData;
  ProfessionDetailScreen({super.key, required this.professionData});

  @override
  State<ProfessionDetailScreen> createState() => _ProfessionDetailScreenState();
}

class _ProfessionDetailScreenState extends State<ProfessionDetailScreen> {
  final controller = Get.put(ProfileViewController());
  final userController = Get.find<MyProfileController>();
  final proffController = Get.put(ProfessionController());

  @override
  Widget build(BuildContext context) {
    print("Free Call Is  " + userController.UserDataList!.freeCall.toString());
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.white,
      drawer: const userdrawer(
        professionalUser: true,
      ),
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(25, Get.height * 0.22, 25, 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: Get.height * 0.04),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: const EdgeInsets.only(bottom: 25, top: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.gradientLight,
                              AppColors.gradientDark
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.height * 0.12,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.gradientLight, width: 2),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        widget.professionData.profile ==
                                                'default.png'
                                            ? AppUrl.impath +
                                                widget.professionData.profile
                                                    .toString()
                                            : AppUrl.imagePath +
                                                widget.professionData.profile
                                                    .toString()),
                                    fit: BoxFit.fitHeight)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "${widget.professionData.firstName} ${widget.professionData.lastName}",
                                    style: TextStyle(
                                        fontSize: Get.height * 0.025,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: widget.professionData.profession ==
                                            null
                                        ? ''
                                        : '\n ${widget.professionData.profession}',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.02,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Text(
                              widget.professionData.about == null
                                  ? 'No Discription'
                                  : '${widget.professionData.about} ',
                              style: TextStyle(
                                  fontSize: Get.height * 0.016,
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              softWrap: false,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 9),
                      child: Column(
                        children: [
                          Text(
                            'FREE',
                            style: TextStyle(
                                fontSize: Get.height * 0.03,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'FIRST 15 MINUTES',
                            style: TextStyle(
                                fontSize: Get.height * 0.02,
                                color: AppColors.pink,
                                fontWeight: FontWeight.bold),
                          ),
                          vertical(25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  // NotificationServices.sendNotificationFunction(
                                  //     widget.professionData.deviceToken
                                  //         .toString(),
                                  //     'Thomas');
                                  if (controller.isChatAvailable.value ==
                                      true) {
                                    Get.to(() => AppBarChat(
                                        data: widget.professionData.id
                                            .toString()));
                                  } else {
                                    List users = [
                                      widget.professionData.id,
                                      appStorage.read(USERID)
                                    ];
                                    users.sort();
                                    print(users);
                                    await FirebaseFirestore.instance
                                        .collection('chats')
                                        .add({
                                      'userId': users,
                                      widget.professionData.id.toString():
                                          widget.professionData.firstName!,
                                      appStorage.read(USERID).toString():
                                          appStorage.read(userName),
                                      'time': DateTime.now().toUtc(),
                                      'img${appStorage.read(USERID)}':
                                          appStorage
                                              .read(profileUrl)
                                              .toString(),
                                      'img${widget.professionData.id.toString()}':
                                          widget.professionData.profile
                                              .toString(),
                                      'msg': null
                                    }).then((value) => {
                                              controller.updateAvailable(
                                                  value.id.toString()),
                                              Get.to(() => AppBarChat(
                                                  data: value.id.toString()))
                                            });
                                  }
                                  print('ChatApp');
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.gradientLight,
                                          AppColors.gradientDark
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.055,
                                        child: Image.asset(
                                          'assets/images/icons/chat.png',
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.035),
                                      Text(
                                        "Chat",
                                        style: TextStyle(
                                            fontSize: Get.height * 0.023,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // sendCallButton(
                              //   widget.professionData.id.toString(),
                              //   widget.professionData.firstName.toString(),
                              //   onCallFinished: onSendCallInvitationFinished,
                              // ),
                              GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () async {
                                  setState(() {
                                    var userCID =
                                        appStorage.read("currentUserId");
                                    print("SetUserId $userCID");
                                    userId = userCID.toString();
                                    USERNAME = appStorage.read(userName);
                                    print(
                                        "SetUserDetails $userId $USERNAME  $userCID");
                                  });
                                  print(
                                      'AllInOne ${widget.professionData.id}${widget.professionData.firstName!}${widget.professionData.userId}');
                                  Map<String, dynamic> data =
                                      await proffController.postCallingReguest(
                                          widget.professionData.id.toString(),
                                          widget.professionData.id.toString(),
                                          widget.professionData.firstName
                                              .toString());
                                  print('Response Data Calfdsinng ${data}');
                                  // Map<String, dynamic> data = jsonDecode(res);
                                  print(data['success']);
                                  // print(data['data']['profession_id']);

                                  if (data['success'] == true) {
                                    print(data['data']['mins']);
                                    int time = data['data']['mins'];
                                    int bookingId = data['data']['id'];
                                    print(time);
                                    NotificationServices
                                        .sendNotificationFunction(
                                            widget.professionData.deviceToken
                                                .toString(),
                                            USERNAME.toString());
                                    onUserLogin(
                                        userId.toString(),
                                        USERNAME.toString(),
                                        time,
                                        widget.professionData.id,
                                        bookingId);
                                    proffController
                                        .postChangeHealth('positive');
                                    checkCallingShowDialog(
                                        context,
                                        widget.professionData.id.toString(),
                                        widget.professionData.firstName
                                            .toString());
                                  } else {
                                    if (userController.UserDataList!.freeCall ==
                                        0) {
                                      print('yes');
                                      PricingModel item = PricingModel(
                                          userId: widget.professionData.id,
                                          amount: '0',
                                          mins: 15);
                                      // print('Pricing Model Data');
                                      // print(item.toString());
                                      // String jsonString = jsonEncode(item);
                                      // print(jsonString);
                                      await showDialog<DateTime>(
                                        context: context,
                                        builder: (context) => CalendarDialog(
                                          dataSet: item,
                                          professionUid:
                                              widget.professionData.id,
                                          professioName: widget
                                              .professionData.firstName
                                              .toString(),
                                        ),
                                      );
                                    } else {
                                      checkShowDialog(context);
                                    }
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 8, bottom: 8, right: 20, left: 10),
                                  decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xff65B1F6),
                                          Color.fromARGB(255, 109, 155, 197),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(13),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: const Color(0xff65B1F6),
                                            border: Border.all(
                                                color: AppColors.white,
                                                width: 2)),
                                        child:
                                            //  sendCallButton(
                                            //   widget.professionData.id.toString(),
                                            //   widget.professionData.firstName
                                            //       .toString(),
                                            //   onCallFinished:
                                            //       onSendCallInvitationFinished,
                                            // ),
                                            SizedBox(
                                          height: Get.height * 0.013,
                                          child: Image.asset(
                                            'assets/images/icons/videocall.png',
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: Get.width * 0.035),
                                      Text(
                                        "Video",
                                        style: TextStyle(
                                            fontSize: Get.height * 0.023,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          vertical(25),
                          CustomButtonWidget(
                              imageonly: 'assets/images/icons/calender.png',
                              title: 'Schedule',
                              tap: () async {
                                if (userController.UserDataList!.freeCall ==
                                    0) {
                                  print('yes');
                                  PricingModel item = PricingModel(
                                      userId: widget.professionData.id,
                                      amount: '0',
                                      mins: 15);
                                  // print('Pricing Model Data');
                                  // print(item.toString());
                                  // String jsonString = jsonEncode(item);
                                  // print(jsonString);
                                  await showDialog<DateTime>(
                                    context: context,
                                    builder: (context) => CalendarDialog(
                                      dataSet: item,
                                      professionUid: widget.professionData.id,
                                      professioName: widget
                                          .professionData.firstName
                                          .toString(),
                                    ),
                                  );
                                } else {
                                  checkShowDialog(context);
                                }
                              }),
                        ],
                      ),
                    ),
                    vertical(10),
                    // Image.asset(
                    //   'assets/images/pic/free15.png',
                    //   height: 100,
                    //   // width: 100,
                    //   fit: BoxFit.cover,
                    // ),
                  ],
                ),
              )),
          BottomSmallStyle(
              body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                vertical(Get.height * 0.16),
              ],
            ),
          )),
          const Align(
            alignment: Alignment.bottomLeft,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }

  void checkCallingShowDialog(
      BuildContext contex, String userCallID, String userCallingName) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Center(
                child: Container(
                  width: 160,
                  child: Text(
                    'Tap On Button Start The call',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                ),
              ),
              content: Container(
                width: double.minPositive,
                height: 200,
                child: Container(
                  height: 30,
                  width: 30,
                  margin: const EdgeInsets.all(70),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.pink,
                      border: Border.all(color: AppColors.white, width: 2)),
                  child: sendCallButton(userCallID, userCallingName,
                      onCallFinished: onSendCallInvitationFinished),
                ),
              ));
        });
  }

  Widget sendCallButton(String userCallID, String userCallingName,
      {void Function(String code, String message, List<String>)?
          onCallFinished}) {
    return ZegoSendCallInvitationButton(
      isVideoCall: true,
      invitees: [
        ZegoUIKitUser(
          id: userCallID,
          name: 'user_$userCallingName',
        )
      ],
      timeoutSeconds: 60,
      notificationMessage: 'Calling.........',
      notificationTitle: userCallingName,
      resourceID: 'love_love_call',
      icon: ButtonIcon(
        icon: Image.asset(
          'assets/images/icons/videocall.png',
          color: AppColors.white,
        ),
      ),
      iconSize: const Size(20, 20),
      buttonSize: const Size(20, 20),
      onPressed: onCallFinished,
    );
  }

  void onSendCallInvitationFinished(
    String code,
    String message,
    List<String> errorInvitees,
  ) {
    print('objectcall1');
    if (errorInvitees.isNotEmpty) {
      print('object2');
      var userIDs = '';
      for (var index = 0; index < errorInvitees.length; index++) {
        print('object3');
        if (index >= 5) {
          userIDs += '... ';
          break;
        }

        final userID = errorInvitees.elementAt(index);
        userIDs += '$userID ';
      }
      if (userIDs.isNotEmpty) {
        print('object4');
        userIDs = userIDs.substring(0, userIDs.length - 1);
      }

      var message = "User doesn't exist or is offline: $userIDs";
      if (code.isNotEmpty) {
        print('object5');
        message += ', code: $code, message:$message';
      }

      print('CallInvetaionnMessage $message');

      showInSnackBar(message, color: Colors.green);
      // showToast(
      //   message,
      //   position: StyledToastPosition.top,
      //   context: context,
      // );
    } else if (code.isNotEmpty) {
      print('CodeMessage  $code $message');
      showInSnackBar('This User is currently offline.', color: Colors.red);
      // showToast(
      //   'code: $code, message:$message',
      //   position: StyledToastPosition.top,
      //   context: context,
      // );
    }
  }

  void checkShowDialog(BuildContext contex) {
    // double selectAmount = 0.0;
    // List<double> amountlist = [100, 250, 500, 1000, 1250, 1500];

    // int selectedAmountIndex = -1;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ProffessionalPlanDialog(
              proffName: widget.professionData.firstName.toString(),
              proffID: widget.professionData.id.toString());

          // AlertDialog(
          //   title: Center(
          //     child: Container(
          //       width: 160,
          //       child: Text(
          //         'Choose Your Plan',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             fontSize: 30,
          //             fontWeight: FontWeight.w700,
          //             color: Colors.black),
          //       ),
          //     ),
          //   ),
          //   content: Obx(() => proffController.isLoadingPlan.value
          //       ? Center(
          //           child: CircularProgressIndicator(
          //             color: AppColors.pink,
          //           ),
          //         )
          //       : proffController.professionPlanData.isEmpty
          //           ? Center(
          //               child: Text('List is Empty'),
          //             )
          //           : Container(
          //               width: double.maxFinite,
          //               height: 400,
          //               child: GridView.builder(
          //                 gridDelegate:
          //                     SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2,
          //                   childAspectRatio: 1.0,
          //                 ),
          //                 itemCount: proffController.professionPlanData.length,
          //                 itemBuilder: (context, index) {
          //                   PricingModel item =
          //                       proffController.professionPlanData[index];
          //                   return GestureDetector(
          //                     onTap: () {
          //                       print(
          //                           'Selected Amount: ${proffController.professionPlanData[index]}');
          //                       setState(() {
          //                         selectedAmountIndex = index;
          //                         // selectAmount = double.parse(item.amount);
          //                       });
          //                     },
          //                     child: Stack(
          //                       children: [
          //                         Container(
          //                           margin: EdgeInsets.all(8),
          //                           // padding:
          //                           //     EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //                           decoration: BoxDecoration(
          //                             color: AppColors.white,
          //                             border: Border.all(
          //                               color: selectedAmountIndex == index
          //                                   ? AppColors.pink
          //                                   : Colors.grey.withOpacity(0.5),
          //                             ),
          //                             borderRadius: BorderRadius.circular(20),
          //                           ),
          //                           child: Stack(
          //                             children: [
          //                               selectedAmountIndex == index
          //                                   ? Align(
          //                                       alignment: Alignment.topRight,
          //                                       child: Container(
          //                                         width: 40,
          //                                         height: 40,
          //                                         decoration: BoxDecoration(
          //                                           borderRadius:
          //                                               BorderRadius.only(
          //                                                   topRight: Radius
          //                                                       .circular(20),
          //                                                   bottomLeft:
          //                                                       Radius.circular(
          //                                                           20)),
          //                                           color: AppColors.pink,
          //                                         ),
          //                                         child: Icon(
          //                                           Icons.check,
          //                                           color: AppColors.white,
          //                                         ),
          //                                       ),
          //                                     )
          //                                   : SizedBox(),
          //                               Center(
          //                                 child: Column(
          //                                   crossAxisAlignment:
          //                                       CrossAxisAlignment.center,
          //                                   mainAxisAlignment:
          //                                       MainAxisAlignment.center,
          //                                   children: [
          //                                     Text(
          //                                       '\$ ${item.amount}',
          //                                       style: TextStyle(
          //                                         fontSize: 25,
          //                                         fontWeight: FontWeight.bold,
          //                                         color: AppColors.black,
          //                                       ),
          //                                     ),
          //                                     SizedBox(height: 10),
          //                                     Text(
          //                                       '${item.mins} Minutes',
          //                                       style: TextStyle(
          //                                         fontSize: 18,
          //                                         fontWeight: FontWeight.bold,
          //                                         color: AppColors.black,
          //                                       ),
          //                                     ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   );
          //                 },
          //               ),
          //             )),
          //   actions: <Widget>[
          //     Padding(
          //       padding: const EdgeInsets.symmetric(horizontal: 20),
          //       child: CustomButton(
          //         title: 'Confirm',
          //         tap: () {
          //           print(myprofileIncontroller.UserDataList!.walletBalance);
          //           if (myprofileIncontroller.UserDataList!.walletBalance !=
          //                   '0' ||
          //               myprofileIncontroller.UserDataList!.walletBalance !=
          //                   null) {
          //             print('Succfully Payments');
          //           }
          //           print('able to Next');
          //           // if (nextCount == 5) {
          //           //   setState(() {
          //           //     nextCount = 0;
          //           //   });
          //           //   print('able to Next');
          //           //   Get.offAll(() => DiscoverMain());
          //           // } else {
          //           //   Get.back();
          //           // }
          //         },
          //       ),
          //     )
          //   ],
          // );
        });
  }
}
