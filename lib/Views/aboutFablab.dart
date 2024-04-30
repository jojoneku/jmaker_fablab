import 'package:flutter/material.dart';


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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'About Fablab Page',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Go to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
