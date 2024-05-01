// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:jmaker_fablab/Views/account_type_view.dart' as _i1;
import 'package:jmaker_fablab/Views/authentication/auth_wrapper_view.dart'
    as _i2;
import 'package:jmaker_fablab/Views/dashboard_view.dart' as _i3;
import 'package:jmaker_fablab/Views/landing_view.dart' as _i4;
import 'package:jmaker_fablab/Views/login_view.dart' as _i5;
import 'package:jmaker_fablab/Views/maker_account_view.dart' as _i6;
import 'package:jmaker_fablab/Views/maker_qr_view.dart' as _i7;
import 'package:jmaker_fablab/Views/student_account_view.dart' as _i8;
import 'package:jmaker_fablab/Views/student_qr_view.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    AccountTypeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountTypeView(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AuthWrapperView(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoardView(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LandingView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginView(),
      );
    },
    MakerAccountRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MakerAccountView(),
      );
    },
    MakerQRRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MakerQRView(),
      );
    },
    StudentAccountRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.StudentAccountView(),
      );
    },
    StudentQRRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.StudentQRView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountTypeView]
class AccountTypeRoute extends _i10.PageRouteInfo<void> {
  const AccountTypeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountTypeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthWrapperView]
class AuthWrapperRoute extends _i10.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i10.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashBoardView]
class DashBoardRoute extends _i10.PageRouteInfo<void> {
  const DashBoardRoute({List<_i10.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LandingView]
class LandingRoute extends _i10.PageRouteInfo<void> {
  const LandingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginView]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MakerAccountView]
class MakerAccountRoute extends _i10.PageRouteInfo<void> {
  const MakerAccountRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MakerAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'MakerAccountRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MakerQRView]
class MakerQRRoute extends _i10.PageRouteInfo<void> {
  const MakerQRRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MakerQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'MakerQRRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.StudentAccountView]
class StudentAccountRoute extends _i10.PageRouteInfo<void> {
  const StudentAccountRoute({List<_i10.PageRouteInfo>? children})
      : super(
          StudentAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentAccountRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.StudentQRView]
class StudentQRRoute extends _i10.PageRouteInfo<void> {
  const StudentQRRoute({List<_i10.PageRouteInfo>? children})
      : super(
          StudentQRRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentQRRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
