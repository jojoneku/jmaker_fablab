import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import 'package:jmaker_fablab/styles/color.dart';

@RoutePage()
class AccountTypeView extends StatelessWidget {
  const AccountTypeView({super.key});

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
                          heroTag: null,
                          backgroundColor: whiteBG,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          elevation: 0,
                          onPressed: context.maybePop,
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
                            'Choose your Account Type',
                            style: CustomTextStyle.boldHeader,
                          ),
                          Text(
                            'Are you a student or a maker?',
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
                        heroTag: null,
                        backgroundColor: mainYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () => context.pushRoute(const StudentAccountRoute()), // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/student_icon.png',
                              fit: BoxFit.contain,
                              height: 100,
                              width: 150,
                            ),
                            const Text('Student'),
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
                        heroTag: null,
                        backgroundColor: mainYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                        onPressed: () => context.pushRoute(const MakerAccountRoute()), // navigate and store user decision
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/maker_icon.png',
                                fit: BoxFit.contain,
                                height: 100,
                                width: 150,
                              ),
                            ),
                            const Text('Maker'),
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
