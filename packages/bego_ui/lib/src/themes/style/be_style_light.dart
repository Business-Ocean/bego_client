import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_light.dart';
import 'package:flutter/widgets.dart';

class BeStyleLight implements BeStyle {
  const BeStyleLight({this.slColors = const BeColorsLight()});
  final BeColors slColors;

  @override
  BorderRadius get borderRadius => BorderRadius.zero;
}
