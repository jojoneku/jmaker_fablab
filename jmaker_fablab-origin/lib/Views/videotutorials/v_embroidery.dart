import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_Embroidery extends StatefulWidget {
  const VideoTutorial_Embroidery({Key? key});

  @override
  State<VideoTutorial_Embroidery> createState() =>
      _VideoTutorial_EmbroideryState();
}

class _VideoTutorial_EmbroideryState extends State<VideoTutorial_Embroidery> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Intro",
      "url": "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FINTRODUCTION.mp4?alt=media&token=426a629a-426a-4b45-a429-ceaa4083b4a3"
    },
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%201_%20BROTHER%20PR1000e%20-%20Installing%20the%20Bobbin.mp4?alt=media&token=4038f714-b349-4292-aab1-4c280caf7e5e"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%202_BROTHER%20PR1000e%20-%20Switching%20On%20the%20Machine.mp4?alt=media&token=db529430-65e3-433a-aa78-e1fdd9d83678"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%203_%20BROTHER%20PR1000e%20-%20Inserting%20the%20Flashdrive.mp4?alt=media&token=c385da4b-02c3-45e2-b4da-e6892c7eaaa3"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%204_BROTHER%20PR1000e%20-%20Pressing%20USB%20icon%20and%20Choosing%20your%20data.mp4?alt=media&token=9d6eb25e-171f-444a-959b-7a019a0b1042"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%205_%20BROTHER%20PR1000e%20-%20Editing%20the%20Embroidery%20Pattern.mp4?alt=media&token=4fa51e9a-d788-41b9-bbc4-60d4a235c877"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%206_%20BROTHER%20PR1000e%20-%20Checking%20the%20Previewed%20Image.mp4?alt=media&token=8987294f-f02f-46a2-948e-0b1faac2e904"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%207_%20BROTHER%20PR100e%20-%20Hooping%20the%20fabric%20into%20the%20Embroidery%20Frame.mp4?alt=media&token=f843a58a-32d7-4e2e-858f-3ca0aa56b0aa"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%208_BROTHER%20PR100e%20-%20Attaching%20the%20Embroidery%20Frame%20into%20the%20Machine.mp4?alt=media&token=3edb913e-19a5-4d8e-ae99-737a7e040bbb"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%209%20_%20BROTHER%20PR100e%20-%20Specifying%20the%20Embroidery%20Settings.mp4?alt=media&token=5d3510c3-b4a6-4dfe-902e-fbeb1e6ec243"
    },
    {
      "title": "Step 10",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%2010_%20BROTHER%20PR100e%20-%20Pressing%20Set.mp4?alt=media&token=2010c5e8-dc00-45a9-bffe-e99d5451de09"
    },
    {
      "title": "Step 11",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%2011_%20BROTHER%20PR100e%20-%20Checking%20the%20Embroidery%20Area.mp4?alt=media&token=54da009d-35e3-43e7-a2af-298cdafd964b"
    },
    {
      "title": "Step 12",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%2012_%20BROTHER%20PR100e%20-%20Pressing%20Edit%20End.mp4?alt=media&token=65b1f92f-1348-4c8e-808e-8262cda744c8"
    },
    {
      "title": "Step 13",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FStep%2013_%20BROTHER%20PR100e%20-%20Threading%20the%20Upper%20Threads.mp4?alt=media&token=6f6049ac-1345-4696-a4b5-906fb9e8b403"
    },
    {
      "title": "Step 14",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%2014_%20BROTHER%20PR100e%20-%20Pressing%20the%20Lock%20then%20Press%20Start%20or%20Stop.mp4?alt=media&token=a82ab634-7b98-4ad7-a24a-ea339c25c3db"
    },
    {
      "title": "Step 15",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%2015_%20BROTHER%20PR100e%20-%20Removing%20the%20Embroidery%20Frame.mp4?alt=media&token=c44e93ab-3038-4b7f-89cf-05b44d2fa09a"
    },
    {
      "title": "Step 16",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FSTEP%2016_%20BROTHER%20PR100e%20-%20Turning%20Off%20the%20Machine.mp4?alt=media&token=2e827c2d-9ea8-463f-8f83-bcd3f7693d2e"
    },
    //16

  ];

  List<Map<String, String>> datamaking_videos = [
    {
      //TODO THE UPLOADED FILE IS NOT A VIDEO, REPLACE.
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%201_%20BROTHER%20PR1000e%20-%20Launching%20Adobe%20Illustrator.mp4.html?alt=media&token=cd12d5dd-57cb-4d28-b498-42c0de30f420"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%202_%20BROTHER%20PR1000e%20-%20Creating%20designs%20by%20importing%20images.mp4?alt=media&token=731b85c3-825d-496b-840f-b2db784da7da"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%203_%20BROTHER%20PR1000e%20-%20Saving%20file%20from%20Adobe%20Illustrator.mp4?alt=media&token=6ecfaa80-c2dc-4b0b-bc92-9fe6a819f340"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%204_%20BROTHER%20PR1000e%20-%20Inserting%20the%20PE%20DESIGN%2010%20into%20the%20computer.mp4?alt=media&token=20182ae9-e436-4d44-8d63-23f36fa9fbe7"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%205_%20BROTHER%20PR1000e%20-%20Launching%20PE%20DESIGN%20software.mp4?alt=media&token=54cdda22-ac21-4d00-9d57-87dd92fa8a9e"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%206_%20BROTHER%20PR1000e%20-%20lmporting%20image%20file%20data%20in%20PE%20DESIGN%20software.mp4?alt=media&token=7effb043-0e96-4a66-8568-b9e19ba882c3"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%207_%20BROTHER%20PR1000e%20-%20Importing%20through%20Auto%20Punch.mp4?alt=media&token=ee0cf40f-54d8-47fc-be56-906c0e43563f"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%208_%20BROTHER%20PR1000e%20-%20Ungrouping%20icons.mp4?alt=media&token=4f629a9d-7e94-4d12-89d3-b268c09a5d4b"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%209_%20BROTHER%20PR1000e%20-%20Changing%20stitch%20type%20and%20color.mp4?alt=media&token=141b0aab-bab9-4b4d-8c34-4a1599d06476"
    },
    {
      "title": "Step 10",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEMBROIDERY%2FDATAMAKING%2FSTEP%2010_%20BROTHER%20PR1000e%20-%20Saving%20the%20design.mp4?alt=media&token=3e7d5d65-290a-49a8-8c02-ab050f592140"
    },
    //10

  ];

  List<Map<String, String>> maintenance_videos = [
  ];

  //List for Operational Videos
  List<bool> operationalButtonStates = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  //List for Data Making Buttons
  List<bool> dataMakingButtonStates = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  //List for Maintenance Buttons
  List<bool> maintenanceButtonStates = [

  ];

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      operational_videos[0]["url"]!,
    )..initialize().then((_) {
      setState(() {});
    });
    _startHideButtonTimer(delay: const Duration(seconds: 3)); // Initial delay to show the button
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _hideButtonTimer.cancel();
    super.dispose();
  }

  void _operationalPlayVideo(String url, int index) {
    setState(() {
      for (int i = 0; i < operationalButtonStates.length; i++) {
        operationalButtonStates[i] = i == index;
      }
      for (int j = 0; j < dataMakingButtonStates.length; j++) {
        dataMakingButtonStates[j] = false;
      }
      for (int k = 0; k < maintenanceButtonStates.length; k++) {
        maintenanceButtonStates[k] = false;
      }
    });
    _videoPlayerController.pause();
    _videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _startHideButtonTimer(delay: Duration(seconds: 3));
      });
  }

  void _dataMakingPlayVideo(String url, int index) {
    setState(() {
      for (int i = 0; i < dataMakingButtonStates.length; i++) {
        dataMakingButtonStates[i] = i == index;
      }
      for (int j = 0; j < operationalButtonStates.length; j++) {
        operationalButtonStates[j] = false;
      }
      for (int k = 0; k < maintenanceButtonStates.length; k++) {
        maintenanceButtonStates[k] = false;
      }
    });
    _videoPlayerController.pause();
    _videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _startHideButtonTimer(delay: const Duration(seconds: 3));
      });
  }

  /*void _maintenancePlayVideo(String url, int index) {
    setState(() {
      for (int i = 0; i < maintenanceButtonStates.length; i++) {
        maintenanceButtonStates[i] = i == index;
      }
      for (int j = 0; j < operationalButtonStates.length; j++) {
        operationalButtonStates[j] = false;
      }
      for (int k = 0; k < dataMakingButtonStates.length; k++) {
        dataMakingButtonStates[k] = false;
      }
    });
    _videoPlayerController.pause();
    _videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _startHideButtonTimer(delay: const Duration(seconds: 3));
      });
  }*/



  void _togglePlayPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
      } else {
        _videoPlayerController.play();
        _startHideButtonTimer(delay: const Duration(seconds: 3)); // Restart timer
      }
      _showPlayPauseButton = !_videoPlayerController.value.isPlaying;
    });
  }

  void _startHideButtonTimer({required Duration delay}) {
    _hideButtonTimer = Timer(delay, () {
      setState(() {
        _showPlayPauseButton = false;
      });
    });
  }

  void _onTapVideo() {
    setState(() {
      _showPlayPauseButton = true;
    });
    _hideButtonTimer.cancel();
    _startHideButtonTimer(delay: Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //TODO CHANGE THIS $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        title: Text('Embroidery Machine Video Tutorial'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _videoPlayerController.value.isInitialized
                      ? GestureDetector(
                    onTap: _onTapVideo,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio:
                          _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        ),
                        AnimatedOpacity(
                          opacity: _showPlayPauseButton ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 500), // Adjust duration as needed
                          child: FloatingActionButton(
                            mini: true,
                            shape: CircleBorder(),
                            backgroundColor: mainYellow,
                            onPressed: _togglePlayPause,
                            child: Icon(
                              _videoPlayerController.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      : SizedBox(
                    height: 210,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: secondGrey,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: mainYellow,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Text('Operational Video Tutorials', style: CustomTextStyle.boldHeader),
                  Divider(),
                  SizedBox(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 4.0, // Adjust spacing between rows
                      children: operational_videos.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> video = entry.value;
                        return SizedBox(
                          width: 80,
                          height: 35,
                          child: TextButton(
                            style: operationalButtonStates[index]
                                ? pressedButtonStyle
                                : stepYellow,
                            onPressed: () =>
                                _operationalPlayVideo(video["url"]!, index),
                            child: Center(
                              child: Text(
                                video["title"]!,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: CustomTextStyle.stepText,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  Divider(),
                  Text('Datamaking Video Tutorials', style: CustomTextStyle.boldHeader),
                  Divider(),
                  SizedBox(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 4, // Adjust spacing between rows
                      children: datamaking_videos.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> video = entry.value;
                        return SizedBox(
                          width: 80,
                          height: 35,
                          child: TextButton(
                            style: dataMakingButtonStates[index]
                                ? pressedButtonStyle
                                : stepYellow,
                            onPressed: () =>
                                _dataMakingPlayVideo(video["url"]!, index),
                            child: Center(
                              child: Text(
                                video["title"]!,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: CustomTextStyle.stepText,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
