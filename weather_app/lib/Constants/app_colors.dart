import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.white;
  static const Color accentColor = Colors.red;
  static Color statusBarColor = Color(0xFF0066FF);
  static const Color textColor = Colors.white;
  static const Color iOSDefultBlue = Color(0xFF006ee6);

  static const LinearGradient backgroundColor = LinearGradient(
    colors: [
      Color(0xFF0066FF),
      Color(0xFF3399FF),
      Color(0xFF66CCFF),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
