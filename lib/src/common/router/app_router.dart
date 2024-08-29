import 'package:flutter/material.dart';
import 'package:weather_app/src/features/home/screen/home_screen.dart';

class AppRouter {
  const AppRouter._();

  static const String home = "/home";
  static const String splash = "/splash";
  static const String connection = "/connection";

  static void getHome(BuildContext context, String name) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(name: name),
      ),
    );
  }
}
