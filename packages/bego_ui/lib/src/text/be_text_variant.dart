import 'package:bego_ui/src/helper/color_utils.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

enum BeTextVariant {
  none(null, null),
  normal(BegoColors.textColor, BegoColors.blueGray50),
  primary(BegoColors.primary, BegoColors.pink50),
  tertiary(BegoColors.tertiary, BegoColors.blue50),
  secandory(BegoColors.secondary, BegoColors.orange50),
  error(BegoColors.red, BegoColors.red50);

  const BeTextVariant(this._textColor, this._textBackground);
  final Color? _textColor;
  final Color? _textBackground;

  MaterialStateProperty<Color> get colorState =>
      MaterialStateProperty.resolveWith<Color>(
        (states) => ColorUtils.getStateColor(
          states,
          _textColor ?? BegoColors.textColor,
        ),
      );

  Color get color => _textColor ?? BegoColors.textColor;
  Color get background => _textBackground ?? BegoColors.textColor.withAlpha(50);
}
