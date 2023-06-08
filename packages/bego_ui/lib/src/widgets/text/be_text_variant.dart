import 'package:bego_ui/src/helper/color_utils.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

enum BeTextVariant {
  none(null),
  normal(BegoColors.textColor),
  primary(BegoColors.primary),
  tertiary(BegoColors.tertiary),
  secandory(BegoColors.secondary),
  error(BegoColors.error);

  const BeTextVariant(this.textColor);
  final Color? textColor;

  MaterialStateProperty<Color> get colorState =>
      MaterialStateProperty.resolveWith<Color>(
        (states) =>
            ColorUtils.getStateColor(states, textColor ?? BegoColors.textColor),
      );
}
