import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/firebase_options.dart';
import 'package:jmaker_fablab/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Nunito'),
      routerConfig: _appRouter.config(),
    );
  }
}
