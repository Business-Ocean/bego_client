import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

// ReadexPro-Bold.ttf
// ReadexPro-ExtraLight.ttf
// ReadexPro-Light.ttf
// ReadexPro-Medium.ttf
// ReadexPro-Regular.ttf
// ReadexPro-SemiBold.ttf
Typography typography = Typography.material2021();

TextTheme textTheme(BeThemeData betheme) => const TextTheme(
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

TextTheme primaryTextTheme(BeThemeData betheme) => const TextTheme();
