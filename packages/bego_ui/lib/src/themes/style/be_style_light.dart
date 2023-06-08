import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_light.dart';
import 'package:bego_ui/src/ui_style/bego_text_style.dart';
import 'package:bego_ui/src/widgets/text/be_text_type.dart';
import 'package:flutter/widgets.dart';

class BeStyleLight implements BeStyle {
  const BeStyleLight({this.becolors = const BeColorsLight()});
  final BeColors becolors;

  @override
  TextStyle get bodyLarge => BegoTextStyle.bodyLarge;

  @override
  TextStyle get bodyMedium => BegoTextStyle.bodyMedium;

  @override
  TextStyle get bodySmall => BegoTextStyle.bodySmall;

  @override
  TextStyle get displayLarge => BegoTextStyle.displayLarge;
  @override
  TextStyle get displayMedium => BegoTextStyle.displayMedium;

  @override
  TextStyle get displaySmall => BegoTextStyle.displaySmall;

  @override
  TextStyle get headlineLarge => BegoTextStyle.headlineLarge;

  @override
  TextStyle get headlineMedium => BegoTextStyle.headlineMedium;

  @override
  TextStyle get headlineSmall => BegoTextStyle.headlineSmall;

  @override
  TextStyle get labelLarge => BegoTextStyle.labelLarge;

  @override
  TextStyle get labelMedium => BegoTextStyle.labelMedium;

  @override
  TextStyle get labelSmall => BegoTextStyle.labelSmall;

  @override
  TextStyle get titleLarge => BegoTextStyle.titleLarge;

  @override
  TextStyle get titleMedium => BegoTextStyle.titleMedium;

  @override
  TextStyle get titleSmall => BegoTextStyle.titleSmall;

  @override
  BorderRadius get borderRadius => BorderRadius.zero;

  @override
  TextStyle textStyle(BeTextType? textType, Breakpoint breakpoint) =>
      switch (textType) {
        BeTextType.displayLarge => displayLarge,
        BeTextType.bodyMedium => bodyMedium,
        _ => bodyMedium
      };
}
