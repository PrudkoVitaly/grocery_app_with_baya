import 'package:flutter/material.dart';

import 'core/app_theme/app_theme.dart';
import 'futture/auth/presentation/screens/login_page.dart';
import 'futture/auth/presentation/screens/splash_screen.dart';
import 'futture/auth/presentation/screens/welcome_page.dart';
import 'futture/home/presentation/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      // home: SplashScreen(),
      // home: WelcomeScreen(
      //   title: "Welcome",
      //   description:
      //       "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
      // ),
      home: MainScreen(),
    );
  }
}
