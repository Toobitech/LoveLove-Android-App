import 'package:LoveLove/models/user_portal/professional/controller/profession_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../../../../global/snackbar.dart';
import 'common.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final proController = Get.put(ProfessionController());
ZegoUIKitPrebuiltCallController? callController;
int? time;
int? remingTime;
void onUserLogin(String currentUserID, String currentUser, int timeEndDuration,
    int proffesionalID, int bookingID) {
  print('Calling Service Working_____++++______ServerConnected');
  print("NameUserLogin $currentUserID +++ $currentUser ++++ $timeEndDuration");
  callController ??= ZegoUIKitPrebuiltCallController();

  /// 4/5. initialized ZegoUIKitPrebuiltCallInvitationService when account is logged in or re-logged in
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: 320521940 /*input your AppID*/,
    appSign:
        'c0e1969df775800909acbe0e15d8379c96a23d5e87d852f9bfa504915db7f4b1' /*input your AppSign*/,
    userID: currentUserID,
    userName: currentUser,
    notifyWhenAppRunningInBackgroundOrQuit: true,
    plugins: [ZegoUIKitSignalingPlugin()],
    controller: callController,
    events: ZegoUIKitPrebuiltCallInvitationEvents(
      onInvitationUserStateChanged: (ZegoSignalingPluginInvitationUserInfo) {
        print('calling........1112');
      },
      onIncomingCallCanceled: (String callID, ZegoCallUser caller) {
        print('calling........11');
        print('Incoming call canceled by ${caller.name}');
        Get.back();
        showInSnackBar("Call canceled by ${caller.name}", color: Colors.red);
      },
      // onOutgoingCallTimeout: (String callID, List callees) {
      //   print('CallDeclined........._4');
      // },
      // onOutgoingCallTimeout: (callID, List callees,true),
      onOutgoingCallTimeout: (String callID, List callees, bool isVideoCall) {
        int secondscall = timeEndDuration * 60;
        print('calling........._232323TimeOut');
        print(
            'calling..........ReminingTimeSeconds${secondscall}BookingID${bookingID}ProffessionalID${proffesionalID}');
        proController.postCreateCallLog(
            proffesionalID, 0, 'dial', secondscall, bookingID);
      },
      onOutgoingCallCancelButtonPressed: () {
        print('calling........._1');
        Get.back();
        // proController.postCreateCallLog('0', proffesionalID.toString());
      },
      onOutgoingCallAccepted: (String callID, ZegoCallUser callee) {
        print('calling........._2');
// proController.postCreateCallLog(proffesionalID.toString(), timeDuration, callType, remingTime)
      },
      onOutgoingCallRejectedCauseBusy: (String callID, ZegoCallUser callee) {
        print('calling........._3');
      },
      onOutgoingCallDeclined: (String callID, ZegoCallUser callee) {
        print('CallDeclined........._4');
        print('calling........._4');
        proController.postCreateCallLog(
            proffesionalID, 0, 'missed', 0, bookingID);
      },
    ),
    requireConfig: (ZegoCallInvitationData data) {
      final config = data.type == ZegoCallType.videoCall
          ? ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          : ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();

      // Modify your custom configurations here.

      config.durationConfig.isVisible = true;
      config.durationConfig.onDurationUpdate = (Duration duration) {
        print('DurationVal11 ${duration}');
        // Extract components
        int hours = duration.inHours;
        int minutes = duration.inMinutes.remainder(60);
        int seconds = duration.inSeconds.remainder(60);
        int secondscall = timeEndDuration * 60;
        int remingSecond = secondscall - seconds;
        remingTime = remingSecond;
        print('DurationVal1 ${remingSecond}');
        print('DurationVal2 ${hours}');
        print('DurationVal3 ${minutes}');
        print('DurationVal4 ${seconds}');
        time = duration.inSeconds.remainder(60);
        // time = duration.inSeconds * 60;
        print('ControlllerCallDurationEnded ${timeEndDuration}');
        // if (timeEndDuration != null) {
        if (duration.inSeconds >= timeEndDuration * 60) {
          print('Calling Fuction Are Runinng');
          // Get.back();
          proController.postCreateCallLog(
              proffesionalID, timeEndDuration, 'receive', 0, bookingID);
          // proController.postCreateCallLog(
          //     timeEndDuration.toString(), proffesionalID.toString());
          callController!.hangUp(Get.overlayContext!);
          onUserLogout();
          Get.back();
          // Get.back();
          // callController!.hangUp(navigatorKey.currentState!.context);
        }
      };
      config.onHangUp = () {
        print('DurationValue................ ${time}');
        proController.postCreateCallLog(
            proffesionalID, time!, 'receive', remingTime!, bookingID);
        onUserLogout();
        Get.back();
        print('calling............21212');
      };
      // config.onHangUpConfirmation = setfoog();
      // config.onHangUpConfirmation = (c) {
      //   print('Call ended with reason: $reason');
      //   // Show Snackbar or perform other actions when the call is ended
      //   showInSnackBar("Call ended by the other user", color: Colors.green);
      //   // Optionally, you can navigate back or perform other actions
      //   Get.back();
      // };
      config.avatarBuilder = customAvatarBuilder;

      /// support minimizing, show minimizing button
      config.topMenuBarConfig.isVisible = true;
      config.topMenuBarConfig.buttons
          .insert(0, ZegoMenuBarButtonName.minimizingButton);

      return config;
    },
  );
}

setfoog() {
  print('Call ended with reason: ');
  // Show Snackbar or perform other actions when the call is ended
  showInSnackBar("Call ended by the other user", color: Colors.green);
  // Optionally, you can navigate back or perform other actions
  Get.back();
}

/// on user logout
void onUserLogout() {
  callController = null;

  /// 5/5. de-initialization ZegoUIKitPrebuiltCallInvitationService when account is logged out
  ZegoUIKitPrebuiltCallInvitationService().uninit();
  print('ZegoCLoud Is UnINITTTTTTTTTT');
}
