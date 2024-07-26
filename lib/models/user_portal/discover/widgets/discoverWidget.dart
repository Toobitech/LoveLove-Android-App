import 'package:LoveLove/models/stack_cardsView/profilestack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import '../../professional/controller/profession_controller.dart';
import '../../profile/view/editProfileMain.dart';
import '../controllers/ProfileViewController.dart';
import '../view/discoverMain.dart';

class discoverWidget extends StatefulWidget {
  double? padding;
  bool? filter;
  discoverWidget({super.key, this.padding, this.filter});

  @override
  State<discoverWidget> createState() => _discoverWidgetState();
}

class _discoverWidgetState extends State<discoverWidget> {
  final proffController = Get.put(ProfessionController());
  final myprofileIncontroller = Get.find<MyProfileController>();
  final controller3 = Get.find<HeartSendController>();
  final ScrollController _controller = ScrollController();
  //---------------------------------------------------------------------------------------
  @override
  void initState() {
    super.initState();
    proffController.postChangeHealth('negative');
  }

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
              : ListView.builder(
                  padding: EdgeInsets.only(
                      top: 40,
                      left: widget.padding ?? 0,
                      right: widget.padding ?? 0),
                  itemCount: widget.filter == true
                      ? controller.filterdiscoverdata.length
                      : controller.discoverdata.length,
                  // physics: SlowScrollPhysics(),
                  controller: _controller,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return VisibilityDetector(
                      key: Key(index.toString()),
                      onVisibilityChanged: (VisibilityInfo info) {
                        if (appStorage.read(ACCOUNT_FOR) == 'null') {
                          if (index > 0 && index % 4 == 0) {
                            print(index);
                            showInSnackBar("Complete Your Profile Details",
                                duration: 5000, color: Colors.red, ontap: () {
                              Get.to(() => EditProfileMain());
                            });
                          }
                        }
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 260,
                            padding: const EdgeInsets.all(15),
                            margin: const EdgeInsets.only(top: 90),
                            width: Get.width,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
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
                                            : controller
                                                        .filterdiscoverdata[
                                                            index]
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
                                        : controller.discoverdata[index]
                                                    .gender ==
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
                          Center(
                              child: ProfileStack(
                                  images: widget.filter == true
                                      ? controller.filterdiscoverdata[index]
                                              .images ??
                                          []
                                      : controller.discoverdata[index].images ??
                                          [],
                                  isFemale: widget.filter == true
                                      ? controller.filterdiscoverdata[index]
                                              .gender ==
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
                                      if (appStorage.read(ACCOUNT_FOR) ==
                                              null ||
                                          appStorage.read(ACCOUNT_FOR) ==
                                              'null') {
                                        showInSnackBar(
                                            "Please complete Your Profile First",
                                            color: Colors.red);
                                      } else {
                                        if (controller
                                                .discoverdata[index].isFriend ==
                                            true) {
                                          Get.to(() => AnimationScreen(
                                                image:
                                                    '${AppUrl.impath}/${controller.discoverdata[index].profile!}',
                                                userId: widget.filter == true
                                                    ? controller
                                                        .filterdiscoverdata[
                                                            index]
                                                        .id
                                                    : controller
                                                        .discoverdata[index].id,
                                                userName: widget.filter == true
                                                    ? controller
                                                        .filterdiscoverdata[
                                                            index]
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
                                            controller3.heartsend(widget
                                                        .filter ==
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
                      ),
                    );
                  },
                );
    });
  }
}

Widget containerCard(String text, Color color, {double? fsize}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(
          width: 1,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(30)),
    child: Text(
      text,
      style: TextStyle(fontSize: fsize ?? 10, color: Colors.black),
      overflow: TextOverflow.ellipsis,
    ), //lighttext(AppColors.blackShade, fsize ?? 10, )
  );
}

class IntrestDiscover extends StatefulWidget {
  IntrestDiscover({super.key});

  @override
  State<IntrestDiscover> createState() => _IntrestDiscoverState();
}

@override
class _IntrestDiscoverState extends State<IntrestDiscover> {
  var interestIncontroller = Get.find<InterestController>();
  final myprofileIncontroller = Get.find<MyProfileController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    selected = myprofileIncontroller.UserDataList != null
        ? myprofileIncontroller.UserDataList!.userIntrest != null
            ? myprofileIncontroller.UserDataList!.userIntrest!
                .map((e) => e.intrest != null
                    ? e.intrest!.name != null
                        ? e.intrest!.name.toString()
                        : 'user'
                    : 'user')
                .toList()
            : []
        : [];
  }

  List<String> data = [
    "Movie",
    "Photography",
    "Design",
    "Reading Book",
    "Singing",
    "Music"
  ];
  List<String> selected = [];
  List<String> selectedID = [];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: interestIncontroller.InterestList.map((i) => InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              if (selected.contains(i.name)) {
                selected.remove(i.name);
              } else {
                selected.add(i.name);
              }
              if (selectedID.contains(i.id.toString())) {
                selectedID.remove(i.id.toString());
              } else {
                selectedID.add(i.id.toString());
              }
              setState(() {});

              interestIncontroller.addListValues(selectedID);
              print(selectedID);
              setState(() {});
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: selected.contains(i.name)
                        ? AppColors.pink
                        : const Color(0xffD2D2D2),
                    borderRadius: BorderRadius.circular(15)),
                child: selected.contains(i.name)
                    ? mediumtext(AppColors.white, 10, "${i.name}")
                    : mediumtext(AppColors.blackShade, 10, "${i.name}")),
          )).toList(),
    );
  }
}

class CustomScrollPhysics extends ScrollPhysics {
  // Adjust the drag coefficient to control the scroll speed.
  final double dragStartDistance = 0.1;

  const CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Adjust the drag coefficient to control the scroll speed.
    final dragOffset = offset / dragStartDistance;
    return super.applyPhysicsToUserOffset(position, dragOffset);
  }
}
