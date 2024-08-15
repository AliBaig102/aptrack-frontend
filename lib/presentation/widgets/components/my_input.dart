// part of 'components_imports.dart';

import 'package:aptrack/core/constants/my_colors.dart';
import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final IconData prefixIcon;
  final Color color;
  final TextEditingController controller;
  const MyInput(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.color,
      required this.controller,
      this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: color,
      controller: controller,
      obscureText: obsecureText,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: color),
          filled: true,
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: color,
          fillColor: MyColors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: color,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: color,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: color,
            ),
          )),
    );
  }
}
