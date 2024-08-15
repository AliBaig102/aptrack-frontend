// part of 'components_imports.dart';

import 'package:aptrack/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title;
  final Widget breadcrumb;
  const Header({super.key, required this.title, required this.breadcrumb});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.w,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
        ),
        const SizedBox(height: 8),

        // Breadcrumb and Settings Icon Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Breadcrumb
            breadcrumb,

            // Settings Icon with Dropdown
            PopupMenuButton<String>(
              icon: Icon(
                Icons.settings,
                color: MyColors.black,
                size: 28.sp,
              ),
              color: MyColors.white,
              elevation: 8,
              onSelected: (String result) {
                switch (result) {
                  case 'Settings':
                    // Handle settings action
                    break;
                  case 'Logout':
                    // Handle logout action
                    break;
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  padding: EdgeInsets.all(8.0),
                  value: 'Settings',
                  child: Text('Settings'),
                ),
                const PopupMenuItem<String>(
                  padding: EdgeInsets.all(8.0),
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
