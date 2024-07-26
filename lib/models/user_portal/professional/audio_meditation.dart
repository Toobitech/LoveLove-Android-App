import 'package:LoveLove/components/custom_backbutton.dart';
import 'package:LoveLove/helpers/colors.dart';
import 'package:LoveLove/models/user_portal/discover/view/discoverMain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:just_audio/just_audio.dart';
import '../../../global/alertboxes.dart';
import '../../../global/bottomsmallStyle.dart';
import '../../../global/customAppBar.dart';
import '../../../global/userdrawer.dart';
import '../../../helpers/spacer.dart';

class LoveAudioScreen extends StatefulWidget {
  @override
  _LoveAudioScreenState createState() => _LoveAudioScreenState();
}

class _LoveAudioScreenState extends State<LoveAudioScreen> {
  late AudioPlayer player;
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _initAudioPlayer();
    // Listen to the current position updates
    player.positionStream.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // Listen to the total duration updates
    player.durationStream.listen((newDuration) {
      if (newDuration != null) {
        setState(() {
          duration = newDuration;
        });
      }
    });
    // Listen to the player state updates
    player.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        setState(() {
          // Reset the position to zero when audio completes
          position = Duration.zero;
        });
        _showCompletionDialog();
      }
      // Update the UI when player state changes
      setState(() {});
    });
  }

  Future<void> _initAudioPlayer() async {
    try {
      await player.setAsset('assets/images/pic/audio.mp3');
    } catch (e) {
      // Handle initialization errors
      print('Error initializing audio player: $e');
    }
  }

  void playPauseAudio() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  Future<void> _showCompletionDialog() async {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
          Get.to(DiscoverMain());
        });
        return AlertDialog(
          
          
          
          backgroundColor: AppColors.pink,
         
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite_outline_rounded,size: 30,color: AppColors.white,),
              SizedBox(width: Get.width*0.05,),
              Center(child: Text('You Got reward points',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w800,fontSize: 20),)),
              
            ],
          ),
          
          content: Container(
            height: Get.height*0.15,
            child: Center(child: Text('Navigating to Discover Screen....',style: TextStyle(color: AppColors.white,fontWeight: FontWeight.w400),))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showExitPopup();
      },
      child: RefreshIndicator(
        onRefresh: () async {},
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
              Padding(
                padding: EdgeInsets.fromLTRB(25, Get.height * 0.22, 25, 20),
                child: Column(
                  children: [
                    vertical(20),
                    Image.asset(
                      'assets/images/pic/lovelove.png',
                      height: Get.height * 0.3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text("Self-Love",
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.pink,
                            fontWeight: FontWeight.w800,
                          )),
                    ),
                    Text(
                      "Meditation",
                      style: TextStyle(
                        fontSize: 35,
                        color: AppColors.pink,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Slider(
                      min: 0.0,
                      max: duration.inSeconds.toDouble(),
                      value: position.inSeconds.toDouble(),
                      activeColor: AppColors.pink,
                      thumbColor: AppColors.pink,
                      onChanged: (value) {
                        setState(() {
                          player.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                    Text(
                      "${position.inMinutes}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')} / ${duration.inMinutes}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                      style: TextStyle(
                          color: AppColors.pink,
                          fontWeight: FontWeight.w600),
                    ),
                   
                    IconButton(
                      icon: Icon(
                        player.playing ? Icons.pause : Icons.play_arrow,
                        color: AppColors.pink,
                      ),
                      iconSize: 48.0,
                      onPressed: playPauseAudio,
                    ),
                  ],
                ),
              ),

              BottomSmallStyle(
                  body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    vertical(Get.height * 0.16),
                  ],
                ),
              )),
              Align(alignment: Alignment.bottomLeft, child: CustomBackButton())
             
            ],
          ),
        ),
      ),
    );
  }
}
