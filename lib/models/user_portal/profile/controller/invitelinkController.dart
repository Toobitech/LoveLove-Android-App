import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';

class InviteLinkController extends GetxController {
  var isLoading = false.obs;
  String? link;
  referencelink() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.inviteURL),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );

      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(link);
        link = data['data'];
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  //-----------------------------------------------bad word files-----------------------------
  List userIdFirebase = [];

  updateUserId(List data) {
    userIdFirebase = data;
    update();
  }

  sendSpamMsg(String msg) async {
    print(userIdFirebase);
    try {
      final response =
          await http.post(Uri.parse(AppUrl.disappearURL), headers: {
        'Authorization': "Bearer  $userToken ",
        'Accept': "application/json"
      }, body: {
        "sender_id": appStorage.read(USERID).toString(),
        "receiver_id": userIdFirebase[0] == appStorage.read(USERID)
            ? userIdFirebase[1].toString()
            : userIdFirebase[0].toString(),
        "message": msg
      });

      print(response.body);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(data);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
