import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'components/ContentModel.dart';
import 'components/apiurl.dart';
import 'components/globalvariables.dart';
import 'global/alertboxes.dart';

class ContentController extends GetxController {
  ContentData? data;

  Future<void> fetchContentData() async {
    showLoadingDialog();

    try {
      final response = await http.get(
        Uri.parse('${AppUrl.contentURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );

      print(response.body);
      if (response.statusCode == 200) {
        print(response.body);

        ContentModel content = ContentModel.fromJson(jsonDecode(response.body));
        data = content.data;
      }
      hideLoadingDialog();
    } catch (e) {
      hideLoadingDialog();
      print(e.toString());
    }
  }
}
