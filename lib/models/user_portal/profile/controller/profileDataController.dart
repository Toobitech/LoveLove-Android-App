import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/global/alertboxes.dart';
import 'package:LoveLove/global/snackbar.dart';
import 'package:LoveLove/models/user_portal/profile/controller/relationController.dart';

import '../../../../components/InterestModel.dart';
import '../../../../components/MyProfileModel.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../components/medicalConditionModel.dart';
import '../widgets/upload_pic_profile.dart';
import '../widgets/verify_number.dart';

class ProfileController extends GetxController {
  final myprofileIncontroller = Get.find<MyProfileController>();
  dynamic sendProfileData(
    Map<String, dynamic> profiledata3,
  ) async {
    print('profiledata3 $profiledata3');
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.profileURL),
          headers: {
            'Authorization': "Bearer  $userToken ",
            'Accept': "application/json"
          },
          body: profiledata3);
      print('Status Code ${response.statusCode}');
      print('Profile Body Response  ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(response.body);
        print('$profiledata3');

        if (data["success"] == true) {
          hideLoadingDialog();
          if (appStorage.read(ACCOUNT_FOR) == '1' &&
              myprofileIncontroller.UserDataList?.phone == null) {
            print(myprofileIncontroller.UserDataList?.phone);
            Get.to(() => verify_number());
          } else {
            Get.to(() => UploadPicture());
          }
        } else {
          hideLoadingDialog();
          showInSnackBar(data['Message'], color: Colors.red);
        }
      }

      print(response.statusCode);
    } catch (e) {
      hideLoadingDialog();
      showInSnackBar('Server Issue', color: Colors.red);
      print(e.toString());
    }
  }
}

class MedicalConditionController extends GetxController {
  List<MedicalData1> MedicalConditionList1 = [];
  List<MedicalData2> MedicalConditionList2 = [];
  List<MedicalData1> sharableConditionList1 = [];
  List<MedicalData2> sharableConditionList2 = [];
  var isLoading = false.obs;
  var sharableIsLoading = false.obs;

  fetchMedicalCondition() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.medicalURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        MedicalConditionModel data1234 =
            MedicalConditionModel.fromJson(jsonDecode(response.body));
        MedicalConditionList1 = data1234.data1;
        MedicalConditionList2 = data1234.data2;
        // print(MedicalConditionList);

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  getSharableCondition() async {
    sharableIsLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.sharableCondition}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('sharableCondition Status Code ${response.statusCode}');
      // print('sharableCondition Response ${response.body}');
      // log(response.body);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response.body);

        // Extract the "data" field from the Map
        List<dynamic> dataList = jsonMap['data'];

        // Iterate over each item in the "data" list and create MedicalData1 instances
        for (var item in dataList) {
          sharableConditionList1.add(MedicalData1.fromJson(item));
        }

        for (var item in dataList) {
          sharableConditionList2.add(MedicalData2.fromJson(item));
        }
        // Print the formatted list
        // for (var medicalData in sharableConditionList2) {
        //   print('ID: ${medicalData.id}, Name: ${medicalData.name}');
        // }

        sharableIsLoading.value = false;
      }
    } catch (e) {
      sharableIsLoading.value = false;
      print('sharableCondition Error');
      print(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchUserId();
  }
}

class InterestController extends GetxController {
  List<InterestData> InterestList = [];
  List<String> selected = [];
  addListValues(List<String> value) {
    selected = value;
  }

  emptySelected() {
    selected = [];
  }

  var isLoading = false.obs;

  fetchInterestData() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.interestURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        print("intrest----------------------------------------------------");
        InterestModel data678 =
            InterestModel.fromJson(jsonDecode(response.body));
        InterestList = data678.data;

        // print(MedicalConditionList);

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchUserId();
  }
}

class MyProfileController extends GetxController {
  UserData? UserDataList;

  var isLoading = false.obs;

  fetchUserData() async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse('${AppUrl.myprofileURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('User APi Response ${response.body}');
      if (response.statusCode == 200) {
        log(response.body);
        // print(response.body);
        MyProfileModel data98 =
            MyProfileModel.fromJson(jsonDecode(response.body));
        UserDataList = data98.data;

        print(UserDataList);
        // print(MedicalConditionList);

        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      print('error in my profile');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchUserId();
  }
}
