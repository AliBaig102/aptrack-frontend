part of 'splash_imports.dart';

@RoutePage()
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
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadedSlideAnimation(
              beginOffset: const Offset(0, 10),
              endOffset: const Offset(0, 0),
              child: Image.asset(
                "assets/images/aptrack-logo.png",
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor: Colors.grey,
                value: _controller
                    .value, // Update progress based on AnimationController's value
              ),
            ),
          ],
        ),
      ),
    );
  }
}
