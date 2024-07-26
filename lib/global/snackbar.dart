// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

void showInSnackBar(String value,
    {Color? color, int? duration, VoidCallback? ontap}) {
  FocusManager.instance.primaryFocus?.unfocus();
  final SnackBar snackBar = SnackBar(
    margin: EdgeInsets.only(bottom: Get.height * 0.85, left: 30, right: 30),
    content: InkWell(
      onTap: ontap ?? () {},
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'caviarbold'),
      ),
    ),
    dismissDirection: DismissDirection.up,
    backgroundColor: color ?? Colors.green,
    behavior: SnackBarBehavior.floating,
    duration: Duration(milliseconds: duration ?? 1000),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
  );

  snackbarKey.currentState?.showSnackBar(snackBar);
}
