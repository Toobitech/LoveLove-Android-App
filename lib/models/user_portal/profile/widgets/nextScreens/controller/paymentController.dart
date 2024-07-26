import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/models/user_portal/profile/widgets/nextScreens/payment_approved.dart';

import '../../../../../../components/apiurl.dart';
import '../../../../../../components/globalvariables.dart';
import '../../../../../../global/alertboxes.dart';
import '../../../../../../global/snackbar.dart';

class PaymentController extends GetxController {
  dynamic sendPaymentDetails(
    Map<String, dynamic> paymenttype3,
  ) async {
    showLoadingDialog();

    try {
      var response = await http.post(Uri.parse(AppUrl.paymentURL),
          headers: {
            'Authorization': "Bearer  $userToken ",
            'Accept': "application/json"
          },
          body: paymenttype3);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        print(response.body);
        print('$paymenttype3');

        if (data["success"] == true) {
          hideLoadingDialog();
          Get.to(() => PaymentApproved());
        } else {
          hideLoadingDialog();
          showInSnackBar(data['Message'], color: Colors.red);
        }
      }

      print(response.statusCode);
    } catch (e) {
      print(e.toString());
    }
  }
}
