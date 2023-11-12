import 'dart:math' as math;

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
    final c = darker
        ? hsl.withLightness(
            (hsl.lightness - value / 2).clamp(0.0, 1.0),
          )
        : hsl.withLightness(
            (hsl.lightness + value / 3).clamp(0.0, 1.0),
          );

    return c.toColor();
  }

  /// Create material color palette from `Color`.
  static MaterialColor createMaterialColor(Color color) {
    final strengths = [.05];
    final swatch = <int, Color>{};
    final r = color.red;
    final g = color.green;
    final b = color.blue;

    for (var i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }

    for (final strength in strengths) {
      final ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }

    return MaterialColor(color.value, swatch);
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

  static Color getStateColor(Set<MaterialState> states, Color textColor) {
    const interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return ColorUtils.getShade(
        textColor,
        darker: true,
        value: .2,
      );
    }
    return textColor;
  }

  static Color getRandomColor({double opacity = 1.0}) =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(opacity);

  static Color solidOpacity(Color color, {double opacity = 0.10}) {
    if (opacity < 0.0) {
      opacity = 0.0;
    } else if (opacity > 1.0) {
      opacity = 1.0;
    }

    final alpha = (opacity * 255).round();
    final red = color.red;
    final green = color.green;
    final blue = color.blue;

    return Color.fromARGB(alpha, red, green, blue);
  }
}

/// Extensions on [Color] to brighten, lighten, darken and blend colors and
/// can get a shade for gradients.
///
/// Some of the extensions are rewrites of TinyColor's functions
/// https://pub.dev/packages/tinycolor. The TinyColor algorithms have also
/// been modified to use Flutter's HSLColor class instead of the custom one in
/// the TinyColor lib. The functions from TinyColor re-implemented as Color
/// extensions here are [brighten], [lighten] and [darken]. They are used
/// for color calculations in FlexColorScheme, but also exposed for reuse.
///
/// Another frequently used extension is [blend] and [blendAlpha] used to blend
/// two colors using alpha as a percentage or as an 8-bit int alpha value.
/// This extension is used to calculate branded surface
/// colors used by FlexColorScheme's branded surfaces and for automatic dark
/// color schemes from a light scheme.
///
/// The [getShadeColor] extension is less frequently used and when used,
/// typically used to color makes colors shades for gradient AppBars, with
/// default setting to not change black and white.
///
/// The color extension also include getting a color's RGB hex code as a string
/// in two different formats. Extension [hexCode] returns a Flutter style
/// HEX code string of a Color value, meaning it starts with 0x and alpha value
/// before the RGB Hex values. The plain [hex] extension returns a typical
/// API formatted hex color string starting with # and no alpha value.
extension FlexColorExtensions on Color {
  /// Brightens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color brighten([int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;
    final color = Color.fromARGB(
      alpha,
      math.max(0, math.min(255, red - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, green - (255 * -(amount / 100)).round())),
      math.max(0, math.min(255, blue - (255 * -(amount / 100)).round())),
    );
    return color;
  }

  /// Lightens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color lighten([int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.white;
    // HSLColor returns saturation 1 for black, we want 0 instead to be able
    // lighten black color up along the grey scale from black.
    final hsl = this == const Color(0xFF000000)
        ? HSLColor.fromColor(this).withSaturation(0)
        : HSLColor.fromColor(this);
    return hsl
        .withLightness(math.min(1, math.max(0, hsl.lightness + amount / 100)))
        .toColor();
  }

  /// Darkens the color with the given integer percentage amount.
  /// Defaults to 10%.
  Color darken([int amount = 10]) {
    if (amount <= 0) return this;
    if (amount > 100) return Colors.black;
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness(math.min(1, math.max(0, hsl.lightness - amount / 100)))
        .toColor();
  }

  /// Get the right black or white contrasting onColor for a color.
  ///
  /// The onColor is white if the color has brightness dark and black if
  /// the color has brightness light.
  ///
  /// Use the function to get black/white color typically used for text and
  /// icons when they are placed on a surface/background using `color` as its
  /// background color.
  Color get onColor =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light
          ? Colors.black
          : Colors.white;

  /// Returns true if the color's brightness is [Brightness.light], else false.
  bool get isLight =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light;

  /// Returns true if the color's brightness is [Brightness.dark], else false.
  bool get isDark =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.dark;

  /// Blend in the given input Color with a percentage of alpha.
  ///
  /// You typically apply this on a background color, light or dark
  /// to create a background color with a hint of a color used in a theme.
  ///
  /// This is a use case of the alphaBlend static function that exists in
  /// dart:ui Color. It is used to create the branded surface colors in
  /// FlexColorScheme and to calculate dark scheme colors from light ones,
  /// by blending in white color with light scheme color.
  ///
  /// Defaults to 10% alpha blend of the passed in Color value.
  Color blend(Color input, [int amount = 10]) {
    // Skip blending for impossible value and return the instance color value.
    if (amount <= 0) return this;
    // Blend amounts >= 100 results in the input Color.
    if (amount >= 100) return input;
    return Color.alphaBlend(input.withAlpha(255 * amount ~/ 100), this);
  }

  /// Blend in the given input Color with an alpha value.
  ///
  /// You typically apply this on a background color, light or dark
  /// to create a background color with a hint of a color used in a theme.
  ///
  /// This is a use case of the alphaBlend static function that exists in
  /// dart:ui Color. It is used to create the branded surface colors in
  /// FlexColorScheme and to calculate dark scheme colors from light ones,
  /// by blending in white color with light scheme color.
  ///
  /// Defaults to alpha 0x0A alpha blend of the passed in Color value,
  /// which is 10% alpha blend.
  Color blendAlpha(Color input, [int alpha = 0x0A]) {
    // Skip blending for impossible value and return the instance color value.
    if (alpha <= 0) return this;
    // Blend amounts >= 255 results in the input Color.
    if (alpha >= 255) return input;
    return Color.alphaBlend(input.withAlpha(alpha), this);
  }

  /// The [getShadeColor] extension is used to make a color darker or lighter,
  /// the [shadeValue] defines the amount in % that the shade should be changed.
  ///
  /// It can be used to make a shade of a color to be used in a gradient.
  /// By default it makes a color that is 15% lighter. If lighten is false
  /// it makes a color that is 15% darker by default.
  ///
  /// By default it does not affect black and white colors, but
  /// if [keepWhite] is set to false, it will darken white color when [lighten]
  /// is false and return a grey color. Wise versa for black with [keepBlack]
  /// set to false, it will lighten black color, when [lighten] is true and
  /// return a grey shade.
  ///
  /// White cannot be made lighter and black cannot be made
  /// darker, the extension just returns white or black for such attempts, with
  /// a quick exist from the call.
  Color getShadeColor({
    int shadeValue = 15,
    bool lighten = true,
    bool keepBlack = true,
    bool keepWhite = true,
  }) {
    if (shadeValue <= 0) return this;
    var usedShadeValue = shadeValue;
    if (usedShadeValue > 100) usedShadeValue = 100;

    // Trying to make black darker, just return black
    if (this == Colors.black && !lighten) return this;
    // Black is defined to be kept as black.
    if (this == Colors.black && keepBlack) return this;
    // Make black lighter as lighten was set and we do not keepBlack
    if (this == Colors.black) return this.lighten(usedShadeValue);

    // Trying to make white lighter, just return white
    if (this == Colors.white && lighten) return this;
    // White is defined to be kept as white.
    if (this == Colors.white && keepWhite) return this;
    // Make white darker as we do not keep white.
    if (this == Colors.white) return darken(usedShadeValue);
    // We are dealing with some other color than white or black, so we
    // make it lighter or darker based on flag and requested shade %
    if (lighten) {
      return this.lighten(usedShadeValue);
    } else {
      return darken(usedShadeValue);
    }
  }

  /// Return uppercase Flutter style hex code string of the color.
  String get hexCode => value.toRadixString(16).toUpperCase().padLeft(8, '0');

  /// Return uppercase RGB hex code string, with # and no alpha value.
  /// This format is often used in APIs and in CSS color values..
  String get hex =>
      '#${value.toRadixString(16).toUpperCase().padLeft(8, '0').substring(2)}';
}

