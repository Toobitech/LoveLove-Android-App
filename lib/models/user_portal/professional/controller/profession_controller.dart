import 'dart:convert';
import 'dart:developer';
import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/models/user_portal/professional/model/call_logs_model.dart';
import 'package:LoveLove/models/user_portal/professional/model/datetime_model.dart';
import 'package:LoveLove/models/user_portal/professional/model/pricing_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../components/apiurl.dart';
import '../../../../components/globalvariables.dart';
import '../../../../global/alertboxes.dart';
import '../../../../global/snackbar.dart';
import '../model/profession_catetory_model.dart';

class ProfessionController extends GetxController {
  RxInt callTimeDuration = 2.obs;
  RxBool isLoading = false.obs;
  RxBool callisLoading = false.obs;
  RxBool isLoadingprofession = false.obs;
  RxBool isloadingCall = false.obs;
  RxBool isLoadingPlan = false.obs;
  RxInt selectedsdateIndex = 0.obs;
  RxBool clsisLoading = false.obs;
  RxBool topIsLoading = false.obs;
  Rx<TimeOfDay> endtime = TimeOfDay.now().obs;
  Rx<TimeOfDay> starttime = TimeOfDay.now().obs;
  RxList<DateTime> selectedDates = <DateTime>[].obs;
  RxList<Dates> getDatesList = <Dates>[].obs;
  RxList<Dates> selectedUserDates = <Dates>[].obs;
  List<ProfessionModel> professionList = <ProfessionModel>[];

  List<CallLogsModel> getcallLogsList = <CallLogsModel>[];
  List<PricingModel> professionPlanData = <PricingModel>[];
  List<UserData> professionByIDList = <UserData>[];

  void selectDateSchedule(
    int index,
  ) {
    selectedsdateIndex.value = index;
  }

