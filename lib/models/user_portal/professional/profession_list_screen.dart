import 'package:LoveLove/components/custom_button.dart';
import 'package:LoveLove/models/user_portal/professional/controller/profession_controller.dart';
import 'package:LoveLove/models/user_portal/professional/model/profession_catetory_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/customAppBar.dart';
import '../../../../global/userdrawer.dart';
import '../../../components/custom_backbutton.dart';
import 'profession_screen.dart';

class ProfessionListScreen extends StatefulWidget {
  ProfessionListScreen({super.key});

  @override
  State<ProfessionListScreen> createState() => _ProfessionListScreenState();
}

class _ProfessionListScreenState extends State<ProfessionListScreen> {
  final controller = Get.put(ProfessionController());
  @override
  void initState() {
    super.initState();
    controller.getProfessionaData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getProfessionaData();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: AppColors.white,
        drawer: const userdrawer(
          professionalUser: true,
        ),
        appBar: CustomAppBar(
          searchbar: true,
        ),
        body: Stack(
          children: [
            Obx(() => controller.isLoading.value
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.pink,
                    ),
                  )
                : controller.professionList.isEmpty
                    ? Center(
                        child: boldtext(
                            AppColors.black, 18, 'This list is Empty...'))
                    : Padding(
                        padding:
                            EdgeInsets.fromLTRB(25, Get.height * 0.20, 25, 20),
                        child: ListView.builder(
                            itemCount: controller.professionList.length,
                            itemBuilder: (context, index) {
                              ProfessionModel item =
                                  controller.professionList[index];
                              return CustomButton(
                                  title: item.name,
                                  tap: () {
                                    print('${item.name}${item.id}');
                                    Get.to(ProfessionScreen(
                                      categoryName: item.name,
                                      professionID: item.id.toString(),
                                    ));
                                  });
                            }),
                      )),
            BottomSmallStyle(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  vertical(Get.height * 0.16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boldtext(
                          AppColors.white, Get.height * 0.026, "Professions"),
                    ],
                  ),
                ],
              ),
            )),
            const Align(
              alignment: Alignment.bottomLeft,
              child: CustomBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
