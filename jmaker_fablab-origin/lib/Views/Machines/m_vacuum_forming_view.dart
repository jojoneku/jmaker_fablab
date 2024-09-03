import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/videotutorials/v_vaquform.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../styles/buttons.dart';

@RoutePage()
class MVacuumFormingView extends StatelessWidget {
  const MVacuumFormingView({super.key});

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
                child: Image.asset('assets/images/HD_Vaquform DT2.png'),
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
                          child: Image.asset('assets/images/Y_VAQUFORM.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vaquform DT2',
                              style: CustomTextStyle.bigTitle,
                            ),
                            Text(
                              'Vacuum Forming Machine',
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
                        "This machine utilizes a thermoforming process to create "
                        "plastic parts from a mold. It works by heating a plastic "
                        "sheet until pliable, then drawing the softened plastic over a "
                        "mold using a vacuum. Once formed, the plastic cools and retains "
                        "the mold's shape, resulting in precise and repeatable plastic components. "
                        "These machines are commonly used for prototyping, low-volume production "
                        "runs, and creating packaging for various industries.",
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
                                'assets/pdf/0P_VAQUFORM OPERATION_compressed.pdf',
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
                                'assets/pdf/MA_VAQUFORM MAINTENANCE_compressed.pdf',
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
                            builder: (context) => VideoTutorial_Vaquform(),
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
