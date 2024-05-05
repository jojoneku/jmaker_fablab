import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../styles/buttons.dart';

@RoutePage()
class MEmbroideryView extends StatelessWidget {
  const MEmbroideryView({super.key});

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
                height: 250, // Define the height for the image
                child: Image.asset('assets/images/HD_Brother PR1000 10-Needle Embroidery Machine.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        const Divider(),
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              height: 60,
                              child: Image.asset('assets/images/Y_EMBROIDERY.png'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Brother PR1000e',
                                  style: CustomTextStyle.bigTitle,
                                ),
                                Text(
                                  'Embroidery Machine',
                                  style: CustomTextStyle.secondaryGrey,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0, left: 24),
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'The Brother PR1000e is a 10-needle embroidery machine for detailed, '
                                  'multi-colored designs.  Automatic features and built-in designs '
                                  'make it ideal for both hobbyists and professionals. Its advanced '
                                  'features include automatic needle threading, innovative camera '
                                  'technology for precise needle positioning, and built-in designs '
                                  'for added versatility.',
                                  style: CustomTextStyle.secondaryGrey,
                                ),
                              ),
                            ),
                          ),
                        ]),
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
                                    'assets/pdf/0P_EMBROIDER_OPERATIONAL_compressed.pdf',
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
                                      'assets/pdf/DM_EMBROIDERY-DATA MAKING LAYOUT_compressed.pdf',
                                    ),
                                  ),
                                );
                                //add pdf viewer
                              }),
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
                                      'assets/pdf/MA_EMBROIDERY-MAINTENANCE LAYOUT_compressed.pdf',
                                    ),
                                  ),
                                );
                                //add pdf viewer
                              }),
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
                              }),
                        )
                      ],
                    ),
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
