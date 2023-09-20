import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/widgets/text/be_text_type.dart';
import 'package:flutter/material.dart';

/// Style of ui component like heading text , body text,
/// button style appbar style, decoration shadow etc
abstract class BeStyle {
  TextStyle get headlineLarge;
  TextStyle get headlineMedium;
  TextStyle get headlineSmall;

  TextStyle get titleLarge;
  TextStyle get titleMedium;
  TextStyle get titleSmall;

  TextStyle get displayLarge;
  TextStyle get displayMedium;
  TextStyle get displaySmall;

  TextStyle get bodyLarge;
  TextStyle get bodyMedium;
  TextStyle get bodySmall;

  TextStyle get labelLarge;
  TextStyle get labelMedium;
  TextStyle get labelSmall;

  BorderRadius get borderRadius;

  BorderRadius get radius40;

  BorderRadius get cardRadius;

  /// used for checkbox component
  BorderRadius get xsRadius;

  TextStyle textStyle(BeTextType? textType, Breakpoint breakpoint);
}
