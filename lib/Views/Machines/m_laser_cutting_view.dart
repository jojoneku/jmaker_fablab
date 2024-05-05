import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/color.dart';

@RoutePage()
class MLaserCuttingView extends StatelessWidget {
  const MLaserCuttingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteBG,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                //Text Headings
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Removed redundant crossAxisAlignment
                        FloatingActionButton(
                          backgroundColor: whiteBG,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: blackGreen, // Used color property for icon color
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Choose Machine Model',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            'There are two machines.',
                            style: CustomTextStyle.secondaryGrey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 60),
                  ],
                ),
                //Student Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: blackGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          context.router.push(const MGCCLaserRoute());
                        }, // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/Y_LASER.png',
                              fit: BoxFit.contain,
                              height: 200,
                              width: 2000,
                            ),
                            const Text(
                              'GCC Laser Pro',
                              style: TextStyle(
                                color: mainYellow,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 233,
                      width: 400,
                      child: FloatingActionButton(
                        backgroundColor: blackGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () {
                          context.router.push(const MULSLaserRoute());
                        }, // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/Y_LASER.png',
                                fit: BoxFit.contain,
                                height: 200,
                                width: 200,
                              ),
                            ),
                            const Text(
                              'ULS VLS 6.60',
                              style: TextStyle(
                                color: mainYellow,
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
