import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/internet_connection_checker.dart';
import 'package:jmaker_fablab/styles/text_style.dart';

@RoutePage()
class AboutFablabView extends StatefulWidget {
  const AboutFablabView({super.key});

  @override
  State<AboutFablabView> createState() => _AboutFablabViewState();
}

class _AboutFablabViewState extends State<AboutFablabView> {
  @override
  Widget build(BuildContext context) {
    return InternetConnectionChecker(
      child: (_) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/JMAKER png-03.png',
                      height: 50,
                    ),
                  ),
                ),
                Align(
                  child: Text(
                    '\nAn Information System Mobile App '
                    'for Digital Fabrication Laboratories.',
                    style: CustomTextStyle.boldHeader,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'The JMAKERS Application is an information system designed to support digital fabrication laboratories by '
                  'providing comprehensive resources for machine operation and maintenance. This Android-based mobile app serves as an e-learning '
                  'tool, delivering training and instructional content through digital means, making it an essential tool for both novice and '
                  'experienced users of digital fabrication technologies.',
                  style: CustomTextStyle.primaryBlack,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 16),
                Text(
                  'Key Features',
                  style: CustomTextStyle.primaryBlack,
                ),

                const Divider(),

                //manuals
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '1. Digital Fabrication Machine Manuals',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        '• Detailed operational manuals on digital fabrication.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Data-making instructions.',
                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Frequently Asked Questions (FAQs) on basic maintenance and machine requirements.       ',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Accessible offline for convenience in environments with limited internet connectivity.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                    ],
                  ),
                ),

                //videotutorials
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '2. Video Tutorials',
                    style: CustomTextStyle.primaryBlack,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        '• Step-by-step video guides on machine operations.',
                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Accessible online, offering dynamic and visual learning experiences.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                    ],
                  ),
                ),

                //userlogin
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '3. Automated User Login and Attendance via Quick Response (QR) Code',
                    textAlign: TextAlign.justify,
                    style: CustomTextStyle.primaryBlack,
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        '• Users can log in swiftly using QR codes, streamlining the login process.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Facilitates user monitoring by tracking engagement with specific machines and projects.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Enhances user accountability and project management within the lab.',

                        style: CustomTextStyle.primaryBlack,
                      )
                    ],
                  ),
                ),

                //Security
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '4. Log-in Security System',
                    style: CustomTextStyle.primaryBlack,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32),
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        '• Robust security measures to safeguard user accounts.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        '• Protects sensitive data and maintains the integrity of the application.',

                        style: CustomTextStyle.primaryBlack,
                      ),
                      Text(
                        "• Ensures only authorized access to the app's resources and features.",

                        style: CustomTextStyle.primaryBlack,
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  'The JMAKERS Application stands out as a versatile and secure information system tailored for the needs of digital fabrication laboratories, enhancing learning, operational efficiency, and user management through its innovative features.',
                  style: CustomTextStyle.primaryBlack,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 8),
                Text(
                  'Disclaimer: Operation Manuals are referred to as Brand/Machine Operation Guides',
                  style: CustomTextStyle.secondaryGrey,
                ),
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
                      child: Image.asset(
                        'assets/images/Fab_Lab_logo.png',
                        height: 100,
                        width: 80,
                      ),
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
                                TextSpan(
                                  text:
                                      "The FabLab Network is an open creative community of fabricators,"
                                      " artists, scientists, engineers, educators, students, amateurs, and  professionals"
                                      " located in many countries and Fablabs across the Globe.\n",
                                  style: CustomTextStyle.primaryBlack,
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

                const SizedBox(height: 16),
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
                    const SizedBox(width: 32),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 16),
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
                const SizedBox(height: 16),
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
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  'We Take Your Privacy Seriously',
                  style: CustomTextStyle.bigTitle,
                ),
                const Divider(),

                Text(
                  "At JMakers, we understand the importance of protecting "
                  "your privacy and the confidentiality of your data. We are committed"
                  " to complying with all applicable data privacy laws and regulations,"
                  " including the Republic Act No. 10173 or the Data Privacy Act of 2012 (DPA)"
                  " in the Philippines. This law outlines your rights regarding your personal"
                  " data and our obligations to keep it secure. We also implement security "
                  "measures to comply with the Republic Act No. 10175 or the Cybersecurity"
                  " Act of 2012, ensuring a secure environment for your data.",
                  textAlign: TextAlign.justify,
                  style: CustomTextStyle.primaryBlack,
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'What information do we collect?',
                    style: CustomTextStyle.primaryBold,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text('• Personal data:', style: CustomTextStyle.Bold),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            ' This may include information such as your name, email address, phone number, and username (if applicable).',
                            textAlign: TextAlign.justify,
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text('• Usage data: ', style: CustomTextStyle.Bold),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'This may include information about how you use our app, such as the features you access, the data you store, and the time you spend using the app.',
                            textAlign: TextAlign.justify,
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text('• Device data: ', style: CustomTextStyle.Bold),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            'This may include information about your device, such as its model, operating system, and IP address.',
                            textAlign: TextAlign.justify,
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'How do we secure your data?',
                    style: CustomTextStyle.primaryBold,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    Text(
                      '• Using secure servers to store your data.',
                      style: CustomTextStyle.primaryBlack,
                    ),
                    Text(
                      '• Implementing security measures and encryptions to prevent unauthorized access to your data. Your QR Code can only be scanned and decrypted by our own scanners.',
                      style: CustomTextStyle.primaryBlack,
                      textAlign: TextAlign.justify,
                    ),
                    Text(
                      '• Regularly reviewing our security practices to ensure they remain effective.',
                      textAlign: TextAlign.justify,
                      style: CustomTextStyle.primaryBlack,
                    )
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
