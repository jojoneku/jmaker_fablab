import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/color.dart';

@RoutePage()
class StudentQRView extends StatefulWidget {
  const StudentQRView({super.key});

  @override
  State<StudentQRView> createState() => _StudentQRViewState();
}

class _StudentQRViewState extends State<StudentQRView> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Congratulations!',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            "You've successfully created your account!",
                            style: CustomTextStyle.primaryBlack,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  color: whiteBG,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/images/JMAKER png-03.png',
                        height: 24,
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/QRCODE.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Juan Dela Cruz',
                      style: CustomTextStyle.primaryBlack,
                    ),
                    Text(
                      'Student',
                      style: CustomTextStyle.primaryBlack,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Generated QR Code',
                style: CustomTextStyle.boldHeader,
              ),
              const Expanded(
                  child: SizedBox(
                height: double.infinity,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.download,
                      color: blackGreen,
                    ),
                    label: Text(
                      'Download',
                      style: CustomTextStyle.primaryBlack,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                child: ElevatedButton(
                  style: longwhite,
                  onPressed: () => context.router.replaceAll([const LoginRoute()]), //attach navigation
                  child: Text(
                    'Log In',
                    style: CustomTextStyle.primaryBlack,
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
