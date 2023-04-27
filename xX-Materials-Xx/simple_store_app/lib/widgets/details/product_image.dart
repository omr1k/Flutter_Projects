import 'package:flutter/material.dart';

class ProductIamge extends StatelessWidget {
  const ProductIamge({
    super.key,
    required this.size,
    required this.image,
  });

  final Size size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.7,
      width: size.width * 0.7,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        height: size.width * 0.75,
        width: size.width * 0.75,
      ),
    );
  }
}
