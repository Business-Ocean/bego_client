import 'dart:ui';

import 'package:flutter/material.dart';

class BegoStyle {
  BegoStyle._();

  // static const Color blurLevel1 = Color.fromRGBO(41, 93, 141, 0.15);
  static final blurLevel1 = ImageFilter.blur(sigmaX: 6, sigmaY: 6);
  static final blurLevel2 = ImageFilter.blur(sigmaX: 12, sigmaY: 12);
  static final blurLevel3 = ImageFilter.blur(sigmaX: 25, sigmaY: 25);
  static final blurLevel4 = ImageFilter.blur(sigmaX: 50, sigmaY: 20);
  static const textScleFactor = 0.8;
  static const buttonTextSize = 14.0;
  static const strokWidth = 2.0;
  static const indicatorSize = 8.0;
  static const borderRadius = 8.0;
  //rounded
  static double rounded8 = 8;
  static double rounded12 = 12;
  static double rounded16 = 16;
  static double rounded20 = 20;

  //gap padding
  static const inputGapPadding = 16.0;

  // opacity
  static const double enabled = 1;
  static const double disabled = .32;

  static const BorderRadius cardRadiusMedium =
      BorderRadius.all(Radius.circular(16));
}
