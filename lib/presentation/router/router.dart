part of 'router_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, path: "/", initial: true),
        AutoRoute(page: LoginRoute.page, path: "/login"),
        AutoRoute(page: DashboardRoute.page, path: "/dashboard"),
        AutoRoute(page: AcademicRoute.page, path: "/academic"),
        AutoRoute(page: BatchRoute.page, path: "/batch"),
        AutoRoute(page: EmployeeRoute.page, path: "/employee"),
      ];
}
