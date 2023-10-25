import 'package:bego_ui/src/helper/context_extensions.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:bego_ui/src/themes/_be_theme_creation.dart';
import 'package:bego_ui/src/themes/be_edge_insets.dart';
import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:bego_ui/src/themes/style/be_insets_mobile.dart';
import 'package:flutter/material.dart';

// typedef AppBeThemeBuilder = Widget Function(
//   BuildContext context, [
//   ThemeData theme,
//   GlobalKey<NavigatorState>? beNavigtor,
// ]);

class BeTheme extends StatelessWidget {
  const BeTheme({
    super.key,
    required this.child,
    this.lightTheme = const BeThemeData.light(),
    this.darkTheme = const BeThemeData.dark(),
    this.themeMode = ThemeMode.system,
    // this.beNavigtor,
    // this.appBuilder,
  });

  final Widget child;
  final BeThemeData lightTheme;
  final BeThemeData darkTheme;
  final ThemeMode themeMode;
  // final GlobalKey<NavigatorState>? beNavigtor;
  // final AppBeThemeBuilder? appBuilder;
  // final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// NOTE: In case don't want to thorw exeption either ensure parent
  /// widget is wraped with BeTheme
  static BeThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_BeTheme>();
    assert(
      widget != null,
      'Make sure you wrap widget with BeTheme '
      'before calling BeThemeData.of(context)',
    );
    return widget!.betheme;
  }

  static ThemeData createTheme(BeThemeData betheme) => createBegoTheme(betheme);

  static BeEdgeInsets ofInsets(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<_BeTheme>();
    assert(
      widget != null,
      'Make sure you wrap widget with BeTheme '
      'before calling BeThemeData.of(context)',
    );
    return widget!.beinsets;
  }

  // ThemeData createTheme(BeThemeData betheme) => createBegoTheme(betheme);
  BeEdgeInsets getBegoInsts(BeBreakpoint breakpoint) => switch (breakpoint) {
        // TO-DO(sourav): change insets for different breakpoint
        BeBreakpoint.extraLarge => const BeInsetsMobile(),
        BeBreakpoint.large => const BeInsetsMobile(),
        BeBreakpoint.medium => const BeInsetsMobile(),
        _ => const BeInsetsMobile(),
      };

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system && brightness == Brightness.dark);
    final beTheme = isDark ? darkTheme : lightTheme;
    final breakpoint = context.mediaQuery.screenBreakPoint;
    final beinsets = getBegoInsts(breakpoint);

    return _BeTheme(
      betheme: beTheme,
      beinsets: beinsets,
      child: child,
    );
  }
}

class _BeTheme extends InheritedWidget {
  const _BeTheme({
    required this.betheme,
    required this.beinsets,
    required super.child,
  });

  final BeThemeData betheme;
  final BeEdgeInsets beinsets;

  /// change every time if there change in theme `return true`
  @override
  bool updateShouldNotify(covariant _BeTheme oldWidget) =>
      betheme != oldWidget.betheme || beinsets != oldWidget.beinsets;
}
