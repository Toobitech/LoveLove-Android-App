import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../components/HeartReceivedModel.dart';
import '../../../../components/HeartSentModel.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/snackbar.dart';

class HeartSendController extends GetxController {
  heartsend(String user_id, {bool? recomendation}) async {
    showLoadingDialog();
    print(user_id);
    try {
      var response = await http.post(
          Uri.parse(recomendation == true
              ? AppUrl.sendrecommendationURL
              : AppUrl.heartsendURL),
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
          showInSnackBar(
              recomendation == true ? "Recommendation Sent" : "Heart Sent",
              color: Colors.green);
        } else {
          showInSnackBar(data["message"], color: Colors.red);
        }
      }
    } catch (e) {
      print('errorr  $e');
    }
  }
}

class HeartSentController extends GetxController {
  List<HeartSentData> HeartSentList = [];

  var isLoading = true.obs;

  fetchHeartSentData(String heartList) async {
    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(heartList == 'Recommendations'
            ? AppUrl.recommendationsURL
            : heartList == 'Heart Sent'
                ? '${AppUrl.heartsentURL}'
                : '${AppUrl.heartreceivedURL}'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        HeartSentModel data12 =
            HeartSentModel.fromJson(jsonDecode(response.body));
        HeartSentList = data12.data!;
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

// class HeartRecievedController extends GetxController {
//   List<HeartReceivedData> HeartReceivedList = [];

//   var isLoading = true.obs;

//   fetchHeartReceivedData() async {
//     isLoading.value = true;

//     try {
//       final response = await http.get(
//         Uri.parse('${AppUrl.heartsentURL}'),
//         headers: {
//           'Authorization': "Bearer  $userToken ",
//           'Accept': "application/json"
//         },
//       );
//       if (response.statusCode == 200) {
//         print(response.body);
//         HeartReceivedModel data23 =
//             HeartReceivedModel.fromJson(jsonDecode(response.body));
//         HeartReceivedList = data23.data!;
//         print(response.body);
//         isLoading.value = false;
//       }
//     } catch (e) {
//       isLoading.value = false;
//       print(e.toString());
//     }
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }
// }
