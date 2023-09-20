import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

class BeColorsLight implements BeColors {
  const BeColorsLight();

  @override
  bool get isDark => false;
  @override
  ColorScheme get colorScheme => ColorScheme.fromSeed(seedColor: primary);
  @override
  Color get primary => BegoColors.roseRed;

  @override
  Color get text => BegoColors.black;

  @override
  Color get intraction => BegoColors.gray.withAlpha(50);

  @override
  Color get accent => BegoColors.spaceCadet;

  @override
  Color get secandory => BegoColors.darkSpringGreen;

  @override
  Color get darkInverse => isDark ? BegoColors.white : BegoColors.slate900;
  @override
  Color get lightInverse => isDark ? BegoColors.black : BegoColors.white;
  @override
  Color get transparent => BegoColors.transparent;
// -----------------------------------------------------
  @override
  Color get card => BegoColors.white;

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
  Color get scaffoldBackground => BegoColors.white;

  @override
  Color get secondaryHeader => BegoColors.slate600;

  @override
  Color get shadow => BegoColors.slate600;

  @override
  Color get splash => BegoColors.slate600;

  @override
  Color get unselectedWidget => BegoColors.slate600;

  @override
  MaterialStateProperty<Color?>? get formState =>
      MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) return disabled;
          if (states.contains(MaterialState.selected)) {
            return scaffoldBackground;
          }

          return BegoColors.amber;
        },
      );
}
