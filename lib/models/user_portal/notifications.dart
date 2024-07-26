import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/bottomsmallStyle.dart';
import 'package:LoveLove/helpers/colors.dart';

import '../../components/custom_backbutton.dart';
import '../../helpers/const_text.dart';
import '../../helpers/spacer.dart';
import '../authentication/widgets/card_widget.dart';
import 'NotificationController.dart';

class notifications extends StatefulWidget {
  const notifications({super.key});

  @override
  State<notifications> createState() => _notificationsState();
}

class _notificationsState extends State<notifications> {
  final notifycontroller = Get.find<NotificationController>();
  @override
  Widget build(BuildContext context) {
    return GetX<NotificationController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: CustomBackButton(),
        ),
        body: BottomSmallStyle(
          topHeight: 0.23,
          body: notifycontroller.isLoading.value == true
              ? SizedBox(
                  height: Get.height * 0.7,
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 40,
                          width: 40,
                          child: CircularProgressIndicator(
                            color: AppColors.pink,
                          )),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(
                    top: 70,
                  ),
                  child: Column(
                    children: [
                      vertical(100),

                      Center(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.063,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      vertical(10),
                      SizedBox(
                        height: Get.height * 0.67,
                        child: notifycontroller.NotifyList.isEmpty
                            ? Center(
                                child: boldtext(
                                    Colors.grey, 14, "No Data Available"))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: notifycontroller.NotifyList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CardWidget(
                                    child: ListTile(
                                      title: mediumtext(AppColors.white, 14,
                                          "${notifycontroller.NotifyList[index].description}"),
                                      trailing: mediumtext(AppColors.white, 10,
                                          "${notifycontroller.NotifyList[index].createdAt.toString().split('T').first}"),
                                    ),
                                  );
                                }),
                      )

                      // )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
