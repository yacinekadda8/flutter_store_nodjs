import 'package:flutter/material.dart';

class GlobalVars {
 static const appBarGradient = LinearGradient(
  colors: [
    Color.fromARGB(255, 201, 29, 126),
    Color.fromARGB(255, 221, 125, 187),
  ],
  stops: [0.5, 1.0],
);

// static const secondaryColor = Color.fromRGBO(162, 255, 0, 1.0);
// static const backgroundColor = Colors.white;
// static const Color greyBackgroundColor = Color(0xffabacd3);
// static var selectedNavBarColor = const Color.fromARGB(255, 41, 59, 185);
// static const unselectedNavBarColor = Color.fromARGB(255, 0, 0, 0);

// from bard
  static const Color brandColor = Color(0xFF0079BD); // Blue
  static const Color primaryAccent = Color(0xFFF7B733); // Orange
  static const Color secondaryAccent = Color(0xFF2196F3); // Light Blue

  static const Color background = Color(0xFFFFFFFF); // White
  static const Color surface = Color(0xFFF2F2F2); // Light Grey
  static const Color text = Color(0xFF333333); // Black
  static const Color border = Color(0xFFEEEEEE); // Light Grey

  static const Color success = Color(0xFF4CAF50); // Green
  static const Color error = Color(0xFFF44336); // Red
  static const Color information = Color(0xFF03A9F4); // Blue
  static const Color warning = Color(0xFFFFC107); // Yellow

}