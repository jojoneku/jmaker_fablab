import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Controller/snackbar_controller.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/Utils/encryt_utils.dart';
import 'package:jmaker_fablab/Views/internet_connection_checker.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

@RoutePage()
class QRView extends StatefulWidget {
  const QRView({super.key});

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  final GlobalKey _qrKey = GlobalKey();

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
      if (!mounted) return;
      SnackBarController.clearSnackbars(context);
      SnackBarController.showSnackBar(context, 'We are unable to download your QR Code. Please try again later');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InternetConnectionChecker(
      child: (_) => Scaffold(
        backgroundColor: mainYellow,
        body: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: Hive.box('userData').listenable(),
            builder: (context, value, child) {
              if (value.isEmpty || !value.isOpen) {
                return const SizedBox.shrink();
              }

              final userData = value.values.first;

              String? qrData;

              if (userData is StudentModel || userData is MakerModel) {
                final encodedModel = jsonEncode(userData);
                final encrypted = EncryptUtils.encrypt(userData.uid, encodedModel);
                qrData = '${userData.uid}${encrypted.base64}';
              }

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                                data: qrData ?? '',
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              userData is StudentModel
                                  ? userData.fullName
                                  : userData is MakerModel
                                      ? userData.fullName
                                      : '',
                              style: CustomTextStyle.primaryBlack,
                            ),
                            Text(
                              userData is StudentModel ? 'Student' : 'Maker',
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
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
