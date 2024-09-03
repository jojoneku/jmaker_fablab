import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:video_player/video_player.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'dart:async';

class VideoTutorial_3DPrinter extends StatefulWidget {
  const VideoTutorial_3DPrinter({Key? key});

  @override
  State<VideoTutorial_3DPrinter> createState() =>
      _VideoTutorial_3DPrinterState();
}

class _VideoTutorial_3DPrinterState extends State<VideoTutorial_3DPrinter> {
  late VideoPlayerController _videoPlayerController;
  late Timer _hideButtonTimer;
  bool _showPlayPauseButton = true;

  List<Map<String, String>> operational_videos = [
    {
      "title": "Intro",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FINTRODUCTION_%20ULTIMAKER%20S5%203D%20PRINTER.mov?alt=media&token=9a2d4787-3e9c-4e8c-ac23-592619b00194"
    },
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Wiping%20glass%20plate%20before%20printing.mov?alt=media&token=7b8c472b-3119-4432-b2bc-28038c327b9b"
    },
    {
      "title": "Step 1.1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.1_CAUTION%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Making%20sure%20that%20the%20build%20plate%20has%20cooled%20down.mov?alt=media&token=c13d144d-b1b0-4dab-b412-5212ad384663"
    },
    {
      "title": "Step 1.A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.A%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Removing%20build%20plate%20clamps.mov?alt=media&token=c3a7fd62-d040-464d-8c05-19e7fca1cdf1"
    },
    {
      "title": "Step 1.B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.B%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Removing%20glass%20plate%20from%20machine.mov?alt=media&token=b8dae066-c460-4196-b602-6f869fb56f6d"
    },
    {
      "title": "Step 1.C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.C%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Preparing%20a%20dry%2C%20clean%20towel%20or%20piece%20of%20tissue%20paper.mov?alt=media&token=0bd37a68-f0c8-4b80-b2ad-195805081fa0"
    },
    {
      "title": "Step 1.D",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.D%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Using%20alcohol%20to%20gently%20clean%20glass.mov?alt=media&token=d7877384-e7d1-4f41-aa64-74a3bd09cb4c"
    },
    {
      "title": "Step 1.E",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%201.D%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Clean%20Glass%20Plate)%20-%20Using%20alcohol%20to%20gently%20clean%20glass.mov?alt=media&token=d7877384-e7d1-4f41-aa64-74a3bd09cb4c"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%202%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Plugging%20in%20the%20machine%20to%20the%20outlet.mov?alt=media&token=ebfd0dfe-f894-469f-b253-c83046b81297"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%203%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Turning%20on%20the%20machine%20.mov?alt=media&token=31550cd6-4b0a-4756-91b2-3854c61c8847"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%204%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Unloading%20previous%20filament%20material(1).mov?alt=media&token=679fd691-981d-4313-94b5-ce4821932fd6"
    },
    {
      "title": "Step 4.A",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%204.A%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Unload%20the%20Filament)%20-%20Pressing%20Unload.mov?alt=media&token=98a564c5-383a-4406-9f06-d759b8d38ce3"
    },
    {
      "title": "Step 4.B",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%204.B%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Unload%20the%20Filament)%20-%20Pressing%20_confirm_%20to%20remove%20spool.mov?alt=media&token=540ee8bb-6200-4fa8-aa21-d5a13685d75e"
    },
    {
      "title": "Step 4.C",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%204.D%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Unload%20the%20Filament)%20-%20Removing%20previous%20spool.mov?alt=media&token=9b4f95bb-30a2-4910-9525-64ac73bebf3c"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Loading%20new%20selected%20filament%20material.mov?alt=media&token=a7485a03-cd80-427a-b0db-9d1e6640ab0a"
    },
    {
      "title": "Step 5.D",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.E%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Placing%20new%20material%20spool.mov?alt=media&token=322d55b3-adb0-4510-8474-c5a280ebf922"
    },
    {
      "title": "Step 5.E",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.F%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Sharpening%20the%20filament%20with%20pliers.mov?alt=media&token=d0e996b0-7c50-439c-b698-46412ea4a5e1"
    },
    {
      "title": "Step 5.F",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.G%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Inserting%20filament%20into%20feeder%201.mov?alt=media&token=388e161b-56b3-4392-b6c9-1c1e81e82b30"
    },
    {
      "title": "Step 5.G",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.H%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_load_%20in%20the%20screen.mov?alt=media&token=c587015a-d7e2-4de9-a34e-a793faf29d69"
    },
    {
      "title": "Step 5.H",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.I%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_confirm_%20to%20place%20new%20spool.mov?alt=media&token=4ec2dd75-fe79-4b9e-b09b-aba5709c0b0f"
    },
    {
      "title": "Step 5.I",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.J%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_confirm_%20to%20verify%20selected%20material.mov?alt=media&token=3bb78ffe-751a-407d-9e66-dcd1f29638ca"
    },
    {
      "title": "Step 5.J",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.K%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_confirm_%20when%20done%20inserting%20material.mov?alt=media&token=730131ac-a914-489f-91b9-7be427990eb3"
    },
    {
      "title": "Step 5.K",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.K%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_confirm_%20when%20done%20inserting%20material.mov?alt=media&token=730131ac-a914-489f-91b9-7be427990eb3"
    },
    {
      "title": "Step 5.L",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.L%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Pressing%20_confirm_%20after%20material%20extrusion.mov?alt=media&token=aefd129d-14a1-4971-bcc0-7dd45f7a22d3"
    },
    {
      "title": "Step 5.M",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%205.M%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20(How%20to%20Load%20the%20Filament)%20-%20Taking%20out%20excess%20material_.mov?alt=media&token=69447aec-ff07-4630-b533-d45dfb924a55"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%206%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Inserting%20flash%20drive%20to%203D%20printer.mov?alt=media&token=2f7489dc-6bec-4f04-bba7-8d54016b561b"
    },
    {
      "title": "Step 7",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%207%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Pressing%20_%20Select%20from%20USB_%20to%20select%20file.mov?alt=media&token=0b4dde2f-bae0-43be-98f7-ca7fcaf867e5"
    },
    {
      "title": "Step 8",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%208%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Pressing%20_%20Start%20Print_.mov?alt=media&token=5c9280c5-1cbc-4a13-a63c-9a707ddf083a"
    },
    {
      "title": "Step 9",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%209%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20You%20can%20leave%20machine%20until%20print%20is%20finish.mov?alt=media&token=6e8e57e5-fcdb-43c8-b97f-7afc17eb9047"
    },
    {
      "title": "Step 10",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%2010%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Pressing%20_confirm%20removal_%20and%20allowing%20machine%20to%20cool%20down.mov?alt=media&token=d15998a6-3a99-4f94-8e1b-d866f6811613"
    },
    {
      "title": "Step 11",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%2011%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Taking%20out%20object%20using%20spatula.mov?alt=media&token=3f3a807b-e6e2-4be2-82e5-f22f65b4e776"
    },
    {
      "title": "Step 12",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%2012%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Closing%20window%20and%20ejecting%20flash%20drive.mov?alt=media&token=d7176184-5603-469a-99e4-2653833e2b6f"
    },
    {
      "title": "Step 13",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%2013%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Turning%20off%20the%20machine.mov?alt=media&token=58c31884-aedf-4c05-8cc4-fbb533319b05"
    },
    {
      "title": "Step 14",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FSTEP%2014%20_%203D%20PRINTER%20ULTIMAKER%20S5%20OPERATION%20MANUAL%20-%20Unplugging%20the%20power.mov?alt=media&token=f33b0597-b712-4daa-8547-a4a506f7b6f6"
    },
    //34
  ];
  List<Map<String, String>> datamaking_videos = [
    {
      "title": "Step 1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%201%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Creating%20a%203D%20model%20using%20Autodesk%20123D..mov?alt=media&token=09955b6f-894c-4ece-ad97-006364a707ff"
    },
    {
      "title": "Step 2",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%202%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Downloading%20the%20latest%20version%20of%20Cura.mov?alt=media&token=3c8c3a72-74a7-41eb-84f5-746961b59158"
    },
    {
      "title": "Step 3",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%203%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Opening%20.stl%20file%20onto%20desktop.mov?alt=media&token=07365ad6-b156-497d-95cf-2f0cf20cc4d3"
    },
    {
      "title": "Step 4",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%204%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Choosing%20Extruder%201..mov?alt=media&token=a00fa0ea-27ea-4d86-a19e-936b6f434a86"
    },
    {
      "title": "Step 4.1",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%204.1_NOTE%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Adjusting%20layer%20height%20and%20infill%20both%20extruders.mov?alt=media&token=e1eca288-f234-4104-b0fc-68ba1fac7297"
    },
    {
      "title": "Step 5",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%205%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Converting%20.stl%20into%20.ufp%20format.mov?alt=media&token=10f50310-30a5-447c-8c8a-8d906482ff72"
    },
    {
      "title": "Step 6",
      "url":
      "https://firebasestorage.googleapis.com/v0/b/fablab-jmakers.appspot.com/o/VIDEO%20TUTORIALS%2FULTIMAKER%2FDATAMAKING%2FSTEP%206%20_%203D%20PRINTER%20ULTIMAKER%20S5%20-%20Saving%20file%20to%20flashdrive.mov?alt=media&token=3ee68f34-9a62-4ed1-bca2-97b0a32e7715"
    },
    //7

  ];
  List<Map<String, String>> maintenance_videos = [];

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
  ];// Initialize based on the number of videos
  //List for Data Making Buttons
  List<bool> dataMakingButtonStates = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  //List for Maintenance Buttons
  List<bool> maintenanceButtonStates = [];
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
        title: Text('3D Printer Video Tutorial'),
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
