import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcard/tcard.dart';

import '../components/apiurl.dart';
import '../helpers/colors.dart';
import '../helpers/const_text.dart';
import '../helpers/spacer.dart';

class ImagePreviewList extends StatefulWidget {
  List<String> images;
  ImagePreviewList({super.key, required this.images});

  @override
  State<ImagePreviewList> createState() => _ImagePreviewListState();
}

class _ImagePreviewListState extends State<ImagePreviewList> {
  TCardController _controller = TCardController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 40,
                color: Colors.white,
              )),
          horizental(25)
        ],
      ),
      body: ListView.builder(
        itemCount: widget.images.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: Get.width,
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: CachedNetworkImage(
              // fit: BoxFit.cover,
              imageUrl: "${AppUrl.impath}/${widget.images[index]}",
              placeholder: (context, url) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          );
        },
      ),
      //  Center(
      //   child: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: TCard(
      //       cards: List.generate(
      //         widget.images.length,
      //         (int index) {
      //           return Container(
      //             width: Get.width,
      //             height: Get.height,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(20),
      //               color: Colors.white,
      //             ),
      //             child: ClipRRect(
      //               borderRadius: BorderRadius.circular(20),
      //               child: CachedNetworkImage(
      //                 fit: BoxFit.cover,
      //                 imageUrl: "${AppUrl.impath}/${widget.images[index]}",
      //                 placeholder: (context, url) => Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     CircularProgressIndicator(),
      //                   ],
      //                 ),
      //                 errorWidget: (context, url, error) => Icon(Icons.error),
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //       controller: _controller,
      //       size: Size(Get.width, Get.height * 0.9),
      //       onForward: (index, info) {
      //         if (index >= widget.images.length) {
      //         } else {
      //           print("else");
      //           _index = index;
      //         }
      //         print(info.direction);
      //         setState(() {});
      //       },
      //       onBack: (index, info) {
      //         if (index >= widget.images.length) {
      //         } else {
      //           _index = index;
      //         }
      //         print("back called");
      //         setState(() {});
      //       },
      //       onEnd: () {
      //         print('end');
      //         Get.back();
      //       },
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.transparent,
      //   onPressed: () {
      //     _controller.reset();
      //   },
      //   child: boldtext(
      //       AppColors.white, 14, "${_index + 1}/${widget.images.length}"),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