  postChangeHealth(
    String healthType,
  ) async {
    try {
      // showLoadingDialog();
      print(AppUrl.postCallReguest);
      final response = await http.post(
        Uri.parse(AppUrl.postChangeHealth),
        body: {
          'type': healthType,
        },
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Health Api Response Data ${response.body}');
      if (response.statusCode == 200) {
        // hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
      }
    } catch (e) {
      // hideLoadingDialog();
      // // clsisLoading.value = false;
      // showInSnackBar('Someting Wrong.....', color: Colors.red);
      print('Health Api Request error $e');
    }
  }

  getCallLogsData() async {
    callisLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.getCallLog),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Call Logs Response Data ${response.body}');
      if (response.statusCode == 200) {
        // Map<String, dynamic> data = response.body;
        DataCallLogsModel serverResponse =
            DataCallLogsModel.fromJson(jsonDecode(response.body));

        getcallLogsList = serverResponse.data!;

        callisLoading.value = false;
        print("Response Data ${getcallLogsList}");
      }
    } catch (e) {
      callisLoading.value = false;
      print(e.toString());
      print('Prfession APi error');
    }
  }

  postCreateCallLog(int proffessionID, int timeDuration, String callType,
      int remingTime, int bookingID) async {
    try {
      // clsisLoading.value = true;
      // showLoadingDialog();

      final response = await http.post(
        Uri.parse(AppUrl.postCreateCallLog),
        body: {
          'profession_id': proffessionID.toString(),
          'time_duration': timeDuration.toString(),
          'type': callType,
          'remaining_time': remingTime.toString(),
          'booking_id': bookingID.toString(),
        },
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Create Call Log Response Data ${response.body}');
      if (response.statusCode == 200) {
        // hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        print('object ${data}');
        // if (data['success'] == true) {
        //   print('object ');
        //   // return data;

        //   // hideLoadingDialog();
        // } else {
        //   // hideLoadingDialog();
        //   showInSnackBar("You have no Schedule to this Person",
        //       color: Colors.red);
        //   return data['success'];
        // }

        // Get.back();
        // Get.back();
        // print('${data['message']}');
        // clsisLoading.value = false;
      }
    } catch (e) {
      // hideLoadingDialog();
      // clsisLoading.value = false;
      // showInSnackBar('Someting Wrong.....', color: Colors.red);
      print('Create Call Log error $e');
    }
  }

  // postCallLogs(String proffessionID, String timeDuration, String callType,
  //     String remingTime) async {
  //   try {
  //     // clsisLoading.value = true;
  //     showLoadingDialog();
  //     print(AppUrl.postcallLogs);
  //     final response = await http.post(
  //       Uri.parse(AppUrl.postCallReguest),
  //       body: {
  //         'profession_id': proffessionID,
  //         'time_duration': timeDuration,
  //         'type': callType,
  //         'remaining_time': remingTime
  //       },
  //       headers: {
  //         'Authorization': "Bearer  $userToken ",
  //         'Accept': "application/json"
  //       },
  //     );
  //     print('Status Code ${response.statusCode}');
  //     print('Call Logs Response Data ${response.body}');
  //     if (response.statusCode == 200) {
  //       hideLoadingDialog();
  //       Map<String, dynamic> data = jsonDecode(response.body);
  //       return data;
  //       // if (data['success'] == true) {
  //       //   print('object TURE LOVE');
  //       //   return data;
  //       //   // hideLoadingDialog();
  //       // } else {
  //       //   // hideLoadingDialog();
  //       //   showInSnackBar("You have no Schedule to this Person",
  //       //       color: Colors.red);
  //       //   return data['success'];
  //       // }
  //       // Get.back();
  //       // Get.back();
  //       // print('${data['message']}');
  //       // clsisLoading.value = false;
  //     }
  //   } catch (e) {
  //     hideLoadingDialog();
  //     // clsisLoading.value = false;
  //     showInSnackBar('Someting Wrong.....', color: Colors.red);
  //     print('Calling Request error $e');
  //   }
  // }

  postCallingReguest(
      String proffessionID, String userCallID, String userCallingName) async {
    try {
      // clsisLoading.value = true;
      showLoadingDialog();
      print(AppUrl.postCallReguest);
      final response = await http.post(
        Uri.parse(AppUrl.postCallReguest),
        body: {
          'profession_id': proffessionID,
        },
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Calling Request Response Data ${response.body}');
      if (response.statusCode == 200) {
        hideLoadingDialog();
        Map<String, dynamic> data = jsonDecode(response.body);
        return data;
        // if (data['success'] == true) {
        //   print('object TURE LOVE');
        //   return data;

        //   // hideLoadingDialog();
        // } else {
        //   // hideLoadingDialog();
        //   showInSnackBar("You have no Schedule to this Person",
        //       color: Colors.red);
        //   return data['success'];
        // }

        // Get.back();
        // Get.back();
        // print('${data['message']}');
        // clsisLoading.value = false;
      }
    } catch (e) {
      hideLoadingDialog();
      // clsisLoading.value = false;
      showInSnackBar('Someting Wrong.....', color: Colors.red);
      print('Calling Request error $e');
    }
  }

  getProfessionaData() async {
    isLoading.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.getProfessions),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Profession Response Data ${response.body}');
      if (response.statusCode == 200) {
        ProfessionCategory serverResponse =
            ProfessionCategory.fromJson(jsonDecode(response.body));

        professionList = serverResponse.data!;

        isLoading.value = false;
        print("Response Data ${professionList}");
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
      print('Prfession APi error');
    }
  }

  getProfessionaPlanID(String proffID) async {
    isLoadingPlan.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.getProffessionPlan + proffID),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Profession Plan By ID Response ${response.body}');
      log('${response.body}');
      if (response.statusCode == 200) {
        PriceModel serverResponse =
            PriceModel.fromJson(jsonDecode(response.body));

        professionPlanData = serverResponse.data!;

        isLoadingPlan.value = false;
        print("Profession Plan ID Response Data ${professionByIDList}");
      }
    } catch (e) {
      isLoadingPlan.value = false;
      print('Prfession Plan APi error $e');
    }
  }

  getProfessionaDataByUserID(String userID) async {
    isLoadingprofession.value = true;
    try {
      final response = await http.get(
        Uri.parse(AppUrl.getProfessionById + userID),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Profession By ID Response ${response.body}');
      log('${response.body}');
      if (response.statusCode == 200) {
        DiscoverModel serverResponse =
            DiscoverModel.fromJson(jsonDecode(response.body));

        professionByIDList = serverResponse.data!;

        isLoadingprofession.value = false;
        print("Profession By ID Response Data ${professionByIDList}");
      }
    } catch (e) {
      isLoadingprofession.value = false;
      print('Prfession APi error $e');
    }
  }

  getProfessionaDates(String id, String date) async {
    try {
      clsisLoading.value = true;
      print(AppUrl.professionalUserSchedule + "?user_id=$id&date=$date");
      final response = await http.get(
        Uri.parse(AppUrl.professionalUserSchedule + '?user_id=$id&date=$date'),
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Get Calender By ID Response Data ${response.body}');
      if (response.statusCode == 200) {
        DateTimeModel serverResponse =
            DateTimeModel.fromJson(jsonDecode(response.body));

        getDatesList.value = serverResponse.data!;

        clsisLoading.value = false;

        print("Profession By Length ${getDatesList.length}");
        print("Profession By ID Response Data ${getDatesList}");
      }
    } catch (e) {
      clsisLoading.value = false;
      print('Get Calender Data APi error $e');
    }
  }

  postSelectSchedule(String bookAmount, String bookMins, String planId,
      String professioId, String dateId) async {
    try {
      clsisLoading.value = true;
      print(AppUrl.postAppointmentSchedule);
      final response = await http.post(
        Uri.parse(AppUrl.postAppointmentSchedule),
        body: {
          'amount': bookAmount,
          'mins': bookMins,
          'plan_id': planId,
          'profession_id': professioId,
          'availability_id': dateId
        },
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('Book Appointment By ID Response Data ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        showInSnackBar('${data['message']}', color: Colors.green);
        Get.back();
        Get.back();
        print('${data['message']}');
        clsisLoading.value = false;
      }
    } catch (e) {
      clsisLoading.value = false;
      showInSnackBar('Someting Wrong.....', color: Colors.red);
      print('Booked Appointment error $e');
    }
  }

  postTopUp(String transactionId, String amount) async {
    try {
      showLoadingDialog();
      final response = await http.post(
        Uri.parse(AppUrl.professionalTopUp),
        body: {'transaction_id': transactionId, 'amount': amount},
        headers: {
          'Authorization': "Bearer  $userToken ",
          'Accept': "application/json"
        },
      );
      print('Status Code ${response.statusCode}');
      print('TopUp Response Data ${response.body}');
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        if (data['success'] == true) {
          showInSnackBar('${data['message']}', color: Colors.green);
        } else {
          hideLoadingDialog();
          showInSnackBar('${data['message']}', color: Colors.red);
        }
        // hideLoadingDialog();
      }
    } catch (e) {
      hideLoadingDialog();
      // hideLoadingDialog();
      showInSnackBar('Someting Wrong.....', color: Colors.red);
      print('Booked Appointment error $e');
    }
  }
}
