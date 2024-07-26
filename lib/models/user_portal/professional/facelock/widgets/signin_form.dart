// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../user_profile_screen.dart';
// import '../locator.dart';
// import '../services/camera.service.dart';
// import 'app_button.dart';

// class SignInSheet extends StatelessWidget {
//   SignInSheet({
//     Key? key,
//     required this.userName,
//   }) : super(key: key);
//   final String userName;
//   final _cameraService = locator<CameraService>();

//   Future _signIn(
//     context,
//   ) async {
//     Get.offAll(() => UserProfileScreen());

//     // if (user.password == _passwordController.text) {
//     //   Navigator.push(
//     //       context,
//     //       MaterialPageRoute(
//     //           builder: (BuildContext context) => Profile(
//     //                 user.user,
//     //                 imagePath: _cameraService.imagePath!,
//     //               )));
//     // } else {
//     //   showDialog(
//     //     context: context,
//     //     builder: (context) {
//     //       return AlertDialog(
//     //         content: Text('Wrong password!'),
//     //       );
//     //     },
//     //   );
//     // }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Container(
//             child: Text(
//               'Welcome back, ' + userName.toString() + '.',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 // AppTextField(
//                 //   controller: _passwordController,
//                 //   labelText: "Password",
//                 //   isPassword: true,
//                 // ),
//                 SizedBox(height: 10),
//                 Divider(),
//                 SizedBox(height: 10),
//                 AppButton(
//                   text: 'Open',
//                   onPressed: () async {
//                     _signIn(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_forward,
//                     color: Colors.black,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
