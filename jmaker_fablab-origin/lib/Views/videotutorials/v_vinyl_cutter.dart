import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_VinylCutter extends StatefulWidget {
  const VideoTutorial_VinylCutter({Key? key});

  @override
  State<VideoTutorial_VinylCutter> createState() =>
      _VideoTutorial_VinylCutterState();
}

class _VideoTutorial_VinylCutterState extends State<VideoTutorial_VinylCutter> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FMACHINE%20OPERATION%20STEP1.mp4?alt=media&token=40cea211-683a-44ab-b003-33779267932d"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FMACHINE%20OPERATION%20STEP2.mp4?alt=media&token=a430cc6e-930b-4693-9065-204c74e9ac4e"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FMACHINE%20OPERATION%20STEP3.mp4?alt=media&token=b79c4070-bd61-4675-94f2-61831c5b4907"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FMACHINE%20OPERATION%20STEP4.mp4?alt=media&token=e061cd52-a2e9-4c62-9900-e5733183e174"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FMACHINE%20OPERATION%20STEP5.mp4?alt=media&token=53072cad-5d31-4fcb-ac64-7b6eecee6fd8"
    },

  ];

  List<Map<String, String>> datamaking_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FDATAMAKING%2FDATA%20MAKING%20STEP1.mp4?alt=media&token=32347b18-7eaa-4772-88cf-daae5922698e"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FDATAMAKING%2FDATA%20MAKING%20STEP2.mp4?alt=media&token=a937dd2e-9e58-4962-81c0-61d14063cfaa"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FDATAMAKING%2FDATA%20MAKING%20STEP3.mp4?alt=media&token=a7cdebd7-ccd1-4283-9047-e94bfd8e3333"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FDATAMAKING%2FDATA%20MAKING%20STEP4.mp4?alt=media&token=b8a7abec-d967-4549-bf0c-a345a1a06b24"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FVINYL%20CUTTER%2FDATAMAKING%2FDATA%20MAKING%20STEP5.mp4?alt=media&token=38f7fcbc-0775-4c42-b3a8-b71ebff410ae"
    },

  ];

  List<Map<String, String>> maintenance_videos = [

  ];

  //List for Operational Videos
  List<bool> operationalButtonStates = [
    true,
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

  // void _maintenancePlayVideo(String url, int index) {
  //   setState(() {
  //     for (int i = 0; i < maintenanceButtonStates.length; i++) {
  //       maintenanceButtonStates[i] = i == index;
  //     }
  //     for (int j = 0; j < operationalButtonStates.length; j++) {
  //       operationalButtonStates[j] = false;
  //     }
  //     for (int k = 0; k < dataMakingButtonStates.length; k++) {
  //       dataMakingButtonStates[k] = false;
  //     }
  //   });
  //   _videoPlayerController.pause();
  //   _videoPlayerController = VideoPlayerController.network(url)
  //     ..initialize().then((_) {
  //       setState(() {});
  //       _videoPlayerController.play();
  //       _startHideButtonTimer(delay: const Duration(seconds: 3));
  //     });
  // }



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
        title: Text('Vinyl Cutter Video Tutorial'),
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
