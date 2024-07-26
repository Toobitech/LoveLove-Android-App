import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/apiurl.dart';
import '../../../../components/RelationModel.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';

class RelationController extends GetxController {
  // List<Data> relationDataList = [];
  var isLoading = false.obs;
  var relationStatus = ''.obs;
  fetchrelationData() async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.relationURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(response.body);
        RelationModel data1 = RelationModel.fromJson(jsonDecode(response.body));
        relationDataList = data1.data;
        print(relationDataList);
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchUserId();
  }

  relationSelection(String relationstatus) {
    relationStatus.value = relationstatus;
    print(relationStatus.value);
  }
}
