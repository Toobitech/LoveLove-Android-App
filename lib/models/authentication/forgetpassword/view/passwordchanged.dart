import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/authentication/view/signin.dart';

import '../../../../helpers/assets.dart';

class passwordchanged extends StatefulWidget {
  const passwordchanged({super.key});

  @override
  State<passwordchanged> createState() => _passwordchangedState();
}

class _passwordchangedState extends State<passwordchanged> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xffE895BF), Color(0xff872C5A)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(AppImages.icon_successfully),
                      const Text(
                        'Password',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Text(
                        'Changed',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => SigninScreen());
                          },
                          child: Text('Log In Now'))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
