import 'package:bego_ui/src/helper/color_utils.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

enum BeTextVariation {
  normal(BegoColors.textColor),
  primary(BegoColors.primary),
  secandory(BegoColors.secondary);

  const BeTextVariation(this.textColor);
  final Color? textColor;

  MaterialStateProperty<Color> get color =>
      MaterialStateProperty.resolveWith<Color>(_getColor);

  Color _getColor(Set<MaterialState> states) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorUtils.getShade(
        textColor ?? BegoColors.textColor,
        darker: true,
        value: .2,
      );
    }
    return textColor ?? BegoColors.textColor;
  }
}
