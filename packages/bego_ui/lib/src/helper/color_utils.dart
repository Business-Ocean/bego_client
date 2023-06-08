import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

final class ColorUtils {
  /// Returns a shade of a [Color] from a double value
  ///
  /// The 'darker' boolean determines whether the shade
  /// should be .1 darker or lighter than the provided color
  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }

  /// Returns a [MaterialColor] from a [Color] object
  static MaterialColor getMaterialColorFromColor(Color color) {
    final colorShades = <int, Color>{
      50: getShade(color, value: 0.5),
      100: getShade(color, value: 0.4),
      200: getShade(color, value: 0.3),
      300: getShade(color, value: 0.2),
      400: getShade(color),
      500: color, //Primary value
      600: getShade(color, darker: true),
      700: getShade(color, value: 0.15, darker: true),
      800: getShade(color, value: 0.2, darker: true),
      900: getShade(color, value: 0.25, darker: true),
    };
    return MaterialColor(color.value, colorShades);
  }

  /// Gets the text color based on a background color brightness
  static Color textColorFromBackground(Color background) =>
      getBrightness(background) == Brightness.light
          ? BegoColors.textColor
          : BegoColors.gray50;

  /// Gets brightness of a color (dark/light)
  static Brightness getBrightness(Color color) {
    final relativeLuminance = color.computeLuminance();
    const kThreshold = 0.15;
    return ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) >
            kThreshold)
        ? Brightness.light
        : Brightness.dark;
  }

  static MaterialStateProperty<Color> stateColor(List<Color> colors) =>
      MaterialStateProperty.resolveWith<Color>(
        (state) => getColor(state, colors),
      );

  static Color getColor(Set<MaterialState> states, List<Color> colors) {
    assert(colors.length != 4, 'color list must contain 4 elements');
    if (states.contains(MaterialState.pressed)) {
      return colors[1];
    }

    if (states.contains(MaterialState.hovered)) {
      return colors[2];
    }

    if (states.contains(MaterialState.focused)) {
      return colors[3];
    }

    return colors[0];
  }
}
