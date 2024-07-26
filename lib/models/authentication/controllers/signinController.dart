import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';
import '../../../components/apiurl.dart';
import '../../../components/globalvariables.dart';
import '../../../global/alertboxes.dart';
import '../../../global/snackbar.dart';
import '../../user_portal/discover/controllers/DiscoverController.dart';
import 'package:geolocator/geolocator.dart';
import '../../user_portal/professional/call/calling_service.dart';
import '../../user_portal/professional/user_profile_screen.dart';
import '../view/welcomescreen.dart';

class SignInController extends GetxController {
  final discoverIncontroller = Get.put(DiscoverController(), permanent: true);
  sendpost(
    String email,
    String pass,
  ) async {
    showLoadingDialog();
    // setState(() {
    //   loader = true;
    // });
    try {
      var response = await http.post(Uri.parse(AppUrl.loginURL),
          body: {'email': email, 'password': pass, 'lon': lon, 'lat': lat});

      if (response.statusCode == 200) {
        hideLoadingDialog();
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        print("data ${data['data']}");
        if (data["success"] == true) {
          appStorage.write('tokken', data['token']);
          appStorage.write('currentUserId', data["data"]["id"]);
          appStorage.write(USERID, data["data"]["id"]);
          appStorage.write(userName, data["data"]["first_name"]);
          appStorage.write(profileUrl, data["data"]["profile"]);
          appStorage.write(
            ACCOUNT_FOR,
            (data["data"]["account_for_id"]).toString(),
          );
          userId = data["data"]["id"].toString();
          userToken = data['token'];
          USERNAME = data["data"]["first_name"].toString();
          var userData = appStorage.read("currentUserId");
          print("SetUserId $userData");

          if (data["data"]["role_id"] == "user") {
            // onUserLogin(userId.toString(), USERNAME.toString(), 15);
            discoverIncontroller.fetchDiscoverData();
            Get.offAll(() => UserProfileScreen());
          }
        } else {
          showInSnackBar(data["message"], color: Colors.red);
        }
      } else {
        hideLoadingDialog();
        showInSnackBar("Invalid Data ${response.statusCode}",
            color: Colors.red);
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String lat = '';
  String lon = '';

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        getLocation();
      }
    } else {
      print("GPS Service is not enabled, turn on GPS location");
    }
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    lon = position.longitude.toString();
    lat = position.latitude.toString();

    // setState() ({
    //    //refresh UI
    // });

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );
  }

  deleteUserAccount(
      // int userID,
      ) async {
    showLoadingDialog();
    try {
      var response = await http.get(
        Uri.parse(AppUrl.deleteAccount),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');

      print('Delete Response Data ${response.body}');
      if (response.statusCode == 200) {
        print(response.body);
        // final responseData = response.body

        Map<String, dynamic> data = jsonDecode(response.body);
        ;
        if (data["success"] == true) {
          onUserLogout();
          appStorage.erase();
          showInSnackBar(data['message'], color: Colors.green);
          Get.to(() => WelcomeScreen());
        } else {
          hideLoadingDialog();
          showInSnackBar(data['message'], color: Colors.red);
        }
      }
    } catch (e) {
      print('Delete Account Errorr  $e');
    }
  }
}
