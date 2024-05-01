import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/buttons.dart';

import '../styles/text_style.dart';

class AboutFablab extends StatefulWidget {
  const AboutFablab({super.key});

  @override
  State<AboutFablab> createState() => _AboutFablabState();
}

class _AboutFablabState extends State<AboutFablab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                //what is a fablab
                Text(
                  'What is a FabLab?',
                  style: CustomTextStyle.bigTitle,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 4),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "A FabLab or a Fabrication Laboratory, is a place to stay"
                            ", to create, to learn, to mentor, to invent: a place of"
                            " learning and innovation.\n"
                            "\n"
                            "FabLabs provide access to the environment, to the skills,"
                            "the materials, and advanced technology to allow anyone, anywhere to "
                            "make (almost) anything.",
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Image.asset('assets/images/Fab_Lab_logo.png',
                          height: 100, width: 80,),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                //fab network
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is the FabLab Network?',
                      style: CustomTextStyle.bigTitle,
                    )),
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Image.asset('assets/images/network.png',
                          height: 100, width: 90),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 4),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: double.infinity,
                          child: RichText(
                            textAlign: TextAlign.left,
                            text: TextSpan(
                              style: CustomTextStyle.primaryBlack,
                              children: [
                                const TextSpan(
                                  text:
                                      "The FabLab Network is an open creative community of fabricators,"
                                      " artists, scientists, engineers, educators, students, amateurs, and  professionals"
                                      " located in many countries and Fablabs across the Globe.\n",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Text(
                  'Who can use a FabLab?',
                  style: CustomTextStyle.bigTitle,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 4),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "FabLabs are open to everyone, "
                                "regardless of age, background, or experience level. "
                                "They are designed to be inclusive spaces where people "
                                "can come together to learn, create, and innovate. ",
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 16),
                //2300+ fablabs
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
                          child: Image.asset('assets/images/labs-01.png',
                              height: 100),
                        ),
                        Text(
                          '2300+',
                          style: CustomTextStyle.bigTitle,
                        ),
                        Align(
                            child: Text(
                          'Fablabs around the world.',
                          style: CustomTextStyle.primaryBlack,
                        )),
                      ],
                    ),
                    SizedBox(width: 32),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16),
                          child: Image.asset('assets/images/countries-01.png',
                              height: 100),
                        ),
                        Text(
                          '120+',
                          style: CustomTextStyle.bigTitle,
                        ),
                        Text(
                          ' Countries in the Network.',
                          style: CustomTextStyle.primaryBlack,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    ' Source : FABLAB Foundation at fablabs.io ',
                    style: TextStyle(
                      fontSize: 9,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                Text(
                  'About FabLab Bohol Philippines',
                  style: CustomTextStyle.bigTitle,
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 4),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Fabrication Laboratory (FABLAB) Bohol is the first Digital Fabrication "
                                "Laboratory in the Philippines launched last May 2, 2014 as training provider, "
                                "technology access center and a service bureau. It is a consortium brand "
                                "for local empowerment of the Department of Trade and Industry, Department "
                                "of Science and Technology, Japan International Cooperation Agency and Bohol Island State University."
                            "\n"
                              "\nFABLAB serves as a makerspace to all the makers, researchers, designers, "
                                "start-ups, micro, small, medium enterprises (MSMEs) and enthusiast individuals. "
                            "\n"
                                "\nFABLAB conducts various digital fabrication design workshops, provides product "
                                "development for MSMEs and holds laboratory classes.",
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                //who can use fablab

              ],
            ),
          ),
        ),
      ),
    );
  }
}
