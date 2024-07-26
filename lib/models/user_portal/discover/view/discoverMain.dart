import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/controllers/DiscoverController.dart';
import 'package:LoveLove/models/user_portal/discover/filter_settings/controller/FilterController.dart';
import 'package:LoveLove/models/user_portal/profile/controller/invitelinkController.dart';

import '../../../../components/custom_backbutton.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/customAppBar.dart';
import '../../../../global/userdrawer.dart';
import '../../NotificationController.dart';
import '../../heart_sent/controller/heart_sentController.dart';
import '../../profile/controller/profileDataController.dart';
import '../filter_settings/view/filterssettings.dart';
import '../widgets/discoverWidget.dart';
import '../widgets/discoverWidgetPage.dart';

class DiscoverMain extends StatefulWidget {
  DiscoverMain({super.key});

  @override
  State<DiscoverMain> createState() => _DiscoverMainState();
}

class _DiscoverMainState extends State<DiscoverMain> {
  final filterIncontroller = Get.put(FilterController());
  final myprofileIncontroller = Get.put(MyProfileController());
  final medical = Get.put(MedicalConditionController());
  final controller3 = Get.put(HeartSendController());
  final controller6 = Get.put(InviteLinkController());
  final notifycontroller = Get.put(NotificationController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myprofileIncontroller.fetchUserData();
    medical.fetchMedicalCondition();
    medical.getSharableCondition();
    notifycontroller.fetchNotificationData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showExitPopup();
      },
      child: RefreshIndicator(
        onRefresh: () async {
          Get.find<DiscoverController>().fetchDiscoverData();
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.white,
          drawer: userdrawer(),
          appBar: CustomAppBar(),
          body: Stack(
            children: [
             Padding(
                padding:  EdgeInsets.fromLTRB(25, Get.height * 0.22, 25, 20),
                child: discoverWidget(),
              ),
              BottomSmallStyle(
                  body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    vertical(Get.height * 0.16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        boldtext(AppColors.white, 24, "Discover"),
                        IconButton(
                            onPressed: () {
                              Get.to(() => const FiltersSetting());
                            },
                            icon: Image.asset(
                              AppImages.filter,
                              color: AppColors.iconColor,
                              // colorBlendMode: BlendMode.modulate,
                              height: 28,
                            ))
                      ],
                    ),
                    vertical(Get.height * 0.72),
                    // Align(
                    //     alignment: Alignment.centerLeft,
                    //     child: CustomBackButton()),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class adjustablescrollcontroller extends ScrollController {
  adjustablescrollcontroller([int extrascrollspeed = 40]) {
    super.addListener(() {
      ScrollDirection scrolldirection = super.position.userScrollDirection;
      if (scrolldirection != ScrollDirection.idle) {
        double scrollend = super.offset +
            (scrolldirection == ScrollDirection.reverse
                ? extrascrollspeed
                : -extrascrollspeed);
        scrollend = min(super.position.maxScrollExtent,
            max(super.position.minScrollExtent, scrollend));
        jumpTo(scrollend);
      }
    });
  }
}