import 'dart:convert';
import 'package:LoveLove/models/authentication/view/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:LoveLove/components/apiurl.dart';
import '../../../global/alertboxes.dart';
import '../../../global/snackbar.dart';

class SignUpController extends GetxController {
  sendpost(
    String full_name,
    String email,
    String age,
    String pass,
    String account_for,
  ) async {
    showLoadingDialog();
    try {
      var response = await http.post(Uri.parse(AppUrl.signupURL), body: {
        'first_name': full_name,
        'email': email,
        'password': pass,
        'age': age,
        'account_for_id': account_for.toString(),
      });
      if (response.statusCode == 200) {
        hideLoadingDialog();
        print(response.body);
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data["success"] == true) {
          showInSnackBar(
            data["message"],
          );
          Get.offAll(() => WelcomeScreen());
        } else {
          showInSnackBar(data["message"], color: Colors.red);
        }
      } else {
        hideLoadingDialog();
        showInSnackBar("Invalid Data ${response.statusCode}",
            color: Colors.red);
      }
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
