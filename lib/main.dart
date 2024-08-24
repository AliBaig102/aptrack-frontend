import 'package:aptrack/core/constants/my_strings.dart';
import 'package:aptrack/core/theme/app_themes.dart';
import 'package:aptrack/presentation/router/router_imports.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: MyStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      routerConfig: _appRouter.config(),
    );
  }
}
