import 'dart:math';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color stringToColor(String input) {
    final hash = input.hashCode;
    final random = Random(hash);
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
