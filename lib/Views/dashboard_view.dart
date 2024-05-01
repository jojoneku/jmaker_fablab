import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Controller/firestore_controller.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';

//TODO dashboard integration [functions/methods/profiling]
@RoutePage()
class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirestoreController().getStudentDetailsById(context, AuthController().userId ?? ''),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return SafeArea(
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
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Welcome,", style: CustomTextStyle.primaryBlack),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Innovator,", style: CustomTextStyle.bigTitle),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("What machine would you like to use today?", style: CustomTextStyle.secondaryGrey),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                    child: Divider(),
                  ),
                  Flexible(
                    child: Scrollbar(
                      thumbVisibility: true,
                      thickness: 10.0,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Row(children: [
                              dashboardButton(
                                text: '3D Printing Machine',
                                imagePath: 'assets/images/B_3DPRINTER.png',
                                onPressed: () => AuthController().logout(context), //TODO Remove later
                              ),
                              dashboardButton(text: 'CNC Milling Machine', imagePath: 'assets/images/B_CNC.png', onPressed: () {}),
                            ]),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                dashboardButton(text: 'Embroidery Machine', imagePath: 'assets/images/B_EMBROIDERY.png', onPressed: () {}),
                                dashboardButton(text: 'Laser Cutting Machine', imagePath: 'assets/images/B_LASER.png', onPressed: () {}),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                dashboardButton(text: '3D Scanner', imagePath: 'assets/images/B_SCANNER.png', onPressed: () {}),
                                dashboardButton(text: 'CNC Shopbot Machine', imagePath: 'assets/images/B_SHOPBOT.png', onPressed: () {}),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                dashboardButton(text: 'Vacuum Forming Machine', imagePath: 'assets/images/B_VAQUFORM.png', onPressed: () {}),
                                dashboardButton(text: 'Vinyl Cutting Machine', imagePath: 'assets/images/B_VINYL.png', onPressed: () {}),
                              ],
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
