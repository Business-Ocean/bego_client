import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

final class BegoTextStyle {
  const BegoTextStyle._();

// Note : https://docs.flutter.dev/cookbook/design/package-fonts follow this
  static const packageName = 'bego_ui';
  static const fontFamily = 'ReadexPro';

  /// Text Display
  static const displayLargeTextSize = 57.0;
  static const displayLargeLineHeight = 64.0;
  static const displayMediumTextSize = 45.0;
  static const displayMediumLineHeight = 52.0;
  static const displaySmallTextSize = 36.0;
  static const displaySmallLineHeight = 44.0;
  // Text Heading
  static const headlineLargeTextSize = 32.0;
  static const headlineLargeLineHeight = 40.0;
  static const headlineMediumTextSize = 28.0;
  static const headlineMediumLineHeight = 36.0;
  static const headlineSmallTextSize = 24.0;
  static const headlineSmallLineHeight = 32.0;

  // Text Title
  static const titleLargeTextSize = 22.0;
  static const titleLargeLineHeight = 28.0;
  static const titleMediumTextSize = 16.0;
  static const titleMediumLineHeight = 24.0;
  static const titleSmallTextSize = 14.0;
  static const titleSmallLineHeight = 20.0;

  // Text Label
  static const labelLargeTextSize = 14.0;
  static const labelLargeLineHeight = 20.0;
  static const labelMediumTextSize = 12.0;
  static const labelMediumLineHeight = 16.0;
  static const labelSmallTextSize = 11.0;
  static const labelSmallLineHeight = 16.0;

  // Text Body
  static const bodyLargeTextSize = 16.0;
  static const bodyLargeLineHeight = 24.0;
  static const bodyMediumTextSize = 14.0;
  static const bodyMediumLineHeight = 20.0;
  static const bodySmallTextSize = 12.0;
  static const bodySmallLineHeight = 16.0;

  static const List<Shadow>? textShadow = null;

  static const TextStyle displayLarge = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: displayLargeTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: -0.25,
    height: displayLargeLineHeight / displayLargeTextSize,
  );
  static const TextStyle displayMedium = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: displayMediumTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: displayMediumLineHeight / displayMediumTextSize,
  );
  static const TextStyle displaySmall = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: displaySmallTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: displaySmallLineHeight / displaySmallTextSize,
  );
  static const TextStyle headlineLarge = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: headlineLargeTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: headlineLargeLineHeight / headlineLargeTextSize,
  );
  static const TextStyle headlineMedium = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: headlineMediumTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: headlineMediumLineHeight / headlineMediumTextSize,
  );
  static const TextStyle headlineSmall = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: headlineSmallTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: headlineSmallLineHeight / headlineSmallTextSize,
  );
  static const TextStyle titleLarge = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: titleLargeTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    height: titleLargeLineHeight / titleLargeTextSize,
  );
  static const TextStyle titleMedium = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: titleMediumTextSize,
    fontWeight: FontWeight.w500,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.1,
    height: titleMediumLineHeight / titleMediumTextSize,
  );
  static const TextStyle titleSmall = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: titleSmallTextSize,
    fontWeight: FontWeight.w500,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.1,
    height: titleSmallLineHeight / titleSmallTextSize,
  );
  static const TextStyle bodyLarge = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: bodyLargeTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.5,
    height: bodyLargeLineHeight / bodyLargeTextSize,
  );
  static const TextStyle bodyMedium = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: bodyMediumTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.25,
    height: bodyMediumLineHeight / bodyMediumTextSize,
  );
  static const TextStyle bodySmall = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: bodySmallTextSize,
    fontWeight: FontWeight.w400,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.25,
    height: bodySmallLineHeight / bodySmallTextSize,
  );
  static const TextStyle labelLarge = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: labelLargeTextSize,
    fontWeight: FontWeight.w500,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.1,
    height: labelLargeLineHeight / labelLargeTextSize,
  );
  static const TextStyle labelMedium = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: labelMediumTextSize,
    fontWeight: FontWeight.w500,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.5,
    height: labelMediumLineHeight / labelMediumTextSize,
  );
  static const TextStyle labelSmall = TextStyle(
    package: packageName,
    fontFamily: fontFamily,
    fontSize: labelSmallTextSize,
    fontWeight: FontWeight.w500,
    color: BegoColors.textColor,
    shadows: textShadow,
    letterSpacing: 0.5,
    height: labelSmallLineHeight / labelSmallTextSize,
  );
}
