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
  BorderRadius get borderRadius => BorderRadius.zero;

  @override
  TextStyle textStyle(BeTextType? textType, Breakpoint breakpoint) =>
      switch (textType) {
        BeTextType.displayLarge => displayLarge,
        BeTextType.bodyMedium => bodyMedium,
        _ => bodyMedium
      };

  @override
  TextStyle get bodyMedium => BegoTextStyle.bodyMedium;

  @override
  TextStyle get displayLarge => BegoTextStyle.displayLarge;
}
