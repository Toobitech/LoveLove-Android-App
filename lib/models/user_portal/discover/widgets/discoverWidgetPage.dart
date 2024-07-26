import 'package:LoveLove/models/stack_cardsView/profilestack.dart';
import 'package:LoveLove/models/user_portal/discover/widgets/discoverWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/user_portal/discover/controllers/DiscoverController.dart';
import 'package:LoveLove/models/user_portal/discover/widgets/profileview.dart';
import 'package:LoveLove/models/user_portal/profile/controller/profileDataController.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../helpers/assets.dart';
import '../../../../helpers/colors.dart';
import '../../../../helpers/const_text.dart';
import '../../../../helpers/spacer.dart';
import '../../heart_sent/controller/heart_sentController.dart';
import '../../heart_sent/widgets/AnimationScreen.dart';
import '../../profile/view/editProfileMain.dart';
import '../controllers/ProfileViewController.dart';

class DiscoverWidgetPage extends StatefulWidget {
  double? padding;
  bool? filter;
  DiscoverWidgetPage({super.key, this.padding, this.filter});

  @override
  State<DiscoverWidgetPage> createState() => _DiscoverWidgetPageState();
}

class _DiscoverWidgetPageState extends State<DiscoverWidgetPage> {
  final myprofileIncontroller = Get.find<MyProfileController>();
  final controller3 = Get.find<HeartSendController>();
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  //---------------------------------------------------------------------------------------
  final PageController _pageController = PageController(
    viewportFraction: 0.8, // Each item is fully visible in the viewport.
  );
  int currentPage = 0;

  // @override
  // void initState() {
  //   super.initState();

  //   // Scroll to the first item when the widget is initialized.
  //   WidgetsBinding.instance?.addPostFrameCallback((_) {
  //     // scrollToNextItem();
  //   });

  //   // Add a listener to automatically scroll to the next item when the user manually scrolls.
  //   // _controller.addListener(() {
  //   //   if (_controller.position.userScrollDirection == ScrollDirection.forward) {
  //   //     print("Forward------");
  //   //     // scrollToNextItem();
  //   //     scrollToPreviousItem();
  //   //   } else if (_controller.position.userScrollDirection ==
  //   //       ScrollDirection.reverse) {
  //   //     print("Reverse------");
  //   //     // scrollToPreviousItem();
  //   //     scrollToNextItem();
  //   //   }
  //   // });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  // void scrollToNextItem() {
  //   final currentPosition = _controller.position.pixels ??
  //       0; // Smaller offset for slower scrolling.
  //   final nextPosition =
  //       currentPosition + 260; // Adjust this value based on your item size.
  //   if (nextPosition <= _controller.position.maxScrollExtent) {
  //     _controller.animateTo(
  //       nextPosition,
  //       duration:
  //           Duration(milliseconds: 300), // Adjust animation speed as needed.
  //       curve: Curves.ease,
  //     );
  //   }
  // }

