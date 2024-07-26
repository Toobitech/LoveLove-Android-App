import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/components/apiurl.dart';

import '../../../../components/globalvariables.dart';

class DiscoverController extends GetxController {
  List<UserData> discoverdata = [];
  List<UserData> filterdiscoverdata = [];
  var isLoading = false.obs;

  fetchDiscoverData({List<UserData>? filter}) async {
    print('inside $userToken');
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.discoverURL),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('objectDiscoverApiHitting');
      print(response.statusCode);
      // print(response.body);
      // log(response.body);
      if (response.statusCode == 200) {
        DiscoverModel data123 =
            DiscoverModel.fromJson(jsonDecode(response.body));
        discoverdata = data123.data!;
        if (filter != null) {
          filterdiscoverdata = filter;
        } else {
          filterdiscoverdata = data123.data!;
        }
        // List<Images>? ;
        isLoading.value = false;
        print(
            "00000000000000000000000000000000000000000000000000000000000000000000000");
        print(response.body);
        print('  ${discoverdata[0].id}');
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      print('discover error');
    }
  }
}
