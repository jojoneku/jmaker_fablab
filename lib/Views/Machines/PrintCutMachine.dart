import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import '../../styles/buttons.dart';

class PrintCut extends StatelessWidget {
  const PrintCut({super.key});

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
              child: Image.asset('assets/images/HD_Roland TrueVIS VG3-640 Printer Cutter.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Column(
                  children: [
                    const Divider(),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 80,
                          child: Image.asset('assets/images/Y_VINYL.png'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Roland TrueVIS VG3-640',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Print and Cut Machine',
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
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "The Roland TrueVIS VG3-640 is a versatile large-format inkjet "
                                      "printer/cutter that combines high-quality printing with precise "
                                      "cutting capabilities.  It boasts a maximum print and cut width of "
                                      "over 64 inches, allowing for production of large banners, signs, "
                                      "vehicle graphics, and more.  With its eco-solvent ink technology, "
                                      "the VG3-640 delivers durable, vibrant prints suitable for outdoor "
                                      "applications.",
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
          ],
        ),
      ),
    );
  }
}