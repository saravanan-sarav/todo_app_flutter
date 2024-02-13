import 'dart:math';

import 'package:flutter/material.dart';

class AppColor {
  static const Color grey = Color(0xFFBDBDBD);

  static Color generateRandomColor() {
    final random = Random();

    final int red = random.nextInt(256);
    final int green = random.nextInt(256);
    final int blue = random.nextInt(256);
    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
