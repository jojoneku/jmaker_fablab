import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';

@RoutePage()
class AuthWrapperView extends StatefulWidget {
  const AuthWrapperView({super.key});

  @override
  State<AuthWrapperView> createState() => _AuthWrapperViewState();
}

class _AuthWrapperViewState extends State<AuthWrapperView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthController().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.waiting) {
          if (snapshot.hasError) {
            context.router.push(const LoginRoute());
          }

          if (snapshot.hasData && snapshot.data!.emailVerified) {
            context.router.replaceAll([const DashBoardRoute()]);
          } else {
            context.router.replaceAll([const LandingRoute()]);
          }
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