/// Extensions on [String].
///
/// Included extensions are, [toColor] to convert a String to a Color.
/// To [capitalize] the first letter in a String and [dotTail] to get
/// remaining string after first dot "." in a String.
extension FlexStringExtensions on String {
  /// Convert a HEX value encoded (A)RGB string to a Dart Color.
  ///
  /// * The string may include the '#' char, but does not have to.
  /// * String may also include '0x' Dart Hex indicator, but does not have to.
  /// * Any '#' '0x' patterns are trimmed out and String is assumed to be Hex.
  /// * The String may start with alpha channel hex value, but does not have to,
  ///   if alpha value is missing "FF" is used for alpha.
  /// * String may be longer than 8 chars, after trimming out # and 0x, it will
  ///   be RIGHT truncated to max 8 chars before parsing.
  ///
  /// IF the resulting string cannot be parsed to a Color, is empty or null
  /// THEN fully opaque black color is returned ELSE the Color is returned.
  Color get toColor {
    if (this == '') return const Color(0xFF000000);
    var hexColor = replaceAll('#', '');
    hexColor = hexColor.replaceAll('0x', '');
    hexColor = hexColor.padLeft(6, '0');
    hexColor = hexColor.padLeft(8, 'F');
    final length = hexColor.length;
    return Color(
      int.tryParse('0x${hexColor.substring(length - 8, length)}') ?? 0xFF000000,
    );
  }

  /// Capitalize the first letter in a string.
  String get capitalize =>
      (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();

  /// Return the string remaining in a string after the last "." in a String,
  /// if there is no "." the string itself is returned.
  ///
  /// This function can be used to e.g. return the enum tail value from an
  /// enum's standard toString method.
  String get dotTail => split('.').last;
}
