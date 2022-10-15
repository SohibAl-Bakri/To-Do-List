import 'package:flutter/material.dart';

class AppColors {
  // * Convert Color from Hex to type Flutter 0xFFdddddd
  static Color _colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static final Color cabatchino = _colorFromHex('#c9c182');
  static final Color cramel = _colorFromHex('#ECCDC9');
  static final Color greenBlue = _colorFromHex('#9ED2C6');
  static final Color skyBlue = _colorFromHex('#54BAB9');
}
