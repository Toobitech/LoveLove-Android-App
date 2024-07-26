import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/global/alertboxes.dart';
import 'package:LoveLove/models/user_portal/discover/controllers/DiscoverController.dart';
import '../../../../../components/FilterModel.dart';
import '../../../../../components/apiurl.dart';
import '../../../../../components/globalvariables.dart';

class FilterController extends GetxController {
  List<UserData> userfilter = [];

  fetchFilterData(
    String data,
  ) async {
    showLoadingDialog();
    print('${AppUrl.filterURL}?$data');
    try {
      final response = await http.get(
        Uri.parse('${AppUrl.filterURL}?$data'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);
        FilterModel filterdata =
            FilterModel.fromJson(jsonDecode(response.body));
        userfilter = filterdata.data;
        Get.find<DiscoverController>().fetchDiscoverData(
            filter: filterdata.data == [] ? [] : filterdata.data);
      }
      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();

      print('error in filter $e');
    }
  }
}
