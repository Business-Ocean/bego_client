import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

InputDecorationTheme inputDecorationTheme(BeThemeData betheme) {
  const radius = BegoStyle.borderRadius12;
  final primary = betheme.becolors.primary;
  return InputDecorationTheme(
    fillColor: BegoColors.gray100,
    filled: true,
    // border: const OutlineInputBorder(borderRadius: borderRadius),
    errorMaxLines: 1,
    errorStyle:
        betheme.bestyle.bodySmall.copyWith(color: betheme.becolors.error),

    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    labelStyle: MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return betheme.bestyle.bodyMedium
            .copyWith(color: betheme.becolors.error);
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.bestyle.bodyMedium
            .copyWith(color: betheme.becolors.disabled);
      }
      return betheme.bestyle.bodyMedium;
    }),
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: radius,
    ),
    alignLabelWithHint: true,
    enabledBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide.none,
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide.none,
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: betheme.becolors.error),
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
    hintStyle: betheme.bestyle.titleMedium,
    hoverColor: primary.withAlpha(30),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    isCollapsed: true,
    activeIndicatorBorder: BorderSide(color: primary, width: 2),
  );
}
