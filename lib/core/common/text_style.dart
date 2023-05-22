import 'dart:ui';

import 'package:flutter/material.dart';

class AppTextStyle {

  static TextStyle get appBarTitleStyle => const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
  
  static TextStyle get tileStyle => const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

    static TextStyle get descriptionStyle => const TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.italic,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      );
  
}