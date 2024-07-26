import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/models/user_portal/professional/controller/profession_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/helpers/const_text.dart';
import 'package:LoveLove/helpers/spacer.dart';
import 'package:LoveLove/models/user_portal/discover/controllers/DiscoverController.dart';
import '../../../../global/bottomsmallStyle.dart';
import '../../../../global/customAppBar.dart';
import '../../../../global/userdrawer.dart';
import '../../../components/custom_backbutton.dart';
import '../../../components/globalvariables.dart';
import '../discover/appbarchat/view/appbarChat.dart';
import '../discover/controllers/ProfileViewController.dart';
import 'professiondetailscreen.dart';

class ProfessionScreen extends StatefulWidget {
  final String professionID;
  final String categoryName;
  ProfessionScreen(
      {super.key, required this.categoryName, required this.professionID});

  @override
  State<ProfessionScreen> createState() => _ProfessionScreenState();
}

class _ProfessionScreenState extends State<ProfessionScreen> {
  final controller = Get.put(ProfessionController());
  final controllerview = Get.put(ProfileViewController());
  @override
  void initState() {
    super.initState();
    controller.getProfessionaDataByUserID(widget.professionID);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.getProfessionaDataByUserID(widget.professionID);
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
            Obx(
              () => controller.isLoadingprofession.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.pink,
                      ),
                    )
                  : controller.professionByIDList.isEmpty
                      ? Center(
                          child: boldtext(AppColors.black, Get.height * 0.02,
                              'This list is Empty...'))
                      : CustomScrollView(slivers: <Widget>[
                          SliverPadding(
                            padding: EdgeInsets.fromLTRB(
                                25, Get.height * 0.28, 25, 20),
                            sliver: SliverGrid(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, childAspectRatio: 0.7),
                              delegate: SliverChildBuilderDelegate(
                                childCount:
                                    controller.professionByIDList.length,
                                (context, index) {
                                  UserData item =
                                      controller.professionByIDList[index];

                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(ProfessionDetailScreen(
                                        professionData: item,
                                      ));
                                    },
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                          height: Get.height * 0.2,
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          decoration: BoxDecoration(
                                              color: AppColors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    offset: Offset(0.6, 0.8),
                                                    blurRadius: 10)
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: Get.height * 0.155,
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 8),
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          item.profile !=
                                                                  "default.png"
                                                              ? AppUrl.imagePath +
                                                                  item.profile
                                                                      .toString()
                                                              : AppUrl
                                                                  .imgProfile,
                                                        ),
                                                        fit: BoxFit.cover)),
                                                child: Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      height:
                                                          Get.height * 0.025,
                                                      width: Get.width * 0.053,
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: item.isLogin ==
                                                                      1
                                                                  ? Colors.green
                                                                  : AppColors
                                                                      .pink),
                                                          shape:
                                                              BoxShape.circle,
                                                          color: item.isLogin ==
                                                                  1
                                                              ? Colors.green
                                                              : Colors.black),
                                                    )),
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.14,
                                                    child: Text(
                                                      '${item.firstName}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      softWrap: false,
                                                      style: TextStyle(
                                                          fontSize: Get.height *
                                                              0.015,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color:
                                                              AppColors.black),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      if (controllerview
                                                              .isChatAvailable
                                                              .value ==
                                                          true) {
                                                        Get.to(() => AppBarChat(
                                                            data: item.id
                                                                .toString()));
                                                      } else {
                                                        List users = [
                                                          item.id,
                                                          appStorage
                                                              .read(USERID)
                                                        ];
                                                        users.sort();
                                                        print(users);
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection('chats')
                                                            .add({
                                                          'userId': users,
                                                          item.id.toString():
                                                              item.firstName!,
                                                          appStorage
                                                                  .read(USERID)
                                                                  .toString():
                                                              appStorage.read(
                                                                  userName),
                                                          'time': DateTime.now()
                                                              .toUtc(),
                                                          'img${appStorage.read(USERID)}':
                                                              appStorage
                                                                  .read(
                                                                      profileUrl)
                                                                  .toString(),
                                                          'img${item.id.toString()}':
                                                              item.profile
                                                                  .toString(),
                                                          'msg': null
                                                        }).then((value) => {
                                                                  controllerview
                                                                      .updateAvailable(value
                                                                          .id
                                                                          .toString()),
                                                                  Get.to(() => AppBarChat(
                                                                      data: value
                                                                          .id
                                                                          .toString()))
                                                                });
                                                      }
                                                      print('ChatAppTap');
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 15),
                                                      width: Get.width * 0.13,
                                                      height:
                                                          Get.height * 0.023,
                                                      // padding: EdgeInsets.symmetric(vertical: 15),
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              AppColors
                                                                  .gradientLight,
                                                              AppColors
                                                                  .gradientDark
                                                            ],
                                                            begin: Alignment
                                                                .topCenter,
                                                            end: Alignment
                                                                .bottomCenter,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30)),
                                                      child: Center(
                                                          child: Text(
                                                        'Chat',
                                                        style: TextStyle(
                                                            fontSize:
                                                                Get.height *
                                                                    0.015,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: AppColors
                                                                .white),
                                                      )),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                item.about != null
                                                    ? item.about.toString()
                                                    : '',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 3,
                                                softWrap: false,
                                                textAlign: TextAlign.justify,
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              ),
                            ),
                          ),
                        ]),
            ),
            // Padding(
            //     padding: EdgeInsets.fromLTRB(25, Get.height * 0.18, 25, 20),
            //     child: GridView.builder(
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 20,
            //           mainAxisSpacing: 20,
            //         ),
            //         itemCount: 6,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Container(
            //               height: 310.0,
            //             width: double.infinity,
            //             padding: EdgeInsets.symmetric(horizontal: 25),
            //             decoration: BoxDecoration(
            //                 color: AppColors.white,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       color: Colors.black38,
            //                       offset: Offset(0.6, 0.8),
            //                       blurRadius: 10)
            //                 ],
            //                 borderRadius: BorderRadius.circular(12)),

            //             child: Column(
            //               children: [
            //                 Padding(
            //                   padding: EdgeInsets.all(10),
            //                   child: SizedBox(
            //                     height: 190,
            //                     child: Image.network(
            //                       'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //                 Row(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Text(
            //                       'Alice Lily',
            //                       style: TextStyle(
            //                           fontSize: 16,
            //                           fontWeight: FontWeight.w700,
            //                           color: AppColors.black),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {},
            //                       child: Container(
            //                         margin: EdgeInsets.only(bottom: 15),
            //                         width: 80,
            //                         height: 30,
            //                         // padding: EdgeInsets.symmetric(vertical: 15),
            //                         decoration: BoxDecoration(
            //                             gradient: LinearGradient(
            //                               colors: [
            //                                 AppColors.gradientLight,
            //                                 AppColors.gradientDark
            //                               ],
            //                               begin: Alignment.topCenter,
            //                               end: Alignment.bottomCenter,
            //                             ),
            //                             borderRadius:
            //                                 BorderRadius.circular(30)),
            //                         child: Center(
            //                             child: Text(
            //                           'Chat',
            //                           style: TextStyle(
            //                               fontSize: 16,
            //                               fontWeight: FontWeight.w700,
            //                               color: AppColors.white),
            //                         )),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //                 Text(
            //                   'In publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document ',
            //                   style: TextStyle(
            //                       fontSize: 14,
            //                       color: AppColors.black,
            //                       fontWeight: FontWeight.normal),
            //                   overflow: TextOverflow.ellipsis,
            //                   maxLines: 3,
            //                   softWrap: false,
            //                   textAlign: TextAlign.justify,
            //                 ),
            //               ],
            //             ),
            //           );

            //           //
            //         })
            //     // Column(
            //     //   children: [
            //     //     SizedBox(height: 150),
            //     //     Row(
            //     //       children: [
            //     //         Container(
            //     //           width: double.infinity,
            //     //           padding: EdgeInsets.symmetric(horizontal: 25),
            //     //           decoration: BoxDecoration(
            //     //               color: AppColors.white,
            //     //               boxShadow: [
            //     //                 BoxShadow(
            //     //                     color: Colors.black38,
            //     //                     offset: Offset(0.6, 0.8),
            //     //                     blurRadius: 10)
            //     //               ],
            //     //               borderRadius: BorderRadius.circular(12)),
            //     //           height: 310.0,
            //     //           child: Column(
            //     //             children: [
            //     //               Padding(
            //     //                 padding: EdgeInsets.all(10),
            //     //                 child: SizedBox(
            //     //                   height: 190,
            //     //                   child: Image.network(
            //     //                     'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
            //     //                     fit: BoxFit.cover,
            //     //                   ),
            //     //                 ),
            //     //               ),
            //     //               Row(
            //     //                 crossAxisAlignment: CrossAxisAlignment.center,
            //     //                 mainAxisAlignment:
            //     //                     MainAxisAlignment.spaceBetween,
            //     //                 children: [
            //     //                   Text(
            //     //                     'Alice Lily',
            //     //                     style: TextStyle(
            //     //                         fontSize: 16,
            //     //                         fontWeight: FontWeight.w700,
            //     //                         color: AppColors.black),
            //     //                   ),
            //     //                   GestureDetector(
            //     //                     onTap: () {},
            //     //                     child: Container(
            //     //                       margin: EdgeInsets.only(bottom: 15),
            //     //                       width: 80,
            //     //                       height: 30,
            //     //                       // padding: EdgeInsets.symmetric(vertical: 15),
            //     //                       decoration: BoxDecoration(
            //     //                           gradient: LinearGradient(
            //     //                             colors: [
            //     //                               AppColors.gradientLight,
            //     //                               AppColors.gradientDark
            //     //                             ],
            //     //                             begin: Alignment.topCenter,
            //     //                             end: Alignment.bottomCenter,
            //     //                           ),
            //     //                           borderRadius:
            //     //                               BorderRadius.circular(30)),
            //     //                       child: Center(
            //     //                           child: Text(
            //     //                         'Chat',
            //     //                         style: TextStyle(
            //     //                             fontSize: 16,
            //     //                             fontWeight: FontWeight.w700,
            //     //                             color: AppColors.white),
            //     //                       )),
            //     //                     ),
            //     //                   ),
            //     //                 ],
            //     //               ),
            //     //               Text(
            //     //                 'In publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document ',
            //     //                 style: TextStyle(
            //     //                     fontSize: 14,
            //     //                     color: AppColors.black,
            //     //                     fontWeight: FontWeight.normal),
            //     //                 overflow: TextOverflow.ellipsis,
            //     //                 maxLines: 3,
            //     //                 softWrap: false,
            //     //                 textAlign: TextAlign.justify,
            //     //               ),
            //     //             ],
            //     //           ),
            //     //         ),
            //     //         Container(
            //     //           width: double.infinity,
            //     //           padding: EdgeInsets.symmetric(horizontal: 25),
            //     //           decoration: BoxDecoration(
            //     //               color: AppColors.white,
            //     //               boxShadow: [
            //     //                 BoxShadow(
            //     //                     color: Colors.black38,
            //     //                     offset: Offset(0.6, 0.8),
            //     //                     blurRadius: 10)
            //     //               ],
            //     //               borderRadius: BorderRadius.circular(12)),
            //     //           height: 310.0,
            //     //           child: Column(
            //     //             children: [
            //     //               Padding(
            //     //                 padding: EdgeInsets.all(10),
            //     //                 child: SizedBox(
            //     //                   height: 190,
            //     //                   child: Image.network(
            //     //                     'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
            //     //                     fit: BoxFit.cover,
            //     //                   ),
            //     //                 ),
            //     //               ),
            //     //               Row(
            //     //                 crossAxisAlignment: CrossAxisAlignment.center,
            //     //                 mainAxisAlignment:
            //     //                     MainAxisAlignment.spaceBetween,
            //     //                 children: [
            //     //                   Text(
            //     //                     'Alice Lily',
            //     //                     style: TextStyle(
            //     //                         fontSize: 16,
            //     //                         fontWeight: FontWeight.w700,
            //     //                         color: AppColors.black),
            //     //                   ),
            //     //                   GestureDetector(
            //     //                     onTap: () {},
            //     //                     child: Container(
            //     //                       margin: EdgeInsets.only(bottom: 15),
            //     //                       width: 80,
            //     //                       height: 30,
            //     //                       // padding: EdgeInsets.symmetric(vertical: 15),
            //     //                       decoration: BoxDecoration(
            //     //                           gradient: LinearGradient(
            //     //                             colors: [
            //     //                               AppColors.gradientLight,
            //     //                               AppColors.gradientDark
            //     //                             ],
            //     //                             begin: Alignment.topCenter,
            //     //                             end: Alignment.bottomCenter,
            //     //                           ),
            //     //                           borderRadius:
            //     //                               BorderRadius.circular(30)),
            //     //                       child: Center(
            //     //                           child: Text(
            //     //                         'Chat',
            //     //                         style: TextStyle(
            //     //                             fontSize: 16,
            //     //                             fontWeight: FontWeight.w700,
            //     //                             color: AppColors.white),
            //     //                       )),
            //     //                     ),
            //     //                   ),
            //     //                 ],
            //     //               ),
            //     //               Text(
            //     //                 'In publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document ',
            //     //                 style: TextStyle(
            //     //                     fontSize: 14,
            //     //                     color: AppColors.black,
            //     //                     fontWeight: FontWeight.normal),
            //     //                 overflow: TextOverflow.ellipsis,
            //     //                 maxLines: 3,
            //     //                 softWrap: false,
            //     //                 textAlign: TextAlign.justify,
            //     //               ),
            //     //             ],
            //     //           ),
            //     //         ),

            //     //       ],
            //     //     )
            //     //   ],
            //     // )
            //     ),

            BottomSmallStyle(
                body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  vertical(Get.height * 0.16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      boldtext(AppColors.white, Get.height * 0.024,
                          widget.categoryName),
                    ],
                  ),
                  // vertical(10),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
