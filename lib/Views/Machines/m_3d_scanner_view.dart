import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../styles/buttons.dart';

@RoutePage()
class M3DScannerView extends StatelessWidget {
  const M3DScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_outlined,
            color: blackGreen,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200, // Define the height for the image
                child: Image.asset('assets/images/HD_Shining 3D Einscan SP Scanner.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: Image.asset('assets/images/Y_SCANNER.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Einscan - SP V2',
                              style: CustomTextStyle.bigTitle,
                            ),
                            Text(
                              '3D Scanning Machine',
                              style: CustomTextStyle.secondaryGrey,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 24),
                      child: Text(
                        'This desktop 3D scanner utilizes structured light '
                        'technology for high-precision object capture. '
                        'It employs a dual-camera system alongside a projector '
                        'to capture detailed scans of various object sizes and '
                        'textures. The EinScan SP features user-friendly software, '
                        'making it suitable for professionals in product design, '
                        'quality control, and reverse engineering who require '
                        'accurate digital representations of physical objects.',
                        style: CustomTextStyle.secondaryGrey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: MachineButton(
                        icon: Icons.file_copy_outlined,
                        title: 'Operation Manual',
                        subtitle: 'This comprehensive manual provides \n'
                            'everything you need to get started.',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/0P_3D-SCANNER-OPERATION-_compressed.pdf',
                              ),
                            ),
                          );
                          //add pdf viewer
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: MachineButton(
                        icon: Icons.data_saver_on,
                        title: 'Data Making',
                        subtitle: 'Learn how to create the data'
                            ' your machine \nneeds to operate.',
                        onPressed: () {
                          context.router.push(const NoContentRoute());
                          //add pdf viewer
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: MachineButton(
                        icon: Icons.miscellaneous_services_outlined,
                        title: 'Maintenance Manual',
                        subtitle: 'Learn how to maintain the machine.',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/MA_MAINTENACE-3D SCANNER_compressed.pdf',
                              ),
                            ),
                          );
                          //add pdf viewer
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: MachineButton(
                        icon: Icons.video_settings,
                        title: 'Video Tutorials',
                        subtitle: 'Visual Learner? Learn from awesome \n'
                            'video tutorials!',
                        onPressed: () {
                          //add pdf viewer
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
