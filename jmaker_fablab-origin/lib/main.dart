import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jmaker_fablab/Model/maker_model.dart';
import 'package:jmaker_fablab/Model/student_model.dart';
import 'package:jmaker_fablab/firebase_options.dart';
import 'package:jmaker_fablab/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.openBox('userData');
  Hive.openBox('userCredentials');
  Hive.registerAdapter(StudentModelAdapter());
  Hive.registerAdapter(MakerModelAdapter());
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
    return Builder(
      builder: (context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)), // Fixed text scale
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'Nunito',
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routerConfig: _appRouter.config(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
