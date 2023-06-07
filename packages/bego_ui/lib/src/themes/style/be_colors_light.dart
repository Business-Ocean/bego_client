import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColors {
  const BeColorsLight();

  @override
  Color get primary => Colors.orange;

  @override
  Color get textColor => Colors.black;

  @override
  bool get isDark => false;
}
