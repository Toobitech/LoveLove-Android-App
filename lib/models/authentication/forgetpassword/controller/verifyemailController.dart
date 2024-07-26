import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/global/snackbar.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';
import '../view/passwordchanged.dart';
import '../view/verifycode.dart';

class VerifyEmailController extends GetxController {
  RxInt matchCode = 0.obs;
  var id = ''.obs;
  updateid(String value) {
    print('inside id chasnge $value');
    id.value = value;
  }

  verifyemailcode(String verifyemail) async {
    showLoadingDialog();

    try {
      var response =
          await http.post(Uri.parse(AppUrl.forgetpasswordURL), headers: {
        'Authorization': "Bearer  $userToken ",
        'Accept': "application/json"
      }, body: {
        'email': verifyemail,
      });

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["success"] == true) {
          updateid(data["id"].toString());
          // print(data["code"]);
          showInSnackBar(data['message'], color: Colors.green);
          matchCode.value = data["code"];
          hideLoadingDialog();
          Get.to(() => verifycode(
                matchcode: data["code"],
                email: verifyemail,
              ));
        } else {
          hideLoadingDialog();
          showInSnackBar(data['message'], color: Colors.red);
        }
      }
    } catch (e) {
      print('errorr  $e');
    }
  }

  verificationcode(
    // String newpass,
    String confirmpass,
  ) async {
    showLoadingDialog();

    try {
      var response =
          await http.post(Uri.parse(AppUrl.changepasswordURL), headers: {
        'Authorization': "Bearer  $userToken ",
        'Accept': "application/json"
      }, body: {
        'id': id.value,
        'password': confirmpass,
      });

      if (response.statusCode == 200) {
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data["success"] == true) {
          // Get.to(() => verifycode());

          Get.to(() => passwordchanged());
        } else {
          print("message");
        }
      }
    } catch (e) {
      print('errorr  $e');
    }
  }
}
