// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;
import 'package:jmaker_fablab/Model/maker_model.dart' as _i28;
import 'package:jmaker_fablab/Model/student_model.dart' as _i29;
import 'package:jmaker_fablab/Views/account_type_view.dart' as _i3;
import 'package:jmaker_fablab/Views/authentication/auth_wrapper_view.dart'
    as _i4;
import 'package:jmaker_fablab/Views/dashboard/dashboard_view.dart' as _i5;
import 'package:jmaker_fablab/Views/dashboard/tabs/about_fablab_view.dart'
    as _i2;
import 'package:jmaker_fablab/Views/dashboard/tabs/dasboard_tabs_router.dart'
    as _i1;
import 'package:jmaker_fablab/Views/dashboard/tabs/home_view.dart' as _i6;
import 'package:jmaker_fablab/Views/dashboard/tabs/profile_view.dart' as _i22;
import 'package:jmaker_fablab/Views/dashboard/tabs/qr_view.dart' as _i23;
import 'package:jmaker_fablab/Views/landing_view.dart' as _i7;
import 'package:jmaker_fablab/Views/login_view.dart' as _i8;
import 'package:jmaker_fablab/Views/Machines/m_3d_printing_view.dart' as _i9;
import 'package:jmaker_fablab/Views/Machines/m_3d_scanner_view.dart' as _i10;
import 'package:jmaker_fablab/Views/Machines/m_cnc_milling_view.dart' as _i11;
import 'package:jmaker_fablab/Views/Machines/m_cnc_shopbot_view.dart' as _i12;
import 'package:jmaker_fablab/Views/Machines/m_embroidery_view.dart' as _i13;
import 'package:jmaker_fablab/Views/Machines/m_fcc_laser_view.dart' as _i14;
import 'package:jmaker_fablab/Views/Machines/m_laser_cutting_view.dart' as _i15;
import 'package:jmaker_fablab/Views/Machines/m_uls_laser_view.dart' as _i16;
import 'package:jmaker_fablab/Views/Machines/m_vacuum_forming_view.dart'
    as _i17;
import 'package:jmaker_fablab/Views/Machines/m_vinyl_cutting_view.dart' as _i18;
import 'package:jmaker_fablab/Views/Machines/no_content_view.dart' as _i21;
import 'package:jmaker_fablab/Views/maker_account_view.dart' as _i19;
import 'package:jmaker_fablab/Views/maker_qr_view.dart' as _i20;
import 'package:jmaker_fablab/Views/student_account_view.dart' as _i24;
import 'package:jmaker_fablab/Views/student_qr_view.dart' as _i25;

