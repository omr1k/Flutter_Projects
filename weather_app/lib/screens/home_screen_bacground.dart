import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreenBackground extends StatelessWidget {
  const HomeScreenBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Image.asset('assets/images/clouds.jpg'))))
      ],
    );
  }
}
