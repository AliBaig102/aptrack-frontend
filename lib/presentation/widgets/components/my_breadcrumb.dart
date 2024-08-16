import 'package:aptrack/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyBreadcrumb extends StatelessWidget {
  final String title;
  final bool isActive;
  final Future<void> Function() onPressed;
  final double size;
  const MyBreadcrumb({
    super.key,
    required this.title,
    required this.onPressed,
    required this.size,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.chevron_right,
          color: MyColors.black,
          size: size,
        ),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            overlayColor: Colors.transparent,
            elevation: isActive ? 4 : 0,
            backgroundColor: isActive ? MyColors.white : Colors.transparent,
            shadowColor: isActive ? MyColors.black : Colors.transparent,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: MyColors.black,
              fontSize: size,
            ),
          ),
        ),
      ],
    );
  }
}
