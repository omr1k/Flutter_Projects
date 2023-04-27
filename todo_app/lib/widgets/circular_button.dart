import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class CircularButton extends StatelessWidget {

  final String buttonText;

  const CircularButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.AppTextColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
