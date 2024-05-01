import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import '../../styles/buttons.dart';

class F3DScanner extends StatelessWidget {
  const F3DScanner({super.key});

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
            size: 24,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200, // Define the height for the image
              child: Image.asset('assets/images/HD_Shining 3D Einscan SP Scanner.png'),
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
                          Container(
                            width: 100,
                            height: 80,
                            child: Image.asset('assets/images/Y_SCANNER.png'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shining 3D Einscan SP',
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
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 24),
                                child: Container(
                                  width: double.infinity,
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
                          onPressed: (){
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
                            onPressed: (){
                              //add pdf viewer
                            }
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
                        child: MachineButton(
                            icon: Icons.video_settings,
                            title: 'Video Tutorials',
                            subtitle: 'Visual Learner? Learn from awesome \n'
                                'video tutorials!',
                            onPressed: (){
                              //add pdf viewer
                            }
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}