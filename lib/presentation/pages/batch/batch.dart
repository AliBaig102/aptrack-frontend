part of 'batch_imports.dart';

@RoutePage()
class Batch extends StatelessWidget {
  const Batch({super.key});

  @override
  Widget build(BuildContext context) {
    return MyLayout(
      mobileScreen: BatchMobile(),
      tabletScreen: BatchMobile(),
      desktopScreen: BatchMobile(),
    );
  }
}
