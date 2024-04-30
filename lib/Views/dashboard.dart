import 'package:flutter/material.dart';
import 'package:jmaker_fablab/styles/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../styles/buttons.dart';
import 'viewQR.dart';
import 'aboutFablab.dart';


class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var _selectedTab = _SelectedTab.DashBoard;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      switch (_selectedTab) {
        case _SelectedTab.DashBoard:
        // Navigate to your Dashboard page or perform any action
          break;
        case _SelectedTab.viewQR:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => viewQR()), // Navigate to View QR page
          );
          break;
        case _SelectedTab.aboutFablab:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => aboutFablab()), // Navigate to About Fablab page
          );
          break;
        case _SelectedTab.profile:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => aboutFablab()), // Navigate to About Fablab page
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(

                child: Image.asset(
                  'assets/images/TOP.png',
                  fit: BoxFit.fill,
                  width: 415,
                  height: 120,
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  clipBehavior: Clip.antiAlias,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Welcome,", style: TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text("Innovator,", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "What machine would you like to use today?",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ),
                      Row(children: [
                        dashboardButton(
                          text: '3D Printing Machine',
                          imagePath: 'assets/images/B_3DPRINTER.png',
                          onPressed: () {},
                        ),
                        dashboardButton(
                          text: 'CNC Milling Machine',
                          imagePath: 'assets/images/B_CNC.png',
                          onPressed: () {},
                        ),
                      ]),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: 'Embroidery Machine',
                            imagePath: 'assets/images/B_EMBROIDERY.png',
                            onPressed: () {},
                          ),
                          dashboardButton(
                            text: 'Laser Cutting Machine',
                            imagePath: 'assets/images/B_LASER.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: '3D Scanner',
                            imagePath: 'assets/images/B_SCANNER.png',
                            onPressed: () {},
                          ),
                          dashboardButton(
                            text: 'CNC Shopbot Machine',
                            imagePath: 'assets/images/B_SHOPBOT.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: 'Vacuum Forming Machine',
                            imagePath: 'assets/images/B_VAQUFORM.png',
                            onPressed: () {},
                          ),
                          dashboardButton(
                            text: 'Vinyl Cutting Machine',
                            imagePath: 'assets/images/B_VINYL.png',
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: SalomonBottomBar(
          backgroundColor: blackGreen,
          selectedItemColor: mainYellow,
          unselectedItemColor: whiteBG,

          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
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
      ),
    );
  }
}

enum _SelectedTab { DashBoard, viewQR, aboutFablab, profile }
