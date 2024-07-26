import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/badword_model/badwords_model.dart';
import 'package:LoveLove/models/user_portal/profile/controller/invitelinkController.dart';

import '../../../../../components/globalvariables.dart';
import '../../../../../helpers/assets.dart';
import '../../controllers/ProfileViewController.dart';

class SendMsgBox extends StatelessWidget {
  String docId;
  int count;
  SendMsgBox({super.key, required this.docId, required this.count});
  TextEditingController messageController = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('chats');
  final controller = Get.put(ProfileViewController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 35,
      child: TextField(
        controller: messageController,
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          if (BadWords().isProfane(value)) {
            print("Bad Words Used");
          } else {
            print("No Bad Words are used");
          }
        },
        decoration: InputDecoration(
            hintText: "Message !",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
            suffixIcon: IconButton(
                onPressed: () async {
                  sendMessageFirebase(docId, messageController.text, count);
                },
                icon: Image.asset(AppImages.send_icon)),
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.only(top: 20, left: 20),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0),
              borderRadius: BorderRadius.circular(25),
            )),
      ),
    );
  }
}

sendMessageFirebase(String docid, String msg, var count) async {
  try {
    if (docid == "" || msg.isEmpty) {
    } else {
      if (BadWords().isProfane(msg)) {
        Get.find<InviteLinkController>().sendSpamMsg(msg);
      }
      await FirebaseFirestore.instance
          .collection('chats')
          .doc(docid)
          .collection('messages')
          .add({
        'count': count,
        'msg': BadWords().clean(msg),
        'img': appStorage.read(profileUrl).toString(),
        'time': DateTime.now().toUtc(),
        'id': appStorage.read(USERID)
      }).whenComplete(() => print('completed $docid'));
      await FirebaseFirestore.instance.collection('chats').doc(docid).update({
        "msg": BadWords().clean(msg),
        'time': DateTime.now().toUtc(),
        'img${appStorage.read(USERID)}': appStorage.read(profileUrl).toString(),
      });
    }
  } catch (e) {
    print(e.toString());
  }
}
