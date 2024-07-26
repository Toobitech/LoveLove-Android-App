// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/alertboxes.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/user_portal/profile/controller/profileDataController.dart';
import 'package:LoveLove/models/user_portal/profile/view/userPrivacyPolicy.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/skipScreens/reference_link.dart';
import 'package:image_picker/image_picker.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/verify_number.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/waiting_approval.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../helpers/assets.dart';
import '../../../../helpers/colors.dart';
import '../../discover/controllers/ProfileViewController.dart';
import '../../discover/view/discoverMain.dart';
import '../controller/invitelinkController.dart';
import '../controller/relationController.dart';
import 'nextScreens/verify_pic.dart';
import 'package:http/http.dart' as http;

class UploadPicture extends StatefulWidget {
  const UploadPicture({super.key});

  @override
  State<UploadPicture> createState() => _UploadPictureState();
}

class _UploadPictureState extends State<UploadPicture> {
  var controller = Get.find<RelationController>();
  // var invitationcontroller = Get.put(InviteLinkController());
  final myprofileIncontroller = Get.find<MyProfileController>();
  bool checkBoxValue = false;
  File? imageFile;
  List images = [];
  String profileImg = '';
  var relation = Get.find<RelationController>();
  final profilecontroller = Get.put(ProfileViewController());

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   invitationcontroller.referencelink();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.to(() => verify_number());
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Get.offAll(() => DiscoverMain());
              },
              icon: Icon(
                Icons.home,
                color: AppColors.gradientLight,
              )),
        ),
        body: BottomSmallStyle(
          top: false,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: AppColors.black,
                    radius: 80,
                    child: Image.asset(
                      AppImages.camera,
                      height: 70,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                'Upload Picture',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              )),
              SizedBox(
                height: 5,
              ),
              Center(
                  child: Text(
                'Atleast One Picture',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )),
              Expanded(
                child: GridView.count(
                    // scrollDirection: Axis.vertical,

                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsets.only(top: 20, left: 110, right: 110),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 8,
                    crossAxisCount: 2,
                    children: [
                      if (myprofileIncontroller.UserDataList != null)
                        if (myprofileIncontroller.UserDataList!.images != null)
                          for (int k = 0;
                              k <
                                  myprofileIncontroller
                                      .UserDataList!.images!.length;
                              k++)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        "${AppUrl.impath}${myprofileIncontroller.UserDataList!.images![k].image}"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffD9D9D9)),
                            ),
                      for (int i = 0; i < images.length; i++)
                        Container(
                          child: Image.file(
                            images[i],
                            fit: BoxFit.cover,
                          ),
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffD9D9D9)),
                        ),
                      InkWell(
                        onTap: () {
                          _getFromGallery();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffD9D9D9)),
                          child: Icon(Icons.add),
                        ),
                      ),
                    ]
                    // List.generate(6, (index) {
                    //   return images.isEmpty
                    //       ? Container(
                    //           width: MediaQuery.of(context).size.width * 0.6,
                    //           height: 20,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15),
                    //               color: Color(0xffD9D9D9)),
                    //         )
                    //       : ;
                    // }),

                    // children: <Widget>[
                    //   Container(
                    //     child: Image.file(
                    //       imageFile,
                    //       fit: BoxFit.cover,

                    //     ),
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     height: 20,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Color(0xffD9D9D9)),
                    //   ),

                    //   Container(
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     height: 20,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Color(0xffD9D9D9)),
                    //   ),
                    //   Container(
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     height: 20,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Color(0xffD9D9D9)),
                    //   ),
                    //   Container(
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     height: 20,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(15),
                    //         color: Color(0xffD9D9D9)),
                    //   ),

                    // ],
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140, bottom: 40),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          checkBoxValue = !checkBoxValue;
                        });
                      },
                      child: Icon(
                        checkBoxValue
                            ? Icons.check_box
                            : Icons.check_box_outline_blank_rounded,
                        color: Colors.black,
                        size: 18,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => userPrivacyPolicy());
                        },
                        child: Text(
                          'Privacy Policy',
                          style: TextStyle(fontSize: 12),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          if (checkBoxValue == false) {
                            showInSnackBar("Please Select Privacy Policy ",
                                color: Colors.red);
                          }
                          //  else if (appStorage.read(ACCOUNT_FOR) == '1') {
                          //   Get.to(() => waiting_approval());
                          // }
                          else {
                            Get.to(() => waiting_approval(
                                  userType: myprofileIncontroller
                                      .UserDataList!.type
                                      .toString(),
                                ));
                            // Get.to(() => ReferenceLink(
                            //       link: invitationcontroller.link.toString(),
                            //     ));
                          }
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                    TextButton(
                        onPressed: () {
                          print("tapped");
                          if (images.isEmpty &&
                              myprofileIncontroller
                                  .UserDataList!.images!.isEmpty) {
                            showInSnackBar("Please Upload at least 1 Image",
                                color: Colors.red);
                          } else if (checkBoxValue == false) {
                            showInSnackBar("Please Select Privacy Policy ",
                                color: Colors.red);
                          } else {
                            if (images.isEmpty) {
                              Get.to(() => VerifyPic());
                            } else {
                              uploadImage(images);
                            }
                          }
                        },
                        child: Text('Next',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      print(pickedFile.path);
      if (images.contains(File(pickedFile.path))) {
      } else {
        images.add(File(pickedFile.path));
      }
      setState(() {});
    }
  }

  Future<void> uploadImage(List images) async {
    //show your own loading or progressing code here

    String uploadurl =
        "https://customdemowebsites.com/love_love/api/upload-images";
    showLoadingDialog();
    try {
      // List<int> imageBytes = imageFile!.readAsBytesSync();
      // String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(uploadurl));
      request.headers.addAll({
        'Authorization': "Bearer  $userToken ",
        'Accept': "application/json"
      });

      if (images.length > 0) {
        for (var i = 0; i < images.length; i++) {
          request.files.add(http.MultipartFile(
              'images[]',
              File(images[i].path).readAsBytes().asStream(),
              File(images[i].path).lengthSync(),
              filename: 'image$i'));
        }
        var response = await request.send();

        // listen for response
        print(response.statusCode);
        if (response.statusCode == 200) {
          hideLoadingDialog();
          if (appStorage.read(ACCOUNT_FOR) == '1') {
            Get.to(() => VerifyPic());
          } else {
            Get.to(() => waiting_approval(
                  userType: myprofileIncontroller.UserDataList!.type.toString(),
                ));
            // Get.to(() => ReferenceLink(
            //       link: invitationcontroller.link.toString(),
            //     ));
          }
        } else {
          hideLoadingDialog();
        }
        response.stream.transform(utf8.decoder).listen((value) {
          debugPrint(value);
        });
      }
      // var response = await http.post(uploadurl as Uri, body: {
      //   'image': baseimage,
      // });
      // if (response.statusCode == 200) {
      //   var jsondata = json.decode(response.body); //decode json data
      //   if (jsondata["error"]) {
      //     //check error sent from server
      //     print(jsondata["msg"]);
      //     //if error return from server, show message from server
      //   } else {
      //     print("Upload successful");
      //   }
      // } else {
      //   print("Error during connection to server");
      //   //there is error during connecting to server,
      //   //status code might be 404 = url not found
      // }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }
}
