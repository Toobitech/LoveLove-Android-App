import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/models/user_portal/professional/controller/profession_controller.dart';
import 'package:LoveLove/models/user_portal/professional/model/call_logs_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../components/custom_backbutton.dart';
import '../../../global/bottomsmallStyle.dart';
import '../../../helpers/colors.dart';
import '../../../helpers/spacer.dart';

class CallLogsScreen extends StatefulWidget {
  const CallLogsScreen({super.key});

  @override
  State<CallLogsScreen> createState() => _CallLogsScreenState();
}

class _CallLogsScreenState extends State<CallLogsScreen> {
  final controller = Get.put(ProfessionController());
  @override
  void initState() {
    super.initState();
    controller.getCallLogsData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getCallLogsData();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        body: BottomSmallStyle(
          topHeight: 0.23,
          botom: false,
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButton(),
                ),
              ),
              vertical(70),
              Center(
                child: Text(
                  'Call Logs',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.063,
                      fontWeight: FontWeight.w900),
                ),
              ),
              vertical(10),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Align(
              //       alignment: Alignment.centerLeft,
              //       child: boldtext(AppColors.black, 23, 'Today')),
              // ),
              Obx(() => Expanded(
                    child: controller.callisLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.pink,
                            ),
                          )
                        : controller.getcallLogsList.isEmpty
                            ? Center(
                                child: Text('list is Empty...'),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ListView.builder(
                                    itemCount:
                                        controller.getcallLogsList.length,
                                    reverse: true,
                                    itemBuilder: (context, index) {
                                      CallLogsModel item =
                                          controller.getcallLogsList[index];

                                      // Format the date
                                      String formattedDate =
                                          formatDate(item.createdAt);

                                      print(
                                          'formattedDATeTIme ${formattedDate}'); // Output: Fri, 18 Dec, 2023

                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 80,
                                              width: 80,
                                              margin: const EdgeInsets.only(
                                                  right: 15),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 2),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      offset:
                                                          const Offset(0, 0),
                                                    ),
                                                  ],
                                                  image: DecorationImage(
                                                      image: NetworkImage(AppUrl
                                                              .imagePath +
                                                          item.professionUser
                                                              .profile),
                                                      fit: BoxFit.cover)),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    if (item.callType ==
                                                        'missed')
                                                      Image.asset(
                                                        'assets/images/icons/decliend_call.png',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    if (item.callType == 'dial')
                                                      Image.asset(
                                                        'assets/images/icons/dailing_call.png',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    if (item.callType ==
                                                        'receive')
                                                      Image.asset(
                                                        'assets/images/icons/accept_call.png',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    Text(
                                                      item.professionUser
                                                          .firstName,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20,
                                                          color:
                                                              AppColors.black),
                                                    )
                                                  ],
                                                ),
                                                vertical(5),
                                                if (item.callType == 'receive')
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'miss call ${item.timeDuration} minutes',
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        formattedDate,
                                                        style: TextStyle(
                                                          color: Colors.green,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (item.callType == 'missed')
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'miss call ${item.timeDuration} minutes',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        formattedDate,
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                if (item.callType == 'dial')
                                                  Row(
                                                    children: [
                                                      Text(
                                                        //  'dail ${item.timeDuration} mint'
                                                        'dial ${item.timeDuration}' +
                                                            ' / ' +
                                                            'remaining ${item.remainingTime} mins',
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Text(
                                                        formattedDate,
                                                        style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(DateTime dateTime) {
    final DateFormat formatter = DateFormat('E, d MMM, y');
    return formatter.format(dateTime);
  }
}
