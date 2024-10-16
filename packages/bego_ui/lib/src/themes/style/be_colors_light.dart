import 'package:bego_ui/bego_ui.dart';
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
  Color get text => BegoColors.slate900;

  @override
  Color get intraction => BegoColors.gray.withAlpha(50);

  @override
  Color get accent => BegoColors.spaceCadet;

  @override
  Color get secandory => BegoColors.darkSpringGreen.withAlpha(100);

  @override
  Color get darkInverse => BegoColors.slate900;
  @override
  Color get lightInverse => BegoColors.white;
  @override
  Color get transparent => BegoColors.transparent;
  @override
  Color get overlayOutline => BegoColors.gray200;
  @override
  Color get formInputBackground => primary.withAlpha(5);
  @override
  Color get icon => BegoColors.slate900;

  @override
  Color get error => BegoColors.red500;
// -----------------------------------------------------
  @override
  Color get card => BegoColors.white;

  @override
  Color get dialogBackground => BegoColors.white;

  @override
  Color get disabled => BegoColors.gray300;

  @override
  Color get divider => secandory.withAlpha(30);

  @override
  Color get focus => primary.withAlpha(50);

  @override
  Color get highlight => BegoColors.slate50;

  @override
  Color get hint => BegoColors.gray400;

  @override
  Color get hover => BegoColors.gray100;

  @override
  Color get indicator => secandory;

  @override
  Color get primaryColorDark =>
      ColorUtils.getShade(primary, darker: true, value: 0.4);

  @override
  Color get primaryColorLight =>
      ColorUtils.getShade(primary, darker: false, value: 0.4);

  @override
  Color get scaffoldBackground => BegoColors.backgrounLight;

  @override
  Color get secondaryHeader => BegoColors.hookerGreen;

  @override
  Color get shadow => BegoColors.gray300;

  @override
  Color get splash => BegoColors.slate.withAlpha(50);

  @override
  Color get unselectedWidget => BegoColors.slate600;

  @override
  WidgetStateProperty<Color?>? get formState =>
      WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.disabled)) return disabled;
          if (states.contains(WidgetState.selected)) {
            return scaffoldBackground;
          }

          return BegoColors.amber;
        },
      );
}
