import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../styles/color.dart';

enum CustomNavBarTab { dashboard, viewQR, aboutFablab, profile }
class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Key? key;

  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    this.key,
  }) : super(key: key);

  void _handleIndexChanged(int index) {
    onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // Set the desired height
      width: double.infinity, // Take full width of the screen
      child: SalomonBottomBar(
        key: key,
        backgroundColor: blackGreen,
        selectedItemColor: mainYellow,
        unselectedItemColor: whiteBG,
        currentIndex: currentIndex,

        onTap: _handleIndexChanged,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.local_fire_department),
            title: const Text("Dashboard"),
            selectedColor: mainYellow,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.qr_code_outlined),
            title: const Text("View QR"),
            selectedColor: mainYellow,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.info_outline_rounded),
            title: const Text("About Fablab"),
            selectedColor: mainYellow,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_3_rounded),
            title: const Text("Profile"),
            selectedColor: mainYellow,
          ),
        ],
      ),
    );
  }
}
