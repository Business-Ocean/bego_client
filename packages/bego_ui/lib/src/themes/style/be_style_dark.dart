import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_dark.dart';
import 'package:flutter/widgets.dart';

class BeStyleDark implements BeStyle {
  const BeStyleDark({this.becolors = const BeColorsDark()});
  final BeColors becolors;

  @override
  BorderRadius get borderRadius => BorderRadius.zero;
}
