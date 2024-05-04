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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),

      ),
      height: 56, // Set the desired height
      width: double.infinity, // Take full width of the screen
      child: SalomonBottomBar(
        key: key,

        itemShape: const StadiumBorder(),
        backgroundColor: blackGreen,
        selectedItemColor: mainYellow,
        unselectedItemColor: whiteBG,
        currentIndex: currentIndex,

        onTap: _handleIndexChanged,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.data_thresholding_outlined),
            title: const Text("Machines"),
            selectedColor: mainYellow,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.qr_code_outlined),
            title: const Text("QR Code"),
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
