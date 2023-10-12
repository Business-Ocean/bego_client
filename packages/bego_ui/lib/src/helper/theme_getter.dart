import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

extension ThemeStateGetter on State<dynamic> {
  BeThemeData get betheme => BeTheme.of(context);
  BeStyle get bestyles => BeTheme.of(context).bestyle;
  BeColors get becolors => BeTheme.of(context).becolors;
  BeEdgeInsets get beinset => BeTheme.ofInsets(context);
}

extension ThemeGetter on StatelessWidget {
  /// [BeStyle] helper extension for obtaining [BeThemeData] contains
  /// style, insets, colors attribute
  BeThemeData betheme(BuildContext context) => BeTheme.of(context);

  /// [BeStyle] helper extension for obtaining the style of contains
  /// TextStyle, ButtonStyle, RoundedCorner, Decoration, Shadow,
  /// Elevation anount etc
  BeStyle bestyles(BuildContext context) => BeTheme.of(context).bestyle;
  BeColors becolors(BuildContext context) => BeTheme.of(context).becolors;
  BeEdgeInsets beinsets(BuildContext context) => BeTheme.ofInsets(context);
}

extension MaterialStateHelpers on Iterable<MaterialState> {
  bool get isHovered => contains(MaterialState.hovered);
  bool get isFocused => contains(MaterialState.focused);
  bool get isPressed => contains(MaterialState.pressed);
  bool get isDragged => contains(MaterialState.dragged);
  bool get isSelected => contains(MaterialState.selected);
  bool get isScrolledUnder => contains(MaterialState.scrolledUnder);
  bool get isDisabled => contains(MaterialState.disabled);
  bool get isError => contains(MaterialState.error);
}
