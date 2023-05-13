import 'package:flutter/material.dart';
import 'dart:math';

class BuildStarsView extends StatelessWidget {
  final double starSize;

  const BuildStarsView({super.key, required this.starSize});

  // MovieRating(double d, {Key? key, required this.starSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = Random().nextInt(50) / 10; // Generate random rating between 0 and 5
    final stars = <Widget>[];
    final fullStars = rating ~/ 1;
    final hasHalfStar = (rating - fullStars) > 0;
    final emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    for (int i = 0; i < fullStars; i++) {
      stars.add(Icon(Icons.star, size: starSize, color: Colors.amber));
    }

    if (hasHalfStar) {
      stars.add(Icon(Icons.star_half, size: starSize, color: Colors.amber));
    }

    for (int i = 0; i < emptyStars; i++) {
      stars.add(Icon(Icons.star_border, size: starSize, color: Colors.grey));
    }

    return Row(children: stars);
  }
}
