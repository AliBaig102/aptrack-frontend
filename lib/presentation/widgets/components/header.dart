import 'package:aptrack/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  const Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
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
            const Row(
              children: [
                Text(
                  "Home",
                  style: TextStyle(color: MyColors.black),
                ),
                Icon(Icons.chevron_right, color: MyColors.black),
                Text(
                  "Dashboard",
                  style: TextStyle(color: MyColors.black),
                ),
              ],
            ),

            // Settings Icon with Dropdown
            PopupMenuButton<String>(
              icon: const Icon(Icons.settings, color: MyColors.black),
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
