import 'package:flutter/material.dart';
import 'package:qodera_task/common/helper/navigation/routes.dart';
import '../../../home_screen.dart';
import '../../../features/splash/presentation/view/screens/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case AppRoutes.homeScreen:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Center(child: Text("no path for ${settings.name}"))),
      );
  }
}
