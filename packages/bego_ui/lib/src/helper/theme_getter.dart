import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

extension ThemeStateGetter on State<dynamic> {
  BeThemeData get betheme => BeTheme.of(context);
  BeStyle get bestyles => BeTheme.of(context).style;
  BeColors get becolors => BeTheme.of(context).colors;
  BeEdgeInsets get beinset => BeTheme.ofInsets(context);
}

extension ThemeGetter on StatelessWidget {
  /// [BeStyle] helper extension for obtaining [BeThemeData] contains
  /// style, insets, colors attribute
  BeThemeData betheme(BuildContext context) => BeTheme.of(context);

  /// [BeStyle] helper extension for obtaining the style of contains
  /// TextStyle, ButtonStyle, RoundedCorner, Decoration, Shadow,
  /// Elevation anount etc
  BeStyle bestyles(BuildContext context) => BeTheme.of(context).style;
  BeColors becolors(BuildContext context) => BeTheme.of(context).colors;
  BeEdgeInsets beinsets(BuildContext context) => BeTheme.ofInsets(context);
}

extension MaterialStateHelpers on Iterable<WidgetState> {
  bool get isHovered => contains(WidgetState.hovered);
  bool get isFocused => contains(WidgetState.focused);
  bool get isPressed => contains(WidgetState.pressed);
  bool get isDragged => contains(WidgetState.dragged);
  bool get isSelected => contains(WidgetState.selected);
  bool get isScrolledUnder => contains(WidgetState.scrolledUnder);
  bool get isDisabled => contains(WidgetState.disabled);
  bool get isError => contains(WidgetState.error);
}
