import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../helpers/assets.dart';
import '../../../../../helpers/colors.dart';

class PaymentApproved extends StatefulWidget {
  const PaymentApproved({super.key});

  @override
  State<PaymentApproved> createState() => _PaymentApprovedState();
}

class _PaymentApprovedState extends State<PaymentApproved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.to(() => DiscoverMain());
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            )),
        elevation: 0,
      ),
      body: BottomSmallStyle(
        top: false,
        body: Center(
          child: Column(
            children: [
              vertical(200),
              Image.asset(AppImages.successfully),
              vertical(30),
              Text(
                'Payment Approved',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              vertical(30),
            ],
          ),
        ),
      ),
    );
  }
}
