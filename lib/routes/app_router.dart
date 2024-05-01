import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LandingRoute.page),
        AutoRoute(page: AuthWrapperRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AccountTypeRoute.page),
        AutoRoute(page: MakerAccountRoute.page),
        AutoRoute(page: StudentAccountRoute.page),
        AutoRoute(page: MakerQRRoute.page),
        AutoRoute(page: StudentQRRoute.page),
        AutoRoute(page: DashBoardRoute.page), //TODO subRoutes
      ];
}
