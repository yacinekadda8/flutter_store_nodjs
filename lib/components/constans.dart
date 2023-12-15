import 'package:flutter/material.dart';

const String uri = "http://192.168.1.2:3000";
//const String uri = "http://10.0.2.2:3000";

class MyConstans {
  static const String logo = 'assets/images/amazon-logo.png';
  static const String avatar = 'assets/images/unknown-user-avatar.png';
  static const appBarGradient = LinearGradient(
    colors: [
      Color(0xFFF12C57),
      Color(0xFFEB345C),
    ],
    stops: [0.5, 1.0],
  );

// static const secondaryColor = Color.fromRGBO(162, 255, 0, 1.0);
// static const backgroundColor = Colors.white;
// static const Color greyBackgroundColor = Color(0xffabacd3);
// from bard
  static const Color redColorMain = Color(0xFFe1233c); //
  static const Color yellowPrimary = Color(0xFFf9bc01); // unselected
  static const Color lightBlueSecondary = Color(0xFF5a80ee); // selected
  //static const Color darkBlueSecondary = Color(0xFF213ea9); //

  static const Color background = Color(0xFFFFFFFF); //
  static const Color surface = Color(0xFFF2F2F2); //
  static const Color text = Color(0xFF242323); // Black
  static const Color textLight = Color(0xFF414040); // Black
  static const Color border = Color(0xFF242323); // Light Grey

  static const Color success = Color(0xFF4CAF50); // Green
  static const Color error = Color(0xFFF44336); // Red
  static const Color information = Color(0xFF03A9F4); // Blue
  static const Color warning = Color(0xFFFFC107); // Yellow

  static const List carouselImages = [
    'https://m.media-amazon.com/images/W/MEDIAX_792452-T1/images/I/614rDhrz2-L._SX1500_.jpg',
    'https://images.unsplash.com/photo-1701932521067-ab10be5e9e2a?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1700070729734-a90199154666?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        'https://images.unsplash.com/photo-1702208338334-c1f15ea7f57c?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1697978641724-65f9b88fe1ce?q=80&w=1376&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  ];

  static const List<Map<String, String>> categories = [
    {
      'title': 'Phones',
      'image': 'assets/images/categories/phones.png',
    },
    {
      'title': 'Computers',
      'image': 'assets/images/categories/computer.png',
    },
    {
      'title': 'Laptop',
      'image': 'assets/images/categories/laptop.png',
    },
    {
      'title': 'Accessories',
      'image': 'assets/images/categories/pc-and-laptop-accessories.png',
    },
    {
      'title': 'Tablets',
      'image': 'assets/images/categories/tablet2.png',
    },
    {
      'title': 'Watches',
      'image': 'assets/images/categories/watch.png',
    },
  ];
}
