import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/models/user_portal/heart_sent/controller/heart_sentController.dart';
import '../../../../components/DiscoverViewModel.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/snackbar.dart';
import '../../heart_sent/widgets/AnimationScreen.dart';

class ProfileViewController extends GetxController {
  List<IdData> userId = [];
  var isLoading = false.obs;
  RxString inviteLink = ''.obs;
  var linkisLoading = false.obs;
  var firebaseLoad = false.obs;
  var isChatAvailable = false.obs;
  var chatDocId = "".obs;
  get discoverdata => null;

  updateAvailable(String docId) {
    isChatAvailable.value = true;
    chatDocId.value = docId;
  }

// user_link=true
  getInviteLink(String user_link, bool val) async {
    try {
      linkisLoading.value = true;
      final response = await http.get(
        Uri.parse('${AppUrl.getInviteLink}?$user_link=$val'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Invite Link Reponse ${response.body}');
      if (response.statusCode == 200) {
        print(response.body);
        linkisLoading.value = false;
        Map<String, dynamic> data = jsonDecode(response.body);
        print(data['data']['url']);
        inviteLink.value = data['data']['url'];

        return data['data'];
        // DiscoverViewModel data1 =
        //     DiscoverViewModel.fromJson(jsonDecode(response.body));
        // userId = data1.data!;
      }
    } catch (e) {
      print('Invite Link Error $e');
      linkisLoading.value = false;
    }
  }

  fetchUserId(String userid) async {
    // print(userid);
    fetchFirebaseChat(userid);
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.discoverviewURL}$userid'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        DiscoverViewModel data1 =
            DiscoverViewModel.fromJson(jsonDecode(response.body));
        userId = data1.data!;
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  fetchFirebaseChat(String userid) async {
    firebaseLoad.value = true;
    List users = [int.parse(userid), appStorage.read(USERID)];
    users.sort();
    print(users);
    await FirebaseFirestore.instance
        .collection('chats')
        .where('userId', isEqualTo: users)
        .get()
        .then((value) => {
              if (value.docs.isNotEmpty)
                {
                  print('exists'),
                  value.docs
                      .map((e) => chatDocId.value = e.id.toString())
                      .toList(),
                  isChatAvailable.value = true,
                }
              else
                {
                  print('not Exist'),
                  isChatAvailable.value = false,
                }
            });

    firebaseLoad.value = false;
  }
  //----------------------------------------------------------------------------------------------------------------------------

  cancel(
    String user_id,
  ) async {
    showLoadingDialog();
    print(user_id);
    try {
      var response = await http.post(Uri.parse(AppUrl.cancelheartURL),
          headers: {
            'Authorization': "Bearer  $userToken ",
            'Accept': "application/json"
          },
          body: {
            'user_id': user_id
          });
      print(response.body);

      if (response.statusCode == 200) {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["success"] == true) {
          Get.find<HeartSentController>().fetchHeartSentData('Heart Recieved');
          showInSnackBar(data["message"], color: Colors.green);
          Get.back();
        } else {
          showInSnackBar(data["message"], color: Colors.red);
        }
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  accept(
    String user_id,
    String img,
    String username,
  ) async {
    showLoadingDialog();
    print(user_id);
    try {
      var response = await http.post(Uri.parse(AppUrl.acceptURL), headers: {
        'Authorization': "Bearer  $userToken ",
        'Accept': "application/json"
      }, body: {
        'user_id': user_id
      });
      print(response.body);

      if (response.statusCode == 200) {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["success"] == true) {
          showInSnackBar(data["message"], color: Colors.green);
          Get.to(() => AnimationScreen(
                image: "${AppUrl.impath}/$img",
                userId: int.parse(user_id),
                userName: username,
              ));
        } else {
          showInSnackBar(data["message"], color: Colors.red);
        }
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchUserId();
  }
}
