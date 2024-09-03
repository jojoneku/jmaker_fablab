import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_3DScanner extends StatefulWidget {
  const VideoTutorial_3DScanner({Key? key});

  @override
  State<VideoTutorial_3DScanner> createState() =>
      _VideoTutorial_3DScannerState();
}

class _VideoTutorial_3DScannerState extends State<VideoTutorial_3DScanner> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;


  List<Map<String, String>> operational_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%201%20machine%20operation.MOV?alt=media&token=c735dfd9-f46f-45ee-b4f3-cbbe2f332dc1"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%202%20machine%20operation.MOV?alt=media&token=0824cd3a-8809-4471-abf3-233b498fd806"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%203%20machine%20operation.MOV?alt=media&token=c5838403-e4ab-46e5-bf62-69078ec0227e"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%204%20machine%20operation.MOV?alt=media&token=2c5ba24a-073b-48dc-a608-d966d0d4a521"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%205%20machine%20operation.MOV?alt=media&token=3e15d51d-a509-4276-ab55-ebaddb0186a6"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FSTEP%206%20machine%20operation.MOV?alt=media&token=59bc4e89-c8c0-4061-8d55-2e1a88f7f7ca"
    },
    //6
  ];

  List<Map<String, String>> datamaking_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%201_%20Build%20Project_datamaking.mp4?alt=media&token=40e13860-c6f7-4164-9d9e-3118d6c0ba96"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%202_%20texture%20scan%20option_datamaking.mp4?alt=media&token=81c4ea17-66f7-45c3-88e9-9f69e4cf1b70"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%203_%20Adjust%20brightness_datamaking.mp4?alt=media&token=a469b79c-036a-48fc-9357-6867cc7880c9"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%204_%20Turntable_datamaking.mp4?alt=media&token=20c7f0ca-7a5c-4eca-8d5e-234dee206552"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%205_%20Scan_datamaking.mp4?alt=media&token=445665cc-c746-4263-abf9-9385d42b13ad"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%206_%20Edit%20scan_datamaking.mp4?alt=media&token=08c05052-06b1-4114-b83c-64ca8beca8e2"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%207_%20Project%20Group_datamaking.mp4?alt=media&token=d4c071be-adc5-457e-a3ce-0cbe362f3864"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%208_%20Manual%20alignment_datamaking.mp4?alt=media&token=e5cbdcd4-db10-4271-bfc9-9a2781e4923a"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FEINSCAN%20SCANNER%2FT_STEP%209_%20Mesh_datamaking.mp4?alt=media&token=c6e7cfe1-9e55-412c-83f8-c7a0adfd1858"
    },
    //9
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
        title: Text('3D Scanner Video Tutorial'),
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
