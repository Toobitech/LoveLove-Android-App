import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:LoveLove/models/user_portal/profile/widgets/skipScreens/share_link.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../global/bottomsmallStyle.dart';
import '../../../../../helpers/colors.dart';
import '../../../../../helpers/spacer.dart';
import '../../../discover/view/discoverMain.dart';
import '../../controller/invitelinkController.dart';

class ReferenceLink extends StatefulWidget {
  var link;
  ReferenceLink({super.key, required this.link});

  @override
  State<ReferenceLink> createState() => _ReferenceLinkState();
}

class _ReferenceLinkState extends State<ReferenceLink> {
  final TextEditingController _textController = TextEditingController();
  // var invitationcontroller = Get.find<InviteLinkController>();

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: _textController.text));

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.text = widget.link ?? '';
  }

  @override
  Widget build(BuildContext context) {
    print('UserLinkInvite ${widget.link}');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.offAll(() => DiscoverMain());
            },
            icon: Icon(
              Icons.home,
              color: AppColors.gradientLight,
            )),
      ),
      body: BottomSmallStyle(
        top: false,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 200),
              child: Center(
                  child: Text(
                'Reference Link',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 1, color: Colors.black),
                    color: Colors.transparent),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          border: Border(
                              right:
                                  BorderSide(color: Colors.black, width: 1))),
                      child: Center(
                        child: TextField(
                          controller: _textController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                              enabled: false,
                              // readOnly: true,

                              fillColor: Colors.white,
                              filled: true,
                              contentPadding:
                                  EdgeInsets.only(top: 20, left: 20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    topLeft: Radius.circular(25)),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          // border: Border(
                          //     left: BorderSide(width: 2, color: Colors.black)
                          // )
                        ),
                        child: TextButton(
                            onPressed: (_copyToClipboard),
                            child: const Text(
                              'copy',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  print('Send Link With Some one');
                  Share.share(widget.link);
                  // Get.to(() => ShareLink());
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: ((context) => sharelink())));
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(width: 1, color: Colors.black),
                        color: Colors.transparent),
                    child: const Center(
                      child: Text(
                        'Share link',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )),
              ),
            ),
            vertical(150),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomBackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
