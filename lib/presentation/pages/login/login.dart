part of 'login_imports.dart';

@RoutePage()
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Timer _timer;
  int _currentIndex = 0;
  final List<String> _backgroundImages = [
    'assets/images/background1.jpg',
    'assets/images/background3.jpg',
    'assets/images/background4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _backgroundImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage(_backgroundImages[_currentIndex]),
              fit: BoxFit.cover,
              fadeInDuration: const Duration(seconds: 1),
              fadeOutDuration: const Duration(seconds: 1),
            ),
          ),
          Center(
            child: Responsive(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.0.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 5.w,
                                  blurRadius: 7.w,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                30.h.heightBox, // Space for the image
                                "Login"
                                    .text
                                    .bold
                                    .size(34.spMin)
                                    .color(MyColors.black)
                                    .make(),
                                20.h.heightBox,
                                TextField(
                                  cursorColor: MyColors.grey,
                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                    filled: true,
                                    prefixIcon: const Icon(Icons.person),
                                    prefixIconColor: MyColors.grey,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                20.h.heightBox,
                                TextField(
                                  obscureText: true,
                                  cursorColor: MyColors.grey,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    prefixIcon: const Icon(Icons.lock),
                                    prefixIconColor: MyColors.grey,
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                        color: MyColors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                                50.h.heightBox,
                                FadeAnimation(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Handle login
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.primaryColor,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 15.h),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                      ),
                                      minimumSize: Size(double.infinity, 20.h),
                                    ),
                                    child: "Login"
                                        .text
                                        .white
                                        .size(10.sp)
                                        .align(TextAlign.center)
                                        .make(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -50,
                            left: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 50.r,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/aptrack-logo.png',
                                  width: 90,
                                  height: 90,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
