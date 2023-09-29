import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/themes/style/material_state_property.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme(BeThemeData betheme) {
  const radius = BegoStyle.borderRadius12;
  final primary = betheme.becolors.primary;
  const border = Color.fromARGB(255, 235, 235, 241);
  return InputDecorationTheme(
    fillColor: BegoColors.gray100,
    filled: true,
    // border: const OutlineInputBorder(borderRadius: borderRadius),
    errorMaxLines: 1,
    errorStyle:
        betheme.bestyle.bodySmall.copyWith(color: betheme.becolors.error),
    floatingLabelAlignment: FloatingLabelAlignment.start,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
      borderSide: BorderSide(color: betheme.becolors.error, width: 2),
    ),
    outlineBorder: MaterialStateBorderSide.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: betheme.becolors.disabled);
      }
      return BorderSide(color: primary);
    }),

    errorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: betheme.becolors.error),
    ),
    focusColor: primary.withAlpha(20),
    suffixIconColor: betheme.becolors.accent,
    // contentPadding: EdgeInsets.zero,
    hintStyle:
        betheme.bestyle.titleMedium.copyWith(color: betheme.becolors.hint),
    hoverColor: primary.withAlpha(30),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isCollapsed: true,
    activeIndicatorBorder: BorderSide(color: primary, width: 2),
  );
}
