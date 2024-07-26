import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/user_portal/profile/controller/profileDataController.dart';
import 'apiurl.dart';

class AnimationCont extends GetxController with GetTickerProviderStateMixin {
  late AnimationController animationController;
  late AnimationController reverseController;
  var isLoading = true.obs;
  var isAnimation = true.obs;

  changeisAnimation(bool value) {
    isAnimation.value = value;
    print(isAnimation);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    reverseController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    startAnimation();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    animationController.dispose();
  }

  startAnimation() {
    isLoading.value = false;
    animationController.forward();
    reverseController.forward();
    print('indise Start');
  }
}

class AnimationWidget extends StatelessWidget {
  var image;
  AnimationWidget({super.key, required this.image});

  final myprofileIncontroller = Get.put(MyProfileController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width,
      width: Get.width,
      child: GetX<AnimationCont>(builder: (controller) {
        return controller.isLoading.value == true
            ? SizedBox()
            : Center(
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 2.0)
                      .animate(controller.animationController)
                    ..addListener(() {
                      controller.changeisAnimation(
                          controller.animationController.isAnimating);
                    }),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 20,
                        child: SizedBox(
                          width: Get.width * 0.55,
                          height: Get.width * 0.55,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              value: 100,
                            ),
                          ),
                        ),
                      ),
                      controller.isAnimation.value
                          ? SizedBox(
                              width: Get.width * 0.65,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: RotationTransition(
                                    turns: Tween(begin: 0.0, end: -2.0)
                                        .animate(controller.reverseController),
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Icon(
                                        Icons.favorite,
                                        size: 25,
                                        color: Color(0xffEA0073),
                                      ),
                                      backgroundColor: Colors.white,
                                    )),
                              ),
                            )
                          : SizedBox.shrink(),
                      SizedBox(
                          height: Get.width * 0.65,
                          width: Get.width * 0.65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: -2.0)
                                      .animate(controller.reverseController),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        "${AppUrl.impath}/${myprofileIncontroller.UserDataList!.profile}"),
                                  )),
                              SizedBox(
                                height: Get.width * 0.3,
                                width: Get.width * 0.3,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  value: 100,
                                ),
                              ),
                              RotationTransition(
                                  turns: Tween(begin: 0.0, end: -2.0)
                                      .animate(controller.reverseController),
                                  child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(image))),
                            ],
                          ))
                    ],
                  ),
                ),
              );
      }),
    );
  }
}

class AnimationWidget2 extends StatelessWidget {
  const AnimationWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width,
      width: Get.width,
      child: GetX<AnimationCont>(builder: (controller) {
        return controller.isLoading.value == true
            ? SizedBox()
            : RotationTransition(
                turns: Tween(begin: 1.3, end: -3.1)
                    .animate(controller.animationController),
                child: Center(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 15,
                        top: 15,
                        child: SizedBox(
                          height: Get.width * 0.82,
                          width: Get.width * 0.82,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              value: 100,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Get.width * 0.9,
                          width: Get.width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RotationTransition(
                                  turns: Tween(begin: 1.3, end: 3.1)
                                      .animate(controller.reverseController),
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Color(0xffEA0073),
                                    ),
                                    backgroundColor: Colors.white,
                                  )),
                              controller.isAnimation.value
                                  ? SizedBox.shrink()
                                  : RotationTransition(
                                      turns: Tween(begin: 1.3, end: 3.1)
                                          .animate(
                                              controller.reverseController),
                                      child: CircleAvatar(
                                        radius: 30,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Color(0xffEA0073),
                                          size: 35,
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                              RotationTransition(
                                  turns: Tween(begin: 1.3, end: 3.1)
                                      .animate(controller.reverseController),
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                    ),
                                    backgroundColor: Color(0xffEA0073),
                                  )),
                            ],
                          ))
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
