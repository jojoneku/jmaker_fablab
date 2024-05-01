import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Views/Machines/3DScannerMachine.dart';
import 'package:jmaker_fablab/Views/Machines/CNCMillingMachine.dart';
import 'package:jmaker_fablab/Views/Machines/CNCShopbotMachine.dart';
import 'package:jmaker_fablab/Views/Machines/EmbroideryMachine.dart';
import 'package:jmaker_fablab/Views/Machines/VacuformMachine.dart';
import '../styles/buttons.dart';
import 'Machines/3DPrintingMachine.dart';
import 'Machines/LaserMachine_type.dart';
import 'Machines/VinylMachine_type.dart';





class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

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
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 8),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(

                  // physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [

                      Row(children: [
                        dashboardButton(
                          text: '3D Printing Machine',
                          imagePath: 'assets/images/B_3DPRINTER.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const f3DPrinter()),
                            );
                          },
                        ),
                        dashboardButton(
                          text: 'CNC Milling Machine',
                          imagePath: 'assets/images/B_CNC.png',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CNCMilling()),
                            );
                          },
                        ),
                      ]),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: 'Embroidery Machine',
                            imagePath: 'assets/images/B_EMBROIDERY.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Embroidery()),
                              );
                            },
                          ),
                          dashboardButton(
                            text: 'Laser Cutting Machines',
                            imagePath: 'assets/images/B_LASER.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LaserMachineType()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: '3D Scanner',
                            imagePath: 'assets/images/B_SCANNER.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const F3DScanner()),
                              );
                            },
                          ),
                          dashboardButton(
                            text: 'CNC Shopbot Machine',
                            imagePath: 'assets/images/B_SHOPBOT.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CNCShopbot()),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          dashboardButton(
                            text: 'Vacuum Forming Machine',
                            imagePath: 'assets/images/B_VAQUFORM.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Vaquform()),
                              );
                            },
                          ),
                          dashboardButton(
                            text: 'Vinyl Cutting Machine',
                            imagePath: 'assets/images/B_VINYL.png',
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const VinylMachineType()),
                              );
                            },
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

