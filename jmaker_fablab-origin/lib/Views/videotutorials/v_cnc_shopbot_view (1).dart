import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_CNCShopbot extends StatefulWidget {
  const VideoTutorial_CNCShopbot({Key? key});

  @override
  State<VideoTutorial_CNCShopbot> createState() =>
      _VideoTutorial_CNCShopbotState();
}

class _VideoTutorial_CNCShopbotState extends State<VideoTutorial_CNCShopbot> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;

  List<Map<String, String>> operational_videos = [

    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%201%20CNC%20SHOPBOT.mp4?alt=media&token=20df78e5-d275-4792-8aee-1bde2691d88f"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%202%20CNC%20SHOPBOT.mp4?alt=media&token=3bbe7dea-eafb-4522-9d9d-e4b7ec32bcca"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%203%20CNC%20SHOPBOT.mp4?alt=media&token=105f2048-8796-4e8f-8b89-06a45f6c10c7"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%204%20CNC%20SHOPBOT.mp4?alt=media&token=3c414e53-662d-4187-9b19-61ecfa747970"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%205%20CNC%20SHOPBOT.mp4?alt=media&token=58b7987f-e107-4ce8-ac62-b7f2692b1edd"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%206%20CNC%20SHOPBOT.mp4?alt=media&token=e0cc1e46-804f-4bfa-bd5e-98c78a09b17f"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FStep%207%20CNC%20SHOPBOT.mp4?alt=media&token=ed45bb9a-2d20-40e7-a7ce-0c70634d0310"
    },
    //26

  ];
  //HOLEMAKING
  List<Map<String, String>> datamaking_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FHOLE%20DRILLING%2FSTEP--1(DRILLING)_%20CNC%20SHOPBOT_%20Incorporating%20loca.mp4?alt=media&token=e0954272-7e36-4ba2-b56e-e6629c191d52"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FHOLE%20DRILLING%2FSTEP-2(Drilling%20Toolpath)_%20CNC%20SHOPBOT-%20Creating%20T.mp4?alt=media&token=96c76326-4b96-4a87-95e3-fba9e118b6b0"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FHOLE%20DRILLING%2FSTEP-3(Drilling%20Toolpath)_%20CNC%20SHOPBOT_%20Saving%20Too.mp4?alt=media&token=36c872e6-2821-4ec7-8db5-9cc3bba55940"
    },
  ];
  //CUTTING AND ENGRAVING
  List<Map<String, String>> maintenance_videos = [
    {
      "title": "Overview",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201_CNC%20SHOPBOT-INTRODUCTION.mp4?alt=media&token=726169d9-5c75-49da-960b-7c2f9bfec633"
    },
    {
      "title": "Intro",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201_CNC%20SHOPBOT-INTRODUCTION1.mp4?alt=media&token=191aadb5-2045-407a-852e-e8d0fe560854"
    },
    {
      "title": "Step 1A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201A_%20CNC%20SHOPBOT-%20Data%20Making%20Adobe%20Illustrato.mp4?alt=media&token=bc204994-e47f-4ae5-b6bb-ff3d8ef95fe4"
    },
    {
      "title": "Step 1B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201B_%20CNC%20SHOPBOT-%20Choosing%20design%20in%20an%20Artboa.mp4?alt=media&token=f08ff652-4d3d-404f-be1e-584811e3502e"
    },
    {
      "title": "Step 1C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201C_%20CNC%20SHOPBOT-Layouting%20a%20design%20in%20an%20Artb.mp4?alt=media&token=5de9b7b6-c32c-4094-8482-9c900433b12a"
    },
    {
      "title": "Step 1D",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP%201D_%20CNC%20SHOPBOT-%20Choosing%20the%20desired%20file%20ex.mp4?alt=media&token=ea9c71b7-0f63-48e7-8980-5c79ecf4dabf"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-2_%20CNC%20SHOPBOT-%20Open%20a%20design%20with%20the%20VCarv%20.mp4?alt=media&token=7b711e3c-86e7-4362-ad04-5a55f515cd4b"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3_%20CNC%20SHOPBOT-Preparing%20Toolpath%20for%20Cutting.mp4?alt=media&token=1b0b7599-1f35-481a-99d1-9e768af0f849"
    },
    {
      "title": "Step 3A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3A_%20CNC%20SHOPBOT-Selecting%20designs%20Vectors.mp4?alt=media&token=95509ee9-b2c7-4ebe-b01a-ed6406b0c6c8"
    },
    {
      "title": "Step 3B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3B_%20CNC%20SHOPBOT-%20Clicking%20the%20Profile%20Toolpat.mp4?alt=media&token=598d9ae6-8c66-42bd-9972-f0b755032686"
    },
    {
      "title": "Step 3C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3C_%20CNC%20SHOPBOT-%20For%20Engraving%2C%20Clicking%20%20Poc.mp4?alt=media&token=06162cdc-9279-4f2e-96da-d1f98653600f"
    },
    {
      "title": "Step 3C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3C_%20CNC%20SHOPBOT-%20Input%20and%20Calculate.mp4?alt=media&token=0153572b-cef9-4524-9be2-e8950c00a22f"
    },
    {
      "title": "Step 3D",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3D_%20CNC%20SHOPBOT-%20Ignoring%20Duplicate%20Vectors%20a.mp4?alt=media&token=74a11d19-f256-473f-9551-03bda018c3af"
    },
    {
      "title": "Step 3E",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-3E_%20CNC%20SHOPBOT-%20PREVIEW%20TOOLPATH.mp4?alt=media&token=851c061a-3312-4981-ae89-b54b41230793"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FSHOPBOT%2FDATAMAKING%2FSTEP-4_%20CNC%20SHOPBOT-%20Saving%20Toolpath.mp4?alt=media&token=a39c495d-217f-4115-944e-eaf697fb7737"
    },
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
  ];
  //List for Data Making Buttons
  List<bool> dataMakingButtonStates = [
    false,
    false,
    false,

  ];
  //List for Maintenance Buttons
  List<bool> maintenanceButtonStates = [
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

  void _maintenancePlayVideo(String url, int index) {
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
  }



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
        title: const Text('CNC Shopbot Video Tutorial'),
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
                  Text('Holemaking', style: CustomTextStyle.boldHeader),
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

                  Divider(),
                  Text('Cutting and Engraving', style: CustomTextStyle.boldHeader),
                  Divider(),
                  SizedBox(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 4, // Adjust spacing between rows
                      children: maintenance_videos.asMap().entries.map((entry) {
                        int index = entry.key;
                        Map<String, String> video = entry.value;
                        return SizedBox(
                          width: 80,
                          height: 35,
                          child: TextButton(
                            style: maintenanceButtonStates[index]
                                ? pressedButtonStyle
                                : stepYellow,
                            onPressed: () =>
                                _maintenancePlayVideo(video["url"]!, index),
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
