part of 'splash_imports.dart';

@RoutePage()
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..forward().whenComplete(
        () => context.router.push(const LoginRoute()),
      );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(
            MySizes.maxMobileScreenSize, MySizes.maxMobileScreenSize * 1.6),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, chlild) {
          return Scaffold(
            backgroundColor: MyColors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadedSlideAnimation(
                    beginOffset: const Offset(0, 10),
                    endOffset: const Offset(0, 0),
                    child: Image.asset(
                      "assets/images/aptrack-logo.png",
                      width: 300.w,
                      height: 300.h,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 200,
                    height: 5.h,
                    child: LinearProgressIndicator(
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          MyColors.primaryColor),
                      backgroundColor: MyColors.grey,
                      value: _controller
                          .value, // Update progress based on AnimationController's value
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
