import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_ULSLaser extends StatefulWidget {
  const VideoTutorial_ULSLaser({Key? key});

  @override
  State<VideoTutorial_ULSLaser> createState() =>
      _VideoTutorial_ULSLaserState();
}

class _VideoTutorial_ULSLaserState extends State<VideoTutorial_ULSLaser> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%201%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Opening%20ULS%20Software.mp4?alt=media&token=c05b96e8-4b66-469a-bbe3-d923c249a001"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%202%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Plugging%20on%20the%20exhaust%20fan%20machine_.mov?alt=media&token=7936b59f-d8e2-4433-95e2-c72f7a7c5a17"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%203%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Turning%20on%20the%20ULS%20machine%20via%20power%20button%20of%20the%20machine%20or%20via%20the%20ULS%20software_.mov?alt=media&token=d34674ab-0688-4312-8f47-2f8be18cd2b9"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%204%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Opening%20the%20upper%20glass%20door%20of%20the%20machine%20to%20set%20the%20material_.mov?alt=media&token=bcaac7ea-0e13-4f62-9971-aead705dee66"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%205%20_%20%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20%20Opening%20the%20machine%20door_.mov?alt=media&token=7e346d73-3549-46a4-a086-7825462c78f6"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%206%20_%20%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Placing%20the%20honeycomb_.mov?alt=media&token=53ec0864-df96-465e-a989-15c42db6618b"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%207%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Closing%20the%20machine%20door_.mov?alt=media&token=89b44114-a133-4153-acae-32692f643ddd"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%208%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Placing%20the%20material_.mp4?alt=media&token=7309872a-e44c-45a8-95b4-c256c4eea982"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%209%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Moving%20the%20laser%20head%20to%20the%20material.mp4?alt=media&token=4f0ca9fe-54fd-49ed-8e23-539fcf1b3b08"
    },
    {
      "title": "Step 10",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%2010%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Using%20the%20_Z%20axis_%20tool_.mov?alt=media&token=df90075c-b746-4bd8-8347-ae706c08dce2"
    },
    {
      "title": "Step 11",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%2011%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Removing%20the%20_Z%20axis_%20tool_.mp4?alt=media&token=49b4ce2f-ded4-4a7d-a74f-6ad6786b03d4"
    },
    {
      "title": "Step 12",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%2012%20_%20%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Returning%20the%20laser%20head%20into%20its%20original%20placement%2C%20on%20the%20upper%20right%20corner%20of%20the%20machine_.mov?alt=media&token=56fd4574-7dfb-4b85-b7f8-4092fa394954"
    },
    {
      "title": "Step 13",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULS%20LASER%2FSTEP%2013%20_%20UNIVERSAL%20LASER%20SYSTEMS%20VS6.60%20-%20Closing%20the%20upper%20glass%20door%20of%20the%20machine_.mov?alt=media&token=d49d8392-0bd9-40e1-b7e3-05b55ae008bf"
    },
    //13
  ];

  List<Map<String, String>> datamaking_videos = [

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
        title: Text('ULS Laser Machine Video Tutorial'),
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
