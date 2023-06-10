import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class BeColorsDark implements BeColors {
  const BeColorsDark();

  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(seedColor: primary);
  @override
  Color get primary => BegoColors.primary;

  @override
  Color get textColor => BegoColors.black;

  @override
  bool get isDark => false;

  @override
  Color get cardColor => BegoColors.white;

  @override
  Color get dialogBackgroundColor => BegoColors.black200;

  @override
  Color get disabledColor => BegoColors.gray400;

  @override
  Color get dividerColor => BegoColors.gray300;

  @override
  Color get focusColor => BegoColors.slate600;

  @override
  Color get highlightColor => BegoColors.slate600;

  @override
  Color get hintColor => BegoColors.slate600;

  @override
  Color get hoverColor => BegoColors.slate600;

  @override
  Color get indicatorColor => BegoColors.slate600;

  @override
  Color get primaryColor => BegoColors.slate600;

  @override
  Color get primaryColorDark => BegoColors.slate600;

  @override
  Color get primaryColorLight => BegoColors.slate600;

  @override
  Color get scaffoldBackgroundColor => BegoColors.slate600;

  @override
  Color get secondaryHeaderColor => BegoColors.slate600;

  @override
  Color get shadowColor => BegoColors.slate600;

  @override
  Color get splashColor => BegoColors.slate600;

  @override
  Color get unselectedWidgetColor => BegoColors.slate600;
}