  // void scrollToPreviousItem() {
  //   final currentPosition = _controller.position.pixels ?? 0;
  //   final nextPosition =
  //       currentPosition - 260; // Adjust this value based on your item size.
  //   if (nextPosition <= _controller.position.maxScrollExtent) {
  //     _controller.animateTo(
  //       nextPosition,
  //       duration:
  //           Duration(milliseconds: 300), // Adjust animation speed as needed.
  //       curve: Curves.ease,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // final filterIncontroller = Get.find<FilterController>();
    return GetX<DiscoverController>(builder: (controller) {
      return controller.isLoading.value == true
          ? SizedBox(
              height: Get.height * 0.7,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(
                        color: AppColors.pink,
                      )),
                ],
              ),
            )
          : (widget.filter == true && controller.filterdiscoverdata.isEmpty) ||
                  (widget.filter != true && controller.discoverdata.isEmpty)
              ? Center(child: boldtext(Colors.grey, 14, "No User Found"))
              : Swiper(
                  itemWidth: Get.width,
                  itemHeight: 400.0,
                  loop: false,
                  layout: SwiperLayout.STACK,
                  scrollDirection: Axis.vertical,
                  // padding: EdgeInsets.only(
                  //     top: 40,
                  //     left: widget.padding ?? 0,
                  //     right: widget.padding ?? 0),
                  itemCount: widget.filter == true
                      ? controller.filterdiscoverdata.length
                      : controller.discoverdata.length,
                  // controller: _controller,
                  // physics: PageScrollPhysics(),
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        Container(
                          height: 260,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 90),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: GradientBoxBorder(
                                gradient: LinearGradient(
                                  begin: Alignment(-0.00, 1.00),
                                  end: Alignment(0, -1),
                                  colors: widget.filter == true
                                      ? controller.filterdiscoverdata[index]
                                                  .gender ==
                                              'male'
                                          ? [
                                              AppColors.malecolor,
                                              Color(0x001D3CA0),
                                              AppColors.malecolor
                                            ]
                                          : controller.filterdiscoverdata[index]
                                                      .gender ==
                                                  'female'
                                              ? [
                                                  Color(0xD8BD6792),
                                                  Color(0x00F593EB),
                                                  Color(0xFFE996BF)
                                                ]
                                              : [
                                                  Color(0xFFDF8BB6),
                                                  Color(0x001D3CA0),
                                                  Color(0xFF77A8D3)
                                                ]
                                      : controller.discoverdata[index].gender ==
                                              'male'
                                          ? [
                                              AppColors.malecolor,
                                              Color(0x001D3CA0),
                                              AppColors.malecolor
                                            ]
                                          : controller.discoverdata[index]
                                                      .gender ==
                                                  'female'
                                              ? [
                                                  Color(0xD8BD6792),
                                                  Color(0x00F593EB),
                                                  Color(0xFFE996BF)
                                                ]
                                              : [
                                                  Color(0xFFDF8BB6),
                                                  Color(0x001D3CA0),
                                                  Color(0xFF77A8D3)
                                                ],
                                ),
                                width: 7,
                              ),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              vertical(40),
                              containerCard(
                                  widget.filter == true
                                      ? "${controller.filterdiscoverdata[index].firstName}"
                                      : "${controller.discoverdata[index].firstName}",
                                  Colors.white,
                                  fsize: 22),
                              containerCard(
                                  widget.filter == true
                                      ? "${controller.filterdiscoverdata[index].about ?? "N/A"}"
                                      : "${controller.discoverdata[index].about ?? "N/A"}",
                                  Colors.white)
                            ],
                          ),
                        ),
                        Align(
                            alignment: Alignment.topCenter,
                            child: ProfileStack(
                                images: widget.filter == true
                                    ? controller
                                            .filterdiscoverdata[index].images ??
                                        []
                                    : controller.discoverdata[index].images ??
                                        [],
                                isFemale: widget.filter == true
                                    ? controller
                                            .filterdiscoverdata[index].gender ==
                                        'female'
                                    : controller.discoverdata[index].gender ==
                                        'female',
                                imageUrl: widget.filter == true
                                    ? "${controller.filterdiscoverdata[index].profile!}"
                                    : "${controller.discoverdata[index].profile!}")),
                        // Center(
                        //   child: CircleAvatar(
                        //       radius: 68,
                        //       backgroundColor: widget.filter == true
                        //           ? controller.filterdiscoverdata[index]
                        //                       .gender ==
                        //                   'female'
                        //               ? AppColors.femalecolor
                        //               : AppColors.malecolor
                        //           : controller.discoverdata[index].gender ==
                        //                   'female'
                        //               ? AppColors.femalecolor
                        //               : AppColors.malecolor,
                        //       child: CircleAvatar(
                        //         radius: 60,
                        //         backgroundImage: NetworkImage(widget.filter ==
                        //                 true
                        //             ? '${AppUrl.impath}/${controller.filterdiscoverdata[index].profile!}'
                        //             : '${AppUrl.impath}/${controller.discoverdata[index].profile!}'),
                        //       )),
                        // ),
                        Container(
                          height: 300,
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(top: 90),
                          width: Get.width,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // horizental(25),
                                InkWell(
                                  onTap: () {
                                    // print();
                                    var controller2 =
                                        Get.put(ProfileViewController());
                                    controller2.fetchUserId(widget.filter ==
                                            true
                                        ? "${controller.filterdiscoverdata[index].id}"
                                        : "${controller.discoverdata[index].id}");
                                    Get.to(() => ProfileView());
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                        AppImages.person_grey,
                                        height: 44,
                                      ),
                                    ),
                                  ),
                                ),
                                horizental(25),
                                InkWell(
                                  onTap: () {
                                    if (appStorage.read(ACCOUNT_FOR) == null ||
                                        appStorage.read(ACCOUNT_FOR) ==
                                            'null') {
                                      showInSnackBar(
                                          "Please complete Your Profile First",
                                          color: Colors.grey);
                                    } else {
                                      if (controller
                                              .discoverdata[index].isFriend ==
                                          true) {
                                        Get.to(() => AnimationScreen(
                                              image:
                                                  '${AppUrl.impath}/${controller.discoverdata[index].profile!}',
                                              userId: widget.filter == true
                                                  ? controller
                                                      .filterdiscoverdata[index]
                                                      .id
                                                  : controller
                                                      .discoverdata[index].id,
                                              userName: widget.filter == true
                                                  ? controller
                                                      .filterdiscoverdata[index]
                                                      .firstName
                                                      .toString()
                                                  : controller
                                                      .discoverdata[index]
                                                      .firstName
                                                      .toString(),
                                            ));
                                      } else {
                                        if (appStorage.read(ACCOUNT_FOR) !=
                                            "1") {
                                          controller3.heartsend(
                                              widget.filter == true
                                                  ? "${controller.filterdiscoverdata[index].id}"
                                                  : "${controller.discoverdata[index].id}",
                                              recomendation: true);
                                        } else {
                                          controller3.heartsend(widget.filter ==
                                                  true
                                              ? "${controller.filterdiscoverdata[index].id}"
                                              : "${controller.discoverdata[index].id}");
                                        }
                                      }
                                    }
                                  },
                                  child: CircleAvatar(
                                      radius: 25,
                                      backgroundColor: Colors.transparent,
                                      child: appStorage.read(ACCOUNT_FOR) != '1' &&
                                              appStorage.read(ACCOUNT_FOR) !=
                                                  'null'
                                          ? widget.filter == true
                                              ? controller
                                                          .filterdiscoverdata[
                                                              index]
                                                          .isRecomended ==
                                                      true
                                                  ? Image.asset(AppImages
                                                      .recommendations_red)
                                                  : Image.asset(AppImages
                                                      .recommendations_white)
                                              : controller.discoverdata[index]
                                                          .isRecomended ==
                                                      true
                                                  ? Image.asset(AppImages
                                                      .recommendations_red)
                                                  : Image.asset(AppImages
                                                      .recommendations_white)
                                          : widget.filter == true
                                              ? controller.filterdiscoverdata[index].isFriend == true
                                                  ? Image.asset(AppImages.heart_blue)
                                                  : Image.asset(AppImages.heart_grey)
                                              : controller.discoverdata[index].isFriend == true
                                                  ? Image.asset(AppImages.heart_blue)
                                                  : Image.asset(AppImages.heart_grey)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
    });
  }
}
