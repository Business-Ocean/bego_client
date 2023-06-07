import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:flutter/material.dart';

class BeTheme extends StatelessWidget {
  const BeTheme({
    super.key,
    required this.child,
    this.lightTheme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
  });

  final Widget child;
  final BeThemeData? lightTheme;
  final BeThemeData? darkTheme;
  final ThemeMode themeMode;

  /// NOTE: In case don't want to thorw exeption either ensure parent
  /// widget is wraped with BeTheme
  static BeThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_BeTheme>();
    assert(
      widget != null,
      'Make sure you wrap widget with BeTheme '
      'before calling BeThemeData.of(context)',
    );
    return widget!.theme;
  }

  // static ThemeData createTheme(ThemeMode themeMode) {
  // final isDark = themeMode == ThemeMode.dark;
  // return createbegoTheme(isDark ? Brightness.dark : Brightness.light);
  // }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);
    final theme = isDark
        ? darkTheme ?? _defaultDarkTheme
        : lightTheme ?? _defaultLightTheme;

    return _BeTheme(
      theme: theme,
      child: child,
    );
  }
}

class _BeTheme extends InheritedWidget {
  const _BeTheme({
    required this.theme,
    required super.child,
  });

  final BeThemeData theme;

  /// change every time if there change in theme `return true`
  @override
  bool updateShouldNotify(covariant _BeTheme oldWidget) => true;
}

final BeThemeData _defaultLightTheme = _createTheme(Brightness.light);

final BeThemeData _defaultDarkTheme = _createTheme(Brightness.dark);

BeThemeData _createTheme(Brightness brightness) => brightness == Brightness.dark
    ? const BeThemeData.dark()
    : const BeThemeData.light();
