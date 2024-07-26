// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:LoveLove/helpers/assets.dart';
// import 'package:LoveLove/helpers/button.dart';
// import 'package:LoveLove/helpers/colors.dart';
// import 'package:LoveLove/helpers/const_text.dart';
// import 'package:LoveLove/helpers/spacer.dart';
// import 'package:LoveLove/models/user_portal/messages/view/messages_main.dart';
// import 'package:LoveLove/models/user_portal/profile/view/editProfileMain.dart';

// import '../../../../global/bottomstyle.dart';
// import '../../discover/controllers/DiscoverController.dart';
// import '../../discover/view/discoverMain.dart';

// class RootUser extends StatelessWidget {
//   RootUser({super.key});
//   final discoverIncontroller = Get.put(DiscoverController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: BottomStyle(
//         body: Column(
//           children: [
//             vertical(Get.height * 0.15),
//             SizedBox(
//               height: Get.height * 0.3,
//               width: Get.width,
//               child: Image.asset(AppImages.root_img),
//             ),
//             vertical(Get.height * 0.1),
//             boldtext(AppColors.white, 25, "User"),
//             vertical(20),
//             buttonMain(0.65, "Discover", () {
//               discoverIncontroller.fetchDiscoverData();
//               Get.to(() => DiscoverMain());
//             }, bgColor: AppColors.white, tColor: AppColors.black),
//             vertical(20),
//             buttonMain(0.65, "Messages", () {
//               Get.to(() => MessagesMain());
//             }, bgColor: Colors.transparent, bColor: AppColors.white),
//             vertical(20),
//             buttonMain(0.65, "Edit Profile", () {
//               Get.to(() => EditProfileMain());
//             }, bgColor: Colors.transparent, bColor: AppColors.white),
//           ],
//         ),
//       ),
//     );
//   }
// }
