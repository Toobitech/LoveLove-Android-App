import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/components/custom_button.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/customAppBar.dart';
import '../../../../global/userdrawer.dart';
import '../NotificationController.dart';
import '../discover/controllers/DiscoverController.dart';
import '../discover/view/discoverMain.dart';
import '../profile/controller/invitelinkController.dart';
import '../profile/controller/profileDataController.dart';
import '../profile/view/editProfileMain.dart';
import 'audio_meditation.dart';
import 'location_screen_test.dart';
import 'profession_list_screen.dart';
import 'profession_screen.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final discoverIncontroller = Get.put(DiscoverController());
  int nextCount = 0;
  final myprofileIncontroller = Get.put(MyProfileController());

  final InvitelnkController = Get.put(InviteLinkController());
  final CardFormEditController cardFormEditController =
      CardFormEditController();

  final notifycontroller = Get.put(NotificationController());
  bool loading = false;
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    super.initState();
    myprofileIncontroller.fetchUserData();
    discoverIncontroller.fetchDiscoverData();
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
          myprofileIncontroller.fetchUserData();
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: AppColors.white,
          drawer: const userdrawer(
            professionalUser: true,
          ),
          appBar: CustomAppBar(
            searchbar: true,
          ),
          body: Stack(
            children: [
              Obx(() => myprofileIncontroller.isLoading.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.pink,
                      ),
                    )
                  : myprofileIncontroller.UserDataList!.email!.isEmpty
                      ? Center(
                          child: Text(
                          'No Data',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black),
                        ))
                      : Padding(
                          padding: EdgeInsets.fromLTRB(
                              25, Get.height * 0.22, 25, 20),
                          child: Column(
                            children: [
                              SizedBox(height: Get.height * 0.023),
                              Image.asset(
                                'assets/images/pic/lovelove.png',
                                height: Get.height * 0.2,
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding:
                                    const EdgeInsets.only(bottom: 25, top: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.gradientLight,
                                        AppColors.gradientDark
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 0,
                                        right: 15,
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => EditProfileMain());
                                          },
                                          child: Container(
                                              child: Image.asset(
                                                  'assets/images/pic/pan.png')),
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: Get.height * 0.125,
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      AppColors.gradientLight,
                                                  width: 2),
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    myprofileIncontroller
                                                            .UserDataList!
                                                            .profile!
                                                            .isNotEmpty
                                                        ? AppUrl.impath +
                                                            myprofileIncontroller
                                                                .UserDataList!
                                                                .profile
                                                                .toString()
                                                        : 'https://writestylesonline.com/wp-content/uploads/2018/11/Three-Statistics-That-Will-Make-You-Rethink-Your-Professional-Profile-Picture.jpg',
                                                  ),
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Text(
                                            myprofileIncontroller.UserDataList!
                                                    .firstName!.isNotEmpty
                                                ? myprofileIncontroller
                                                    .UserDataList!.firstName
                                                    .toString()
                                                : '',
                                            style: TextStyle(
                                                fontSize: Get.height * 0.022,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          child: Text(
                                            myprofileIncontroller.UserDataList!
                                                        .description !=
                                                    null
                                                ? myprofileIncontroller
                                                    .UserDataList!.description
                                                    .toString()
                                                : '',
                                            style: TextStyle(
                                                fontSize: Get.height * 0.018,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.normal),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                            softWrap: false,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  children: [
                                    CustomButton(
                                        title: 'Someone to Talk',
                                        tap: () {
                                          Get.to(ProfessionListScreen());
                                        }),
                                    CustomButton(
                                        title: '5 minute Meditation',
                                        tap: () {
                                          Get.to(LoveAudioScreen());

                                          // Get.to(ProfessionScreen(
                                          //   categoryName: 'Meditation Guide',
                                          //   professionID: '1',
                                          // ));
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ))),
              BottomSmallStyle(
                  body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    vertical(Get.height * 0.16),
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 40, right: 30),
                child: GestureDetector(
                  onTap: () async {
                    // checkShowDialog(context);
                    // nextCount++;
                    // print('nextCount  ${nextCount}');
                    _showAlertDialog(context);
                  },
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      'assets/images/pic/skip.png',
                      height: Get.height * 0.036,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          icon: Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.close, color: AppColors.pink)),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Did you know you get points on this app? but by bypassing this link to support your mental health those points aren’t available. LoveLove will put you at the top of our list for exposure based on your points",
              // 'Please note that bypassing meditation or consulting with a professional could impact your wellness points and mental well-being score. Taking these steps is essential for maintaining and improving your overall health metrics.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: Get.height * 0.015,
                  fontWeight: FontWeight.w600,
                  color: AppColors.pink),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  title: 'Confirm',
                  tap: () {
                    Get.to(() => DiscoverMain());
                    // if (nextCount >= 5) {
                    //   setState(() {
                    //     nextCount = 0;
                    //   });
                    //   print('able to Next');
                    //   Get.offAll(() => DiscoverMain());
                    // } else {
                    //   Get.back();
                    // }
                  }),
            )
          ],
        );
      },
    );
  }
}