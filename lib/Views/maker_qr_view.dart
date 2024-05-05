import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class MakerQRView extends StatefulWidget {
  const MakerQRView({
    super.key,
    required this.data,
    required this.name,
  });

  final String data;
  final String name;

  @override
  State<MakerQRView> createState() => _MakerQRViewState();
}

class _MakerQRViewState extends State<MakerQRView> {
  final GlobalKey _qrKey = GlobalKey();

  bool isChecked = false;

  Future<void> _downloadQrCode() async {
    try {
      RenderRepaintBoundary boundary = _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage();
      final whitePaint = Paint()..color = Colors.white;
      final recorder = PictureRecorder();
      final canvas = Canvas(
        recorder,
        Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()),
      );

      canvas.drawRect(Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), whitePaint);
      canvas.drawImage(image, Offset.zero, Paint());

      final picture = recorder.endRecording();
      final toSaveImage = await picture.toImage(image.width, image.height);
      ByteData? byteData = await toSaveImage.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final file = await File('/storage/emulated/0/Download/my_qr.png').create(); //* add to constants later
      await file.writeAsBytes(pngBytes);

      if (!mounted) return;
      SnackBarController.clearSnackbars(context);
      SnackBarController.showSnackBar(context, 'QR Code has been downloaded successfully.');
    } catch (e) {
      print(e);
      if (!mounted) return;
      SnackBarController.clearSnackbars(context);
      SnackBarController.showSnackBar(context, 'We are unable to download your QR Code. Please try again later');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Congratulations!',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            "You've successfully created your account!",
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 32),
              RepaintBoundary(
                key: _qrKey,
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    color: whiteBG,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'assets/images/JMAKER png-03.png',
                          height: 24,
                        ),
                      ),
                      Expanded(
                        child: QrImageView(
                          data: widget.data,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.name,
                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        'Maker',
                        style: CustomTextStyle.primaryBlack,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Generated QR Code',
                style: CustomTextStyle.boldHeader,
              ),
              const Expanded(
                  child: SizedBox(
                height: double.infinity,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: _downloadQrCode,
                    icon: const Icon(
                      Icons.download,
                      color: blackGreen,
                    ),
                    label: Text(
                      'Download',
                      style: CustomTextStyle.primaryBlack,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                child: ElevatedButton(
                  style: longwhite,
                  onPressed: () => context.router.replaceAll([const LoginRoute()]), //attach navigation
                  child: Text(
                    'Log In',
                    style: CustomTextStyle.primaryBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
