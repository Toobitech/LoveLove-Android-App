import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../components/NotificationModel.dart';
import '../../components/apiurl.dart';
import '../../components/globalvariables.dart';

class NotificationController extends GetxController {
  List<NotifyData> NotifyList = [];

  var isLoading = true.obs;

  fetchNotificationData() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.notificationsURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        NotificationModel data12 =
            NotificationModel.fromJson(jsonDecode(response.body));
        NotifyList = data12.data!;
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
