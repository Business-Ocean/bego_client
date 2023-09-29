import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class BeColorsDark implements BeColors {
  const BeColorsDark();

  @override
  bool get isDark => false;

  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(seedColor: primary);
  @override
  Color get primary => BegoColors.slate900;

  @override
  Color get text => BegoColors.white;

  @override
  Color get intraction => BegoColors.black;

  @override
  Color get accent => BegoColors.spaceCadet;

  @override
  Color get secandory => BegoColors.darkSpringGreen;

  @override
  Color get darkInverse => BegoColors.slate900;
  @override
  Color get lightInverse => BegoColors.blue100;
  @override
  Color get transparent => BegoColors.transparent;

  @override
  Color get overlayOutline => BegoColors.gray200;

  @override
  Color get formInputBackground => BegoColors.slate500;

  @override
  Color get icon => BegoColors.white;

  @override
  Color get error => BegoColors.red700;
// -----------------------------------------------------
  @override
  Color get card => BegoColors.slate800;

  @override
  Color get dialogBackground => BegoColors.black200;

  @override
  Color get disabled => BegoColors.gray200;

  @override
  Color get divider => BegoColors.gray300;

  @override
  Color get focus => BegoColors.slate600;

  @override
  Color get highlight => BegoColors.slate600;

  @override
  Color get hint => BegoColors.slate600;

  @override
  Color get hover => BegoColors.slate600;

  @override
  Color get indicator => BegoColors.slate600;

  @override
  Color get primaryColorDark => BegoColors.slate600;

  @override
  Color get primaryColorLight => BegoColors.slate600;

  @override
  Color get scaffoldBackground => BegoColors.slate800;

  @override
  Color get secondaryHeader => BegoColors.slate600;

  @override
  Color get shadow => BegoColors.slate600;

  @override
  Color get splash => BegoColors.slate600;

  @override
  Color get unselectedWidget => BegoColors.slate600;

  @override
  MaterialStateProperty<Color?>? get formState => throw UnimplementedError();
}
