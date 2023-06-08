import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_light.dart';
import 'package:flutter/widgets.dart';

class BeStyleLight implements BeStyle {
  const BeStyleLight({this.becolors = const BeColorsLight()});
  final BeColors becolors;

  @override
  BorderRadius get borderRadius => BorderRadius.zero;
}
