import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/maker_account.dart';
import 'package:jmaker_fablab/Views/student_account.dart';
import 'package:jmaker_fablab/styles/text_style.dart';

import '../styles/color.dart';
import 'landingPage.dart';

class AccountType extends StatelessWidget {
  const AccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                //Text Headings
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [ // Removed redundant crossAxisAlignment
                        FloatingActionButton(
                          backgroundColor: whiteBG,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LandingPage()),
                      );
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: blackGreen, // Used color property for icon color
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Choose your Account Type',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            'Are you a student or a maker?',
                            style: CustomTextStyle.secondaryGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 60),
                  ],
                ),
                //Student Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: mainYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => StudentAccount()),
                          );
                        },// navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/student_icon.png',
                              fit: BoxFit.contain,
                              height: 100,
                              width: 150,
                            ),
                            const Text('Student'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: mainYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MakerAccount()
                            ),
                          );
                        }, // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/maker_icon.png',
                                fit: BoxFit.contain,
                                height: 100,
                                width: 150,
                              ),
                            ),
                            const Text('Maker'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
