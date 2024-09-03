import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../styles/buttons.dart';
import '../videotutorials/v_cnc_shopbot_view (1).dart';

@RoutePage()
class MCNCShopbotView extends StatelessWidget {
  const MCNCShopbotView({super.key});

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
                height: 215, // Define the height for the image
                child: Image.asset('assets/images/HD_ShopBot PRSstandard.png'),
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
                          child: Image.asset('assets/images/Y_SHOPBOT.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PRSalpha CNC',
                              style: CustomTextStyle.bigTitle,
                            ),
                            Text(
                              'Large CNC Milling Machine',
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
                        'This industrial-grade CNC router boasts high-speed capabilities and robust construction. '
                        'Featuring a gantry-style design with tough precision linear bearings and hardened steel'
                        'rails, it ensures stability and accuracy for demanding tasks.  The powerful HSD spindle '
                        'and closed-loop alphaStep motors deliver fast and precise material cutting across various '
                        'applications in wood, plastic, aluminum, and other materials.',
                        style: CustomTextStyle.secondaryGrey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                      child: BigMachineButton(
                        icon: Icons.file_copy_outlined,
                        title: 'Operation & Basic Maintenance'
                            '\nManual',
                        subtitle: 'This comprehensive manual provides \n'
                            'everything you need to get started.',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/shopbot_maintenance_operation.pdf',
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SfPdfViewer.asset(
                                'assets/pdf/DM_DATA.MAKING_CNC.SHOPBOT-2_compressed.pdf',
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
                            builder: (context) => VideoTutorial_CNCShopbot(),
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
