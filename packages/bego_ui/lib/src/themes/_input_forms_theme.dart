import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/themes/style/material_state_property.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme(BeThemeData betheme) {
  const radius = BegoStyle.borderRadius12;
  final primary = betheme.colors.primary;
  const border = BegoColors.gray300;
  return InputDecorationTheme(
    fillColor: BegoColors.gray100,
    filled: true,
    // border: const OutlineInputBorder(borderRadius: borderRadius),
    errorMaxLines: 1,
    errorStyle: betheme.style.bodySmall.copyWith(color: betheme.colors.error),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    labelStyle: inputLabelStyle(betheme),

    border: const OutlineInputBorder(
      borderSide: BorderSide(
        color: border,
      ),
      borderRadius: radius,
    ),
    alignLabelWithHint: true,
    enabledBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(
        color: border,
      ),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(
        color: border,
        width: 2,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(
        color: BegoColors.gray400,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: betheme.colors.error, width: 2),
    ),
    outlineBorder: MaterialStateBorderSide.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: betheme.colors.disabled);
      }
      return BorderSide(color: primary);
    }),

    errorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: betheme.colors.error),
    ),
    focusColor: primary.withAlpha(20),
    suffixIconColor: betheme.colors.accent,
    // contentPadding: EdgeInsets.zero,
    hintStyle: betheme.style.titleMedium.copyWith(color: betheme.colors.hint),
    hoverColor: primary.withAlpha(30),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isCollapsed: true,
    activeIndicatorBorder: BorderSide(color: primary, width: 2),
  );
}
