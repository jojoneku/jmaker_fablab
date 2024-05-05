import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/buttons.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: Hive.box('userData').listenable(),
        builder: (context, value, child) {
          final userData = value.values.first;
          print(userData);
          return SafeArea(
            child: Builder(builder: (context) {
              return Center(
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
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  "Welcome,",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  userData is StudentModel
                                      ? userData.fullName
                                      : userData is MakerModel
                                          ? userData.fullName
                                          : 'Innovator',
                                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
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
                            Row(
                              children: [
                                dashboardButton(
                                  text: '3D Printing Machine',
                                  imagePath: 'assets/images/B_3DPRINTER.png',
                                  onPressed: () {
                                    context.router.push(const M3DPrinterRoute());
                                  },
                                ),
                                dashboardButton(
                                  text: 'CNC Milling Machine',
                                  imagePath: 'assets/images/B_CNC.png',
                                  onPressed: () {
                                    context.router.push(const MCNCMillingRoute());
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                dashboardButton(
                                  text: 'Embroidery Machine',
                                  imagePath: 'assets/images/B_EMBROIDERY.png',
                                  onPressed: () {
                                    context.router.push(const MEmbroideryRoute());
                                  },
                                ),
                                dashboardButton(
                                  text: 'Laser Cutting Machine',
                                  imagePath: 'assets/images/B_LASER.png',
                                  onPressed: () {
                                    context.router.push(const MLaserCuttingRoute());
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
                                    context.router.push(const M3DScannerRoute());
                                  },
                                ),
                                dashboardButton(
                                  text: 'CNC Shopbot Machine',
                                  imagePath: 'assets/images/B_SHOPBOT.png',
                                  onPressed: () {
                                    context.router.push(const MCNCShopbotRoute());
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
                                    context.router.push(const MVacuumFormingRoute());
                                  },
                                ),
                                dashboardButton(
                                  text: 'Vinyl Cutting Machine',
                                  imagePath: 'assets/images/B_VINYL.png',
                                  onPressed: () {
                                    context.router.push(const MVinylCuttingRoute());
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
              );
            }),
          );
        },
      ),
    );
  }
}
