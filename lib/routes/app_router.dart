import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page),
        AutoRoute(
          page: AuthWrapperRoute.page,
          initial: true,
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AccountTypeRoute.page),
        AutoRoute(page: MakerAccountRoute.page),
        AutoRoute(page: StudentAccountRoute.page),
        AutoRoute(page: MakerQRRoute.page),
        AutoRoute(page: StudentQRRoute.page),
        AutoRoute(
          page: DashBoardRoute.page,
          children: [
            AutoRoute(
              page: HomeTab.page,
              initial: true,
              children: [
                AutoRoute(
                  page: HomeRoute.page,
                  initial: true,
                ),
                AutoRoute(page: M3DPrinterRoute.page),
                AutoRoute(page: MCNCMillingRoute.page),
                AutoRoute(page: MEmbroideryRoute.page),
                AutoRoute(page: MLaserCuttingRoute.page),
                AutoRoute(page: MGCCLaserRoute.page),
                AutoRoute(page: MULSLaserRoute.page),
                AutoRoute(page: M3DScannerRoute.page),
                AutoRoute(page: MCNCMillingRoute.page),
                AutoRoute(page: MCNCShopbotRoute.page),
                AutoRoute(page: MVacuumFormingRoute.page),
                AutoRoute(page: MVinylCuttingRoute.page),
                AutoRoute(page: NoContentRoute.page),
              ],
            ),
            AutoRoute(
              page: QRTab.page,
              children: [
                AutoRoute(
                  page: QRRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: AboutFablabTab.page,
              children: [
                AutoRoute(
                  page: AboutFablabRoute.page,
                  initial: true,
                ),
              ],
            ),
            AutoRoute(
              page: ProfileTab.page,
              children: [
                AutoRoute(
                  page: ProfileRoute.page,
                  initial: true,
                ),
              ],
            ),
          ],
        ), //TODO subRoutes
      ];
}
