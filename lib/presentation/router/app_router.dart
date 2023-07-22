import 'package:flutter/material.dart';
import 'package:magd_soft_task/presentation/router/routes.dart';
import 'package:magd_soft_task/presentation/screens/shared/HelpScreen.dart';
import 'package:magd_soft_task/presentation/screens/shared/loginScreen.dart';
import 'package:magd_soft_task/presentation/screens/shared/splash_screen.dart';
import 'package:magd_soft_task/presentation/screens/shared/verfication_page.dart';

import '../screens/shared/HomeScreen.dart';

Route<dynamic> onGenerate(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AppRoutes.splashScreenRoute:
      return MaterialPageRoute(
          builder: (context) => const Splash_screen(), settings: routeSettings);
    case AppRoutes.loginPageRoute:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(), settings: routeSettings);
    case AppRoutes.verificationRoute:
      return MaterialPageRoute(
          builder: (context) => const VerificationPage(), settings: routeSettings);
    case AppRoutes.helpRoute:
      return MaterialPageRoute(
          builder: (context) => const HelpScreen(),
          settings: routeSettings);
    case AppRoutes.homeRoute:
      return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: routeSettings);

    default:
      return MaterialPageRoute(builder: (_) => const Splash_screen());
  }
}
