import 'package:flutter/material.dart';

import '../../constants.dart';




class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key, required this.fillColor, required this.isSelect,
  });

  final Color fillColor;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
      padding: EdgeInsets.all(3.0),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: isSelect ? Colors.yellow : Colors.transparent)),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color:fillColor),
      ),
    );
  }
}
