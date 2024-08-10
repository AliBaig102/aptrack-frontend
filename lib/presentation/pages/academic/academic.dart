part of 'academic_imports.dart';

@RoutePage()
class Academic extends StatelessWidget {
  const Academic({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyLayout(
      mobileScreen: AcademicMobile(),
      tabletScreen: DashboardDesktop(),
      desktopScreen: DashboardDesktop(),
    );
  }
}
