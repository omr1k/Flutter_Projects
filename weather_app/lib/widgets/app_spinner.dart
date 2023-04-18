import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Constants/app_colors.dart';


class AppSpinner extends StatelessWidget {
  const AppSpinner({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.iOSDefultBlue,
        child: Center(
          child: SpinKitWave(
            color: AppColors.textColor,
            size: 70,
          ),
        ),
      ),
    );
  }
}