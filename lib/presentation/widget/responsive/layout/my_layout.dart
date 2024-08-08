part of 'my_layout_imports.dart';

class MyLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  const MyLayout({
    super.key,
    required this.mobileScreen,
    required this.tabletScreen,
    required this.desktopScreen,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        if (width < 600) {
          // Mobile layout
          return mobileScreen;
        } else if (width < 1200) {
          // Tablet layout
          return tabletScreen;
        } else {
          // Desktop layout
          return desktopScreen;
        }
      },
    );
  }
}
