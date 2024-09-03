import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/Views/internet_connection_checker.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../styles/color.dart';
import '../../../styles/text_style.dart';

final Uri _url = Uri.parse('https://web.facebook.com/fablabbohol');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
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
    ];

    return InternetConnectionChecker(
      child: (isOfflineMode) => Scaffold(
        body: ValueListenableBuilder(
          valueListenable: Hive.box('userData').listenable(),
          builder: (context, value, child) {
            if (value.isEmpty || !value.isOpen) {
              return const SizedBox.shrink();
            }

            final userData = value.values.first;

            return SafeArea(
              top: !isOfflineMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      width: double.infinity,
                      'assets/images/TOP.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Welcome,",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            Text(
                              userData is StudentModel
                                  ? userData.fullName
                                  : userData is MakerModel
                                      ? userData.fullName
                                      : 'Innovator',
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "What machine would you like to learn today?",
                              style: TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              onPressed: _launchUrl,
                              icon: Icon(Icons.calendar_month),
                              iconSize: 32,
                              color: mainYellow,
                            ),
                            Text('Book',
                              style: CustomTextStyle.secondaryGrey,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      itemCount: items.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return items[index];
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
