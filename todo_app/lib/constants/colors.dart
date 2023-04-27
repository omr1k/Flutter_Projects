import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color AppColor = Color(0xFFECE3CF);
  static const Color AppAccentColor = Color(0xFFDECBA9);
  
  static const Color AppTextColor = Colors.black;

  static Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
    1,
  );
}
}