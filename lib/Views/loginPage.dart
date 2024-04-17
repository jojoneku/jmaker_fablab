import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/landingPage.dart';
import 'package:jmaker_fablab/styles/formStyles.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import '../styles/buttons.dart';

import '../styles/color.dart';

class loginPage extends StatelessWidget {
  const loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: blackGreen,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            Image.asset('assets/images/jmaker_symbol.png',
                fit: BoxFit.contain, height: 130, width: 130),
            Text(
              'Log In to JMakers',
              style: CustomTextStyle.boldHeader,
            ),
            Text(
              "Let's start making your ideas come to life!",
              style: CustomTextStyle.secondaryGrey,
            ),
            SizedBox(height: 32),
            TextFormField(
              decoration: CustomFormDecoration(
                borderColor: secondGrey,
                focusedBorderColor: mainYellow,
                labelText: 'Email',
                hintText: 'Enter the email you signed up with.',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: CustomFormDecoration(
                borderColor: secondGrey,
                focusedBorderColor: mainYellow,
                labelText: 'Password',
                hintText: 'Enter your password.',
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // Align to the end (right)
              children: [
                TextButton(
                  onPressed: () {
                    // Add functionality for handling forgot password (e.g., navigate to password reset screen)
                  },
                  child: Text(
                    'Forgot your password?',
                    style: CustomTextStyle
                        .secondaryGrey, // Apply your desired style
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
              child: ElevatedButton(
                style: longYellow,
                onPressed: () {}, //attach navigation to dashboard
                child: Text(
                  'Log-In.',
                  style: CustomTextStyle.primaryBlack,
                ),
              ),
            ),
            const Expanded(
                child: SizedBox(
              height: double.infinity,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // Align to the end (right)
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandingPage()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: CustomTextStyle
                        .secondaryGrey, // Apply your desired style
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
