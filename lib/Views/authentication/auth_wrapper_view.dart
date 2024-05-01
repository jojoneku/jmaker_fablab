import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Controller/auth_controller.dart';
import 'package:jmaker_fablab/Views/dashboard_view.dart';
import 'package:jmaker_fablab/Views/landing_view.dart';

@RoutePage()
class AuthWrapperView extends StatelessWidget {
  const AuthWrapperView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthController().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          User? user = snapshot.data;

          if (user != null && user.emailVerified) {
            return const DashBoardView();
          }
        } else {
          return const LandingView();
        }
        return const LandingView();
      },
    );
  }
}
