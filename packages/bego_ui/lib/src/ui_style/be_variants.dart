import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

part '_variants_helper.dart';

enum BeStyleVariant {
  success(
    color: Color(0xFF00CC99),
    background: Color(0x162F3032),
    iconData: Icons.done,
  ),
  error(
    color: Color(0xFFEB5757),
    background: Color(0x16EB5757),
    iconData: Icons.close,
  ),
  warning(
    color: Color(0xFFF2C94C),
    background: Color(0x16F2C94C),
    iconData: Icons.warning_amber,
  ),
  info(
    color: Color(0xFF5458F7),
    background: Color(0x165458F7),
    iconData: Icons.info_outline,
  ),
  none(
    color: BegoColors.transparent,
    background: BegoColors.transparent,
    iconData: IconData(0),
  );

  const BeStyleVariant({
    required this.color,
    required this.background,
    required this.iconData,
  });

  final Color color;
  final Color background;
  final IconData iconData;
}

enum BeDarkStyleVariant {
  success(
    color: Color(0xFF00CC99),
    background: Color(0xFF2F3032),
    iconData: Icons.done,
  ),
  error(
    color: Color(0xFFEB5757),
    background: Color(0xFF2F3032),
    iconData: Icons.close,
  ),
  warning(
    color: Color(0xFFF2C94C),
    background: Color(0xFF2F3032),
    iconData: Icons.warning_amber,
  ),
  info(
    color: Color(0xFF5458F7),
    background: Color(0xFF2F3032),
    iconData: Icons.info_outline,
  ),
  none(
    color: BegoColors.transparent,
    background: BegoColors.transparent,
    iconData: IconData(0),
  );

  const BeDarkStyleVariant({
    required this.color,
    required this.background,
    required this.iconData,
  });

  final Color color;
  final Color background;
  final IconData iconData;
}

enum BeThemeVariant { primary, secanory, accent, none }

enum BeFieldSizeVariant {
  small,
  medium,
  large,
  none;
}
