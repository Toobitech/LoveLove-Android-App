// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:LoveLove/components/globalvariables.dart';

import '../models/user_portal/discover/controllers/ProfileViewController.dart';

class firestoreData extends StatefulWidget {
  firestoreData({super.key});

  @override
  State<firestoreData> createState() => _firestoreDataState();
}

class _firestoreDataState extends State<firestoreData> {
  // CollectionReference users = FirebaseFirestore.instance.collection('chats');
  final firebaseIncontroller = Get.put(ProfileViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () async {}, child: Text('Add Data'))
          ],
        ),
      ),
    );
  }
}
