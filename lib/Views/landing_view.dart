import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/buttons.dart';
import 'package:jmaker_fablab/styles/text_style.dart';
import '../styles/color.dart';

@RoutePage()
class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          color: whiteBG,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.asset(
                      'assets/images/JMAKER png-03.png',
                      fit: BoxFit.contain,
                      width: 150,
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Image.asset(
                    'assets/images/landingvector.png',
                    fit: BoxFit.contain,
                    width: 300,
                  ),
                ),
              ),
              Text(
                'Welcome Makers!',
                style: CustomTextStyle.boldHeader,
              ),
              const SizedBox(height: 3),
              Text(
                'Setup your account now and start making!',
                style: CustomTextStyle.secondaryGrey,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                      child: ElevatedButton(
                        style: yellowPrimary,
                        onPressed: () => context.router.push(const AccountTypeRoute()),
                        child: Text(
                          'Sign Up',
                          style: CustomTextStyle.primaryBlack,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 16),
                      child: ElevatedButton(
                        style: greyPrimary,
                        onPressed: () => context.router.push(const LoginRoute()),
                        child: Text(
                          'Log In',
                          style: CustomTextStyle.primaryBlack,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
