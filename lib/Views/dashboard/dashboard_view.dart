import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jmaker_fablab/routes/app_router.gr.dart';
import 'package:jmaker_fablab/styles/botnavbarwidget.dart';

@RoutePage()
class DashBoardView extends StatelessWidget {
  const DashBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeTab(),
        QRTab(),
        AboutFablabTab(),
        ProfileTab(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return CustomBottomNavBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
