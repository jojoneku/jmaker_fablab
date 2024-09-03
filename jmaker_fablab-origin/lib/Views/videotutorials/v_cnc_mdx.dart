import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_CNCMilling extends StatefulWidget {
  const VideoTutorial_CNCMilling({Key? key});

  @override
  State<VideoTutorial_CNCMilling> createState() =>
      _VideoTutorial_CNCMillingState();
}

class _VideoTutorial_CNCMillingState extends State<VideoTutorial_CNCMilling> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Intro ",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FCNC%20MDX%20INTRODUCTION.mp4?alt=media&token=ca1243b8-e5a8-4f0e-a29c-054e75797558"
    },
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%201%20_%20Preparing%20Design.mov?alt=media&token=a5979ba8-f1d1-49d6-9cdc-73c1d8ff0dee"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%202%20_%20OPEN%20%20Vectric%20_%20VCarve%20Desktop.%20%E2%80%98CLICK%E2%80%99%20create%20new%20file.mov?alt=media&token=1e9bafd3-e664-4666-bffe-941c532b98c6"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%203%20_%20Save%20file%2C%20convert%20the%20program%20to%20a%20text%20file%2C%20then%20save%20it%20on%20the%20computer.%20This%20file%20is%20called%20the%20_output%20file.mov?alt=media&token=a3d270cf-f3c3-4b6b-971b-6a3993af36dd"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%204%20_%20Switch%20the%20main%20power%20on.mov?alt=media&token=77ee12aa-1c30-4f01-a25f-c589f3b1e811"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%205%20_%20After%20lighted%20the%20power%20light%2C%20%E2%80%98PRESS%E2%80%99%20the%20sub"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%206%20_%20After%20lighted%20modeling%20light%2C%20connect%20USB%2C%20to%20PC.mov?alt=media&token=dc252bfe-7f62-4c23-992e-353645d25f10"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%207%20_%20OPEN%20the%20front%20cover.mov?alt=media&token=95f2895c-83f7-4c47-938d-ddfd501d686a"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%208%20_%20Put%20materials%20on%20the%20workpiece%20table.mov?alt=media&token=6b665cd2-7a2c-467e-99fd-25f5110392ca"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%209%20_%20Prepare%20tools%20to%20be%20used%20for%20cutting%20_%20engraving%20_%203D%20Milling.mov?alt=media&token=5e323766-434a-4a1f-95d4-2c24dad0f43f"
    },
    {
      "title": "Step 10",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2010%20_%20Tighten%20the%20collet.mov?alt=media&token=f83e6b70-4d1a-4f29-a5db-6f88fba1a5a7"
    },
    {
      "title": "Step 11",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2011%20_%20Move%20spindle%20head%20using%20XY%20button.%20Afterward%2C%20%E2%80%98CLICK%E2%80%99%20apply.mov?alt=media&token=c91332dd-590d-4a1e-b56a-787c361da07d"
    },
    {
      "title": "Step 12",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2012%20_%20Put%20Z%200%20sensor%20on%20top%20of%20the%20material.mov?alt=media&token=fd57ba4e-17ca-4cba-a9f2-b00b615e7027"
    },
    {
      "title": "Step 13",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2013%20_%20%20%E2%80%98SELECT%E2%80%99%20%E2%80%9Cset%20Z%20origin%20using%20sensor%E2%80%9D.%20%E2%80%98PRESS%E2%80%99%20detect%2C%20set%20Z%20axis%20origin%20using%20sensor.%20%20NOTE_%20It%20is%20optional%20for%20you%20to%20manually%20set%20the%20origins%20without%20using%20the%20%E2%80%9CZ%20origin%20sensor%E2%80%9D.mov?alt=media&token=d0fd27a9-5e45-445e-8c03-0a1dac51a16a"
    },
    {
      "title": "Step 14",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2014%20_%20Close%20the%20front%20cover.mov?alt=media&token=83cf2425-279d-4d82-92c5-4c7b1166dca3"
    },
    {
      "title": "Step 15-16",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2015%20-%2016%20_%20%E2%80%98PRESS%E2%80%99%20Cut%20button.mov?alt=media&token=a58df956-2396-445c-a2f2-e324248d2757"
    },
    {
      "title": "Step 17",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2017%20_%20Cutting.mov?alt=media&token=79ded89d-0a2d-450c-a3a6-6916370f4f9a"
    },
    {
      "title": "Step 18",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2018%20_%20Turning%20off%20the%20machine.mov?alt=media&token=6f3d1a6a-6eed-4f08-92ad-dc6a768109bd"
    },
    {
      "title": "Step 19",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FCNC%20MDX%2FSTEP%2019%20_%20Cleaning%20the%20machine.mov?alt=media&token=289d5504-69f5-4ae2-bf87-5e2b34fe5a26"
    },
    //19
  ];

  List<Map<String, String>> datamaking_videos = [];

  List<Map<String, String>> maintenance_videos = [];

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
        title: const Text('CNC Milling Video Tutorial'),
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
