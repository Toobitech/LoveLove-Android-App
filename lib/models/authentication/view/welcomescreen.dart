// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/button.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/authentication/view/signin.dart';
import 'package:LoveLove/models/authentication/view/signupScreen.dart';
import '../../user_portal/professional/call/calling_service.dart';
import '../../user_portal/professional/controller/notification_service.dart';
import '../../user_portal/professional/facelock/locator.dart';
import '../../user_portal/professional/facelock/login_face_lock.dart';
import '../../user_portal/professional/facelock/register_face_lock.dart';
import '../../user_portal/professional/facelock/services/camera.service.dart';
import '../../user_portal/professional/facelock/services/face_detector_service.dart';
import '../../user_portal/professional/facelock/services/ml_service.dart';
import '../../user_portal/professional/user_profile_screen.dart';
import '../controllers/signinController.dart';
import '../widgets/socialLogin.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // MLService _mlService = locator<MLService>();
  // FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  // CameraService _cameraService = locator<CameraService>();

  bool loading = false;
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _initializeServices();
    getTokken();
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
  }

  // _initializeServices() async {
  //   setState(() => loading = true);
  //   print("object1");
  //   await _cameraService.initialize();
  //   print("object2");
  //   await _mlService.initialize();
  //   print("object3");
  //   _mlKitService.initialize();
  //   print("object4");
  //   setState(() => loading = false);
  //   print("object5");
  // }

  bool isLoading = false;
  getTokken() async {
    if (appStorage.read("tokken") != null) {
      // final discoverIncontroller = Get.put(DiscoverController());
      final signIncontroller = Get.put(SignInController());
      signIncontroller.checkGps();

      setState(() {
        isLoading = true;
        userToken = appStorage.read("tokken");
        var userCID = appStorage.read("currentUserId");
        print("SetUserId $userCID");

        USERNAME = appStorage.read(userName);
        // onUserLogin(userCID.toString(), USERNAME.toString(), 15);
      });
      print("USerTokenHain $userToken");
      // print(userCID);
      print(USERNAME);
      Future.delayed(Duration(seconds: 6), () {
        print('objectTOkkein123123');
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => loginFaceLock(
        //               userName: USERNAME.toString(),
        // )));
        Get.offAll(() => UserProfileScreen());
        // Get.offAll(() => DiscoverMain());

        // discoverIncontroller.fetchDiscoverData();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: !loading
            ? SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    vertical(70),
                    Image.asset(
                      AppImages.logo_Icon,
                      height: Get.height * 0.1,
                    ),
                    vertical(20),
                    Image.asset(
                      AppImages.loveGif,
                      height: Get.height * 0.5,
                      width: Get.width * 0.8,
                    ),
                    // boldtext(AppColors.black, 52, "Welcome"),
                    // lighttext(AppColors.black, 12, "You are Awesome!"),
                    const Spacer(),
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : buttonMain(0.65, "Login", () {
                            Get.to(() => SigninScreen());
                          }),
                    isLoading
                        ? SizedBox.shrink()
                        : accountLogin("Already have an account ?", "Sign up",
                            () {
                            Get.to(() => SignupScreen());
                          }),
                    vertical(25)
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: AppColors.pink,
                ),
              ));
  }
}
