part of 'dashboard_imports.dart';

@RoutePage()
class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyLayout(
      mobileScreen: DashboardMobile(),
      tabletScreen: DashboardDesktop(),
      desktopScreen: DashboardDesktop(),
    );
  }
}
