import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_dark.dart';
import 'package:bego_ui/src/ui_style/bego_text_style.dart';
import 'package:bego_ui/src/widgets/text/be_text_type.dart';
import 'package:flutter/widgets.dart';

class BeStyleDark implements BeStyle {
  const BeStyleDark({this.becolors = const BeColorsDark()});
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

  // To-do(sourav) : change to dynamic style based on breakpoint
  @override
  TextStyle textStyle(BeTextType? textType, Breakpoint breakpoint) =>
      switch (textType) {
        BeTextType.displayLarge => displayLarge,
        //.copyWith(fontSize:BegoTextStyle.displayLargeTextSize*BegoStyle.textScleFactor),
        BeTextType.displayMedium => displayMedium,
        //.copyWith(fontSize:BegoTextStyle.displayMediumTextSize*BegoStyle.textScleFactor),
        BeTextType.displaySmall => displaySmall,
        //.copyWith(fontSize:BegoTextStyle.displaySmallTextSize*BegoStyle.textScleFactor),
        BeTextType.headlineLarge => headlineLarge,
        //.copyWith(fontSize:BegoTextStyle.headlineLargeTextSize*BegoStyle.textScleFactor),
        BeTextType.headlineMedium => headlineMedium,
        //.copyWith(fontSize:BegoTextStyle.headlineMediumTextSize*BegoStyle.textScleFactor),
        BeTextType.headlineSmall => headlineSmall,
        //.copyWith(fontSize:BegoTextStyle.headlineSmallTextSize*BegoStyle.textScleFactor),
        BeTextType.titleLarge => titleLarge,
        //.copyWith(fontSize:BegoTextStyle.titleLargeTextSize*BegoStyle.textScleFactor),
        BeTextType.titleMedium => titleMedium,
        //.copyWith(fontSize:BegoTextStyle.titleMediumTextSize*BegoStyle.textScleFactor),
        BeTextType.titleSmall => titleSmall,
        //.copyWith(fontSize:BegoTextStyle.titleSmallTextSize*BegoStyle.textScleFactor),
        BeTextType.bodyLarge => bodyLarge,
        //.copyWith(fontSize:BegoTextStyle.bodyLargeTextSize*BegoStyle.textScleFactor),
        BeTextType.bodyMedium => bodyMedium,
        //.copyWith(fontSize:BegoTextStyle.bodyMediumTextSize*BegoStyle.textScleFactor),
        BeTextType.bodySmall => bodySmall,
        //.copyWith(fontSize:BegoTextStyle.bodySmallTextSize*BegoStyle.textScleFactor),
        BeTextType.labelLarge => labelLarge,
        //.copyWith(fontSize:BegoTextStyle.labelLargeTextSize*BegoStyle.textScleFactor),
        BeTextType.labelMedium => labelMedium,
        //.copyWith(fontSize:BegoTextStyle.labelMediumTextSize*BegoStyle.textScleFactor),
        BeTextType.labelSmall => labelSmall,
        //.copyWith(fontSize:BegoTextStyle.labelSmallTextSize*BegoStyle.textScleFactor),
        _ => bodyMedium
      };
}
