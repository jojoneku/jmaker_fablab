import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jmaker_fablab/Utils/internet_connection.dart';
import 'package:jmaker_fablab/styles/color.dart';

bool isOfflineMode = false;

class InternetConnectionChecker extends StatefulWidget {
  const InternetConnectionChecker({super.key, required this.child});

  final Widget Function(bool isOfflineMode) child;

  static Widget scaffold({
    required Widget body,
    Color? backgroundColor,
  }) =>
      InternetConnectionChecker(
        child: (value) => Scaffold(
          body: body,
          backgroundColor: backgroundColor,
        ),
      );

  @override
  State<InternetConnectionChecker> createState() => _InternetConnectionCheckerState();
}

class _InternetConnectionCheckerState extends State<InternetConnectionChecker> {
  StreamSubscription<ConnectionStatus>? _connectionSubscription;

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    _connectionSubscription = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _connectionSubscription ??= internetConnectionChecker.internetStatus().listen((ConnectionStatus event) async {
        if (event == ConnectionStatus.offline && mounted) {
          setState(() => isOfflineMode = true);
          ScaffoldMessenger.of(context).showMaterialBanner(const MaterialBanner(
            overflowAlignment: OverflowBarAlignment.center,
            content: Text(
              'Offline Mode',
              textAlign: TextAlign.center,
            ),
            contentTextStyle: TextStyle(color: whiteBG),
            backgroundColor: Colors.red,
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            actions: [SizedBox.shrink()],
          ));
        }
        if (event == ConnectionStatus.online && mounted) {
          setState(() => isOfflineMode = false);
          ScaffoldMessenger.of(context).clearMaterialBanners();
        }
      });
    });

    return widget.child(isOfflineMode);
  }
}
