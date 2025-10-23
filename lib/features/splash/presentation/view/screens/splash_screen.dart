import 'package:flutter/material.dart';
import 'package:qodera_task/common/helper/navigation/navigation.dart';
import 'package:qodera_task/common/helper/navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Navigation().navigateAndRemoveUntil(routeName: AppRoutes.homeScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: FlutterLogo(),
      ),
    );
  }
}
