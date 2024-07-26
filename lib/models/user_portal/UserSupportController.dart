import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../components/apiurl.dart';
import '../../components/globalvariables.dart';
import '../../components/userSupportModel.dart';
import 'discover/controllers/ProfileViewController.dart';

class UserSupportController extends GetxController {
  AdminData? data;

  var isLoading = true.obs;

  SendQuery() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.usersupportURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        print(response.body);

        UserSupportModel data12 =
            UserSupportModel.fromJson(jsonDecode(response.body));
        data = data12.data!;
        Get.find<ProfileViewController>()
            .fetchFirebaseChat(data12.data!.id.toString());
        print(response.body);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
