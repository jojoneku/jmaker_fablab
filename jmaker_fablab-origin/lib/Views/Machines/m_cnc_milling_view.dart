import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../styles/buttons.dart';
import '../videotutorials/v_cnc_mdx.dart';

@RoutePage()
class MCNCMillingView extends StatelessWidget {
  const MCNCMillingView({super.key});

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
                height: 230, // Define the height for the image
                child: Image.asset('assets/images/HD_MDX 40A.jpg'),
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
                          child: Image.asset('assets/images/Y_CNC.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Roland MDX-40A',
                              style: CustomTextStyle.bigTitle,
                            ),
                            Text(
                              'CNC Milling Machine',
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
                        'The Roland MDX-40A is a compact and user-friendly desktop '
                        'CNC milling machine. It allows designers, engineers, and '
                        'students to create precision 3D models and prototypes '
                        'from various non-proprietary materials like plastic, resin,'
                        ' and wood. Its small footprint makes it ideal for workshops, '
                        'classrooms, and even offices.',
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
                                'assets/pdf/0P_MDX_OPERATION_compressed.pdf',
                              ),
                            ),
                          );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/DM_Copy of MDX_DATA MAKING_compressed.pdf',
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
                        icon: Icons.miscellaneous_services_outlined,
                        title: 'Maintenance Manual',
                        subtitle: 'Learn how to maintain the machine.',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/MA_MDX_MAINTENANCE_compressed.pdf',
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
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) => VideoTutorial_CNCMilling(),
                          ),
                          );
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
