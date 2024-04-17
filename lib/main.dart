import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'Views/landingPage.dart';
import 'Views/account_type.dart';

void main() {
  runApp(const Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Nunito'),
      home: LandingPage(),
    );
  }
}