import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:flutter/material.dart';

class BeColorsDark implements BeColors {
  const BeColorsDark();

  @override
  bool get isDark => true;

  @override
  Color get primary => Colors.blue;

  @override
  Color get textColor => Colors.white;
}
