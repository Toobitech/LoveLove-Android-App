import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/global/bottomsmallStyle.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/filter_settings/controller/FilterController.dart';
import 'package:LoveLove/models/user_portal/discover/widgets/discoverWidget.dart';

class SearchProfile extends StatefulWidget {
  const SearchProfile({super.key});

  @override
  State<SearchProfile> createState() => _SearchProfileState();
}

class _SearchProfileState extends State<SearchProfile> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(),
        //  IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_new_rounded,
        //       color: Colors.white,
        //     )),
        title: SizedBox(
          width: Get.width * 0.7,
          height: 40,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            controller: search,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
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
                suffixIcon: search.text.isNotEmpty
                    ? InkWell(
                        onTap: () {
                          Get.find<FilterController>()
                              .fetchFilterData("search=${search.text}");
                        },
                        child: Container(
                          width: 80,
                          height: 10,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          decoration: BoxDecoration(
                              color: AppColors.gradientDark,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: mediumtext(Colors.black, 12, "Search")),
                        ),
                      )
                    : const Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
                contentPadding: const EdgeInsets.only(top: 20, left: 20),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0),
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ),
        centerTitle: true,
      ),
      body: BottomSmallStyle(
          body: Padding(
        padding: EdgeInsets.fromLTRB(15,220, 15, 0),
        child: Container(
          color: Colors.transparent,
          width: Get.width,
          height: Get.height*0.67,
          child: Align(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: Column(
                
                children: [
                 
                  discoverWidget(
                    filter: true,
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
