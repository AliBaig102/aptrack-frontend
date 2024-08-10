// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aptrack/presentation/pages/academic/academic_imports.dart'
    as _i1;
import 'package:aptrack/presentation/pages/dashboard/dashboard_imports.dart'
    as _i2;
import 'package:aptrack/presentation/pages/login/login_imports.dart' as _i3;
import 'package:aptrack/presentation/pages/splash/splash_imports.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i5;

/// generated route for
/// [_i1.Academic]
class AcademicRoute extends _i5.PageRouteInfo<void> {
  const AcademicRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AcademicRoute.name,
          initialChildren: children,
        );

  static const String name = 'AcademicRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.Academic();
    },
  );
}

/// generated route for
/// [_i2.Dashboard]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.Dashboard();
    },
  );
}

/// generated route for
/// [_i3.Login]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.Login();
    },
  );
}

/// generated route for
/// [_i4.Splash]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.Splash();
    },
  );
}
