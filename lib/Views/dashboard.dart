import 'package:flutter/material.dart';
import '../styles/buttons.dart';



class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

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
                ),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(

                  // physics: const AlwaysScrollableScrollPhysics(),
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
    );
  }
}

