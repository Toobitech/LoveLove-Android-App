// import 'package:LoveLove/models/authentication/view/signin.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../../helpers/colors.dart';
// import '../db/databse_helper.dart';
// import '../locator.dart';
// import '../services/camera.service.dart';
// import '../services/ml_service.dart';
// import '../userlock.model.dart';
// import 'app_button.dart';

// class AuthActionButton extends StatefulWidget {
//   AuthActionButton(
//       {Key? key,
//       required this.onPressed,
//       required this.isLogin,
//       required this.reload});
//   final Function onPressed;
//   final bool isLogin;

//   final Function reload;
//   @override
//   _AuthActionButtonState createState() => _AuthActionButtonState();
// }

// class _AuthActionButtonState extends State<AuthActionButton> {
//   final MLService _mlService = locator<MLService>();
//   final CameraService _cameraService = locator<CameraService>();

//   UserLockModel? predictedUser;

//   Future _signUp(
//     context,
//   ) async {
//     DatabaseHelper _databaseHelper = DatabaseHelper.instance;
//     List predictedData = _mlService.predictedData;

//     UserLockModel userToSave = UserLockModel(
//       user: 'user',
//       modelData: predictedData,
//     );
//     print(userToSave.modelData);
//     print(predictedData);
//     await _databaseHelper.insert(userToSave);
//     this._mlService.setPredictedData([]);

//     Get.to(SigninScreen());
//     // Navigator.push(
//     //     context,
//     //     MaterialPageRoute(
//     //         builder: (BuildContext context) => LoginScreen(

//     //             )));
//   }

//   // Future _signIn(context) async {
//   //   Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //           builder: (BuildContext context) => EditProfileForm(
//   //                 userData: widget.userData,
//   //               )));
//   // }

//   Future<UserLockModel?> _predictUser() async {
//     UserLockModel? userAndPass = await _mlService.predict();
//     return userAndPass;
//   }

//   Future onTap() async {
//     try {
//       bool faceDetected = await widget.onPressed();
//       if (faceDetected) {
//         if (widget.isLogin) {
//           var user = await _predictUser();
//           if (user != null) {
//             this.predictedUser = user;
//           }
//         }
//         print('Register Successfully');
//         _signUp(
//           context,
//         );
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppColors.lightpink,
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: AppColors.pink.withOpacity(0.1),
//               blurRadius: 1,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
//         width: MediaQuery.of(context).size.width * 0.8,
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'CAPTURE',
//               style: TextStyle(color: Colors.black),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Icon(Icons.camera_alt, color: Colors.black)
//           ],
//         ),
//       ),
//     );
//   }

//   signSheet(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           widget.isLogin && predictedUser != null
//               ? Container(
//                   child: Text(
//                     'Welcome back, ' + predictedUser!.user + '.',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 )
//               : widget.isLogin
//                   ? Container(
//                       child: Text(
//                       'User not found 😞',
//                       style: TextStyle(fontSize: 20),
//                     ))
//                   : Container(),
//           Container(
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 widget.isLogin && predictedUser != null
//                     ? AppButton(
//                         text: 'Welcome',
//                         onPressed: () async {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (BuildContext context) =>
//                                       SigninScreen()));
//                         },
//                         icon: Icon(
//                           Icons.login,
//                           color: Colors.white,
//                         ),
//                       )
//                     : Container()
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
