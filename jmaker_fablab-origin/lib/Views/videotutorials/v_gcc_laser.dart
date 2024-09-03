import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_GCCLaser extends StatefulWidget {
  const VideoTutorial_GCCLaser({Key? key});

  @override
  State<VideoTutorial_GCCLaser> createState() =>
      _VideoTutorial_GCCLaserState();
}

class _VideoTutorial_GCCLaserState extends State<VideoTutorial_GCCLaser> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%201.mp4?alt=media&token=45c79916-03aa-41da-9ed0-17c56711a8a5"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%202.mp4?alt=media&token=e72b58aa-b095-4562-815b-c01def058a55"
    },
    {
      "title": "Step 3-Note",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%203%20NOTE.mp4?alt=media&token=5d58d2d8-66a5-43cb-a340-0515e06faa4a"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%203.mp4?alt=media&token=36776c57-324e-4d80-977c-e27ea2e1648a"
    },
    {
      "title": "Step 4 & 4A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%204%20%26%204A.mp4?alt=media&token=739607bb-10f6-4975-b104-d57489aeb771"
    },
    {
      "title": "Step 4B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%204B.mp4?alt=media&token=298e370f-3397-4155-b1f9-369dc41d43bf"
    },
    {
      "title": "Step 4C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%204NOTE.mp4?alt=media&token=1508988c-704e-4a29-b2e2-200a9650719d"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%205.mp4?alt=media&token=8d4864dc-d148-4851-8206-bc959fa4f1e1"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%206.mp4?alt=media&token=0b0ca665-ccfe-47d6-9ee0-4bab19b8a6e6"
    },
    {
      "title": "Step 6A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%206A.mp4?alt=media&token=a2e2902a-6ea9-4ecc-b9ac-ce720d3466e3"
    },
    {
      "title": "Step 6B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%206B.mp4?alt=media&token=cc0d07fb-4200-4f9f-ae50-23e338373f9d"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%207.mp4?alt=media&token=cbd05747-cdaf-4c0d-9fcb-710c62125254"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FGCC%20LASER%2FSTEP%208.mp4?alt=media&token=9e01cd90-2cf4-4c8b-90e0-1f7d28558c2b"
    },

  ];

  List<Map<String, String>> datamaking_videos = [
    {

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

  // void _dataMakingPlayVideo(String url, int index) {
  //   setState(() {
  //     for (int i = 0; i < dataMakingButtonStates.length; i++) {
  //       dataMakingButtonStates[i] = i == index;
  //     }
  //     for (int j = 0; j < operationalButtonStates.length; j++) {
  //       operationalButtonStates[j] = false;
  //     }
  //     for (int k = 0; k < maintenanceButtonStates.length; k++) {
  //       maintenanceButtonStates[k] = false;
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
  //
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
        title: Text('GCC Laser Machine Video Tutorial'),
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

                  // Divider(),
                  // Text('Datamaking Video Tutorials', style: CustomTextStyle.boldHeader),
                  // Divider(),
                  // SizedBox(
                  //   child: Wrap(
                  //     spacing: 16,
                  //     runSpacing: 4, // Adjust spacing between rows
                  //     children: datamaking_videos.asMap().entries.map((entry) {
                  //       int index = entry.key;
                  //       Map<String, String> video = entry.value;
                  //       return SizedBox(
                  //         width: 80,
                  //         height: 35,
                  //         child: TextButton(
                  //           style: dataMakingButtonStates[index]
                  //               ? pressedButtonStyle
                  //               : stepYellow,
                  //           onPressed: () =>
                  //               _dataMakingPlayVideo(video["url"]!, index),
                  //           child: Center(
                  //             child: Text(
                  //               video["title"]!,
                  //               softWrap: true,
                  //               textAlign: TextAlign.center,
                  //               maxLines: 2,
                  //               style: CustomTextStyle.stepText,
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
