import 'package:bego_ui/src/ui_style/bego_text_style.dart';
import 'package:flutter/material.dart';

// ReadexPro-Bold.ttf
// ReadexPro-ExtraLight.ttf
// ReadexPro-Light.ttf
// ReadexPro-Medium.ttf
// ReadexPro-Regular.ttf
// ReadexPro-SemiBold.ttf

TextTheme buildTextTheme() => const TextTheme(
      displayLarge: BegoTextStyle.displayLarge,
      displayMedium: BegoTextStyle.displayMedium,
      displaySmall: BegoTextStyle.displaySmall,
      headlineLarge: BegoTextStyle.headlineLarge,
      headlineMedium: BegoTextStyle.headlineMedium,
      headlineSmall: BegoTextStyle.headlineSmall,
      titleLarge: BegoTextStyle.titleLarge,
      titleMedium: BegoTextStyle.titleMedium,
      titleSmall: BegoTextStyle.titleSmall,
      bodyLarge: BegoTextStyle.bodyLarge,
      bodyMedium: BegoTextStyle.bodyMedium,
      bodySmall: BegoTextStyle.bodySmall,
      labelLarge: BegoTextStyle.labelLarge,
      labelMedium: BegoTextStyle.labelMedium,
      labelSmall: BegoTextStyle.labelSmall,
    );
