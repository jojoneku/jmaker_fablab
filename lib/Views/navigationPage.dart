import 'package:flutter/material.dart';
import '../styles/botnavbarwidget.dart';
import 'dashboard.dart'; // Import your other pages here
import 'viewQR.dart';
import 'aboutFablab.dart';


class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int _currentIndex = 0; // Start with index 0 (Dashboard)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const DashBoard(),
          const viewQR(),
          const AboutFablab(),
          const Scaffold(), // Placeholder for Profile page
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
