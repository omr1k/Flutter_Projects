// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'build_stars_view.dart';

class BuildMovieRatingView extends StatelessWidget {
  final double startSize;
  final double fontSize;

  const BuildMovieRatingView({
    Key? key,
    required this.startSize,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildStarsView(starSize: startSize),
        SizedBox(height: 5),
        Text(
          'From ${Random().nextInt(34846) + 55} users',
          style: TextStyle(
              color: AppColors.lightGreen,
              fontSize: fontSize,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                ),
              ]),
        ),
      ],
    );
  }
}
