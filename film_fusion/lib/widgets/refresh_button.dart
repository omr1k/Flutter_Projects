import 'package:film_fusion/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_spinkit/flutter_spinkit.dart';

class RefreshButton extends StatefulWidget {
  final VoidCallback onPressed;

  const RefreshButton({required this.onPressed});

  @override
  _RefreshButtonState createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<RefreshButton> {
  bool _isLoading = false;

  void _handleTap() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: IconButton(
        onPressed: _isLoading ? null : _handleTap,
        icon: _isLoading
            ? SpinKitRipple(color: AppColors.lightGreen)
            : Icon(
                Icons.refresh_rounded,
                size: 25,
                color: AppColors.white,
              ),
      ),
    );
  }
}