abstract class $AppRouter extends _i26.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    AboutFablabTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutFablabTabView(),
      );
    },
    AboutFablabRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AboutFablabView(),
      );
    },
    AccountTypeRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AccountTypeView(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthWrapperView(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DashBoardView(),
      );
    },
    HomeTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeTabView(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeView(),
      );
    },
    LandingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LandingView(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginView(),
      );
    },
    M3DPrinterRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.M3DPrinterView(),
      );
    },
    M3DScannerRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.M3DScannerView(),
      );
    },
    MCNCMillingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.MCNCMillingView(),
      );
    },
    MCNCShopbotRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.MCNCShopbotView(),
      );
    },
    MEmbroideryRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.MEmbroideryView(),
      );
    },
    MGCCLaserRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.MGCCLaserView(),
      );
    },
    MLaserCuttingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.MLaserCuttingView(),
      );
    },
    MULSLaserRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.MULSLaserView(),
      );
    },
    MVacuumFormingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.MVacuumFormingView(),
      );
    },
    MVinylCuttingRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.MVinylCuttingView(),
      );
    },
    MakerAccountRoute.name: (routeData) {
      final args = routeData.argsAs<MakerAccountRouteArgs>(
          orElse: () => const MakerAccountRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.MakerAccountView(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    MakerQRRoute.name: (routeData) {
      final args = routeData.argsAs<MakerQRRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.MakerQRView(
          key: args.key,
          data: args.data,
          name: args.name,
        ),
      );
    },
    NoContentRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.NoContentView(),
      );
    },
    ProfileTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileTabView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ProfileView(),
      );
    },
    QRTab.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.QRTabView(),
      );
    },
    QRRoute.name: (routeData) {
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.QRView(),
      );
    },
    StudentAccountRoute.name: (routeData) {
      final args = routeData.argsAs<StudentAccountRouteArgs>(
          orElse: () => const StudentAccountRouteArgs());
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.StudentAccountView(
          key: args.key,
          userData: args.userData,
        ),
      );
    },
    StudentQRRoute.name: (routeData) {
      final args = routeData.argsAs<StudentQRRouteArgs>();
      return _i26.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i25.StudentQRView(
          key: args.key,
          data: args.data,
          name: args.name,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutFablabTabView]
class AboutFablabTab extends _i26.PageRouteInfo<void> {
  const AboutFablabTab({List<_i26.PageRouteInfo>? children})
      : super(
          AboutFablabTab.name,
          initialChildren: children,
        );

  static const String name = 'AboutFablabTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AboutFablabView]
class AboutFablabRoute extends _i26.PageRouteInfo<void> {
  const AboutFablabRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AboutFablabRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutFablabRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AccountTypeView]
class AccountTypeRoute extends _i26.PageRouteInfo<void> {
  const AccountTypeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AccountTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountTypeRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AuthWrapperView]
class AuthWrapperRoute extends _i26.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i26.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DashBoardView]
class DashBoardRoute extends _i26.PageRouteInfo<void> {
  const DashBoardRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i1.HomeTabView]
class HomeTab extends _i26.PageRouteInfo<void> {
  const HomeTab({List<_i26.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeView]
class HomeRoute extends _i26.PageRouteInfo<void> {
  const HomeRoute({List<_i26.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LandingView]
class LandingRoute extends _i26.PageRouteInfo<void> {
  const LandingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginView]
class LoginRoute extends _i26.PageRouteInfo<void> {
  const LoginRoute({List<_i26.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i9.M3DPrinterView]
class M3DPrinterRoute extends _i26.PageRouteInfo<void> {
  const M3DPrinterRoute({List<_i26.PageRouteInfo>? children})
      : super(
          M3DPrinterRoute.name,
          initialChildren: children,
        );

  static const String name = 'M3DPrinterRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i10.M3DScannerView]
class M3DScannerRoute extends _i26.PageRouteInfo<void> {
  const M3DScannerRoute({List<_i26.PageRouteInfo>? children})
      : super(
          M3DScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'M3DScannerRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i11.MCNCMillingView]
class MCNCMillingRoute extends _i26.PageRouteInfo<void> {
  const MCNCMillingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MCNCMillingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MCNCMillingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MCNCShopbotView]
class MCNCShopbotRoute extends _i26.PageRouteInfo<void> {
  const MCNCShopbotRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MCNCShopbotRoute.name,
          initialChildren: children,
        );

  static const String name = 'MCNCShopbotRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i13.MEmbroideryView]
class MEmbroideryRoute extends _i26.PageRouteInfo<void> {
  const MEmbroideryRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MEmbroideryRoute.name,
          initialChildren: children,
        );

  static const String name = 'MEmbroideryRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i14.MGCCLaserView]
class MGCCLaserRoute extends _i26.PageRouteInfo<void> {
  const MGCCLaserRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MGCCLaserRoute.name,
          initialChildren: children,
        );

  static const String name = 'MGCCLaserRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i15.MLaserCuttingView]
class MLaserCuttingRoute extends _i26.PageRouteInfo<void> {
  const MLaserCuttingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MLaserCuttingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MLaserCuttingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i16.MULSLaserView]
class MULSLaserRoute extends _i26.PageRouteInfo<void> {
  const MULSLaserRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MULSLaserRoute.name,
          initialChildren: children,
        );

  static const String name = 'MULSLaserRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i17.MVacuumFormingView]
class MVacuumFormingRoute extends _i26.PageRouteInfo<void> {
  const MVacuumFormingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MVacuumFormingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MVacuumFormingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i18.MVinylCuttingView]
class MVinylCuttingRoute extends _i26.PageRouteInfo<void> {
  const MVinylCuttingRoute({List<_i26.PageRouteInfo>? children})
      : super(
          MVinylCuttingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MVinylCuttingRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i19.MakerAccountView]
class MakerAccountRoute extends _i26.PageRouteInfo<MakerAccountRouteArgs> {
  MakerAccountRoute({
    _i27.Key? key,
    _i28.MakerModel? userData,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          MakerAccountRoute.name,
          args: MakerAccountRouteArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'MakerAccountRoute';

  static const _i26.PageInfo<MakerAccountRouteArgs> page =
      _i26.PageInfo<MakerAccountRouteArgs>(name);
}

class MakerAccountRouteArgs {
  const MakerAccountRouteArgs({
    this.key,
    this.userData,
  });

  final _i27.Key? key;

  final _i28.MakerModel? userData;

  @override
  String toString() {
    return 'MakerAccountRouteArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i20.MakerQRView]
class MakerQRRoute extends _i26.PageRouteInfo<MakerQRRouteArgs> {
  MakerQRRoute({
    _i27.Key? key,
    required String data,
    required String name,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          MakerQRRoute.name,
          args: MakerQRRouteArgs(
            key: key,
            data: data,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'MakerQRRoute';

  static const _i26.PageInfo<MakerQRRouteArgs> page =
      _i26.PageInfo<MakerQRRouteArgs>(name);
}

class MakerQRRouteArgs {
  const MakerQRRouteArgs({
    this.key,
    required this.data,
    required this.name,
  });

  final _i27.Key? key;

  final String data;

  final String name;

  @override
  String toString() {
    return 'MakerQRRouteArgs{key: $key, data: $data, name: $name}';
  }
}

/// generated route for
/// [_i21.NoContentView]
class NoContentRoute extends _i26.PageRouteInfo<void> {
  const NoContentRoute({List<_i26.PageRouteInfo>? children})
      : super(
          NoContentRoute.name,
          initialChildren: children,
        );

  static const String name = 'NoContentRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i1.ProfileTabView]
class ProfileTab extends _i26.PageRouteInfo<void> {
  const ProfileTab({List<_i26.PageRouteInfo>? children})
      : super(
          ProfileTab.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ProfileView]
class ProfileRoute extends _i26.PageRouteInfo<void> {
  const ProfileRoute({List<_i26.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i1.QRTabView]
class QRTab extends _i26.PageRouteInfo<void> {
  const QRTab({List<_i26.PageRouteInfo>? children})
      : super(
          QRTab.name,
          initialChildren: children,
        );

  static const String name = 'QRTab';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i23.QRView]
class QRRoute extends _i26.PageRouteInfo<void> {
  const QRRoute({List<_i26.PageRouteInfo>? children})
      : super(
          QRRoute.name,
          initialChildren: children,
        );

  static const String name = 'QRRoute';

  static const _i26.PageInfo<void> page = _i26.PageInfo<void>(name);
}

/// generated route for
/// [_i24.StudentAccountView]
class StudentAccountRoute extends _i26.PageRouteInfo<StudentAccountRouteArgs> {
  StudentAccountRoute({
    _i27.Key? key,
    _i29.StudentModel? userData,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          StudentAccountRoute.name,
          args: StudentAccountRouteArgs(
            key: key,
            userData: userData,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentAccountRoute';

  static const _i26.PageInfo<StudentAccountRouteArgs> page =
      _i26.PageInfo<StudentAccountRouteArgs>(name);
}

class StudentAccountRouteArgs {
  const StudentAccountRouteArgs({
    this.key,
    this.userData,
  });

  final _i27.Key? key;

  final _i29.StudentModel? userData;

  @override
  String toString() {
    return 'StudentAccountRouteArgs{key: $key, userData: $userData}';
  }
}

/// generated route for
/// [_i25.StudentQRView]
class StudentQRRoute extends _i26.PageRouteInfo<StudentQRRouteArgs> {
  StudentQRRoute({
    _i27.Key? key,
    required String data,
    required String name,
    List<_i26.PageRouteInfo>? children,
  }) : super(
          StudentQRRoute.name,
          args: StudentQRRouteArgs(
            key: key,
            data: data,
            name: name,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentQRRoute';

  static const _i26.PageInfo<StudentQRRouteArgs> page =
      _i26.PageInfo<StudentQRRouteArgs>(name);
}

class StudentQRRouteArgs {
  const StudentQRRouteArgs({
    this.key,
    required this.data,
    required this.name,
  });

  final _i27.Key? key;

  final String data;

  final String name;

  @override
  String toString() {
    return 'StudentQRRouteArgs{key: $key, data: $data, name: $name}';
  }
}
