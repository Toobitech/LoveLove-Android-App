import 'package:LoveLove/components/DiscoverModel.dart';
import 'package:LoveLove/components/apiurl.dart';
import 'package:LoveLove/global/alertboxes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../global/imagePreview.dart';
import '../../helpers/colors.dart';

class ProfileStack extends StatefulWidget {
  List<DiscoverImages> images;
  bool isFemale;
  String imageUrl;
  ProfileStack(
      {super.key,
      required this.images,
      required this.isFemale,
      required this.imageUrl});

  @override
  State<ProfileStack> createState() => _ProfileStackState();
}

class _ProfileStackState extends State<ProfileStack> {
  @override
  Widget build(BuildContext context) {
    // Create a for loop to add widgets to the list.
    return widget.images.isEmpty
        ? Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                    width: 8,
                    color: widget.isFemale
                        ? AppColors.femalecolor
                        : AppColors.malecolor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: "${AppUrl.impath}/${widget.imageUrl}",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Get.to(() => ImagePreviewList(
                    images:
                        widget.images.map((e) => e.image.toString()).toList(),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 8,
                      color: widget.isFemale
                          ? AppColors.femalecolor
                          : AppColors.malecolor)),
              child: Stack(
                children: [
                  widget.images.length >= 1
                      ? Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  "${AppUrl.impath}/${widget.images[0].image}",
                              placeholder: (context, url) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  widget.images.length >= 2
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${AppUrl.impath}/${widget.images[1].image}",
                                placeholder: (context, url) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  widget.images.length >= 3
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20.0, left: 20),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl:
                                    "${AppUrl.impath}/${widget.images[2].image}",
                                placeholder: (context, url) => Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
                // children: [...children],
              ),
            ),
          );
  }
}
