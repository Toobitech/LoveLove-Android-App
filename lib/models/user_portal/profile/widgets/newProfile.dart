import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/components/RelationModel.dart';
import 'package:LoveLove/components/globalvariables.dart';
import 'package:LoveLove/helpers/assets.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/profile_data1.dart';

import '../../../../global/bottomstyle.dart';
import '../../../../helpers/button.dart';
import '../controller/relationController.dart';

class NewProfileMain extends StatefulWidget {
  const NewProfileMain({super.key});

  @override
  State<NewProfileMain> createState() => _NewProfileMainState();
}

class _NewProfileMainState extends State<NewProfileMain> {
  var relation = Get.find<RelationController>();
  bool checkBoxValue = false;
  String selected = '';
  String selectedID = '';
  List<String> data = [
    // "Yourself",
    "Father",
    "Mother",
    "Brother",
    "Sister",
    "Friend",
    "Uncle",
    "Aunt",
    "Others",
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedID = appStorage.read(ACCOUNT_FOR);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(relationDataList);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: CustomBackButton(),
          elevation: 0,
        ),
        body: BottomStyle(
          body: SingleChildScrollView(
            child: Column(
              children: [
                vertical(Get.height * 0.08),
                SizedBox(
                  height: Get.height * 0.3,
                  width: Get.width,
                  child: Image.asset(AppImages.edit_profile_img),
                ),
                vertical(Get.height * 0.1),
                SizedBox(
                  height: Get.height * 0.45,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          boldtext(AppColors.white, 15,
                              "Relation with the Person to whom you are making profile for",
                              center: true),
                          vertical(20),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: SizedBox(
                              height: 200,
                              child: GridView.builder(
                                itemCount: relationDataList!.length,
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 4.0,
                                        crossAxisSpacing: 2.0,
                                        mainAxisSpacing: 1.0),
                                itemBuilder: (BuildContext context, int index) {
                                  return Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          relation.relationSelection(
                                              relationDataList![index]
                                                  .name
                                                  .toString());
                                          setState(() {
                                            selected =
                                                relationDataList![index].name;
                                            selectedID =
                                                relationDataList![index]
                                                    .id
                                                    .toString();
                                          });
                                        },
                                        icon: Icon(
                                          selectedID ==
                                                  relationDataList![index]
                                                      .id
                                                      .toString()
                                              ? Icons.check_box
                                              : Icons.check_box_outline_blank,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          relationDataList![index].name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          buttonMain(0.6, "Next", () {
                            if (selectedID == '') {
                            } else {
                              Get.to(() => ProfileData1(
                                    id: selectedID,
                                  ));
                              print(selectedID);
                            }
                          },
                              bgColor: Colors.transparent,
                              bColor: AppColors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
