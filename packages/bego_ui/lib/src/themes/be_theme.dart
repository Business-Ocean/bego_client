import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:bego_ui/src/themes/_be_theme_creation.dart';
import 'package:bego_ui/src/themes/be_edge_insets.dart';
import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:bego_ui/src/themes/style/be_insets_mobile.dart';
import 'package:flutter/material.dart';

typedef AppBeThemeBuilder = Widget Function(
  BuildContext context, [
  ThemeData theme,
  GlobalKey<NavigatorState>? beNavigtor,
]);

class BeTheme extends StatelessWidget {
  const BeTheme({
    super.key,
    Widget? child,
    this.lightTheme = const BeThemeData.light(),
    this.darkTheme = const BeThemeData.dark(),
    this.themeMode = ThemeMode.system,
    this.beNavigtor,
    this.appBuilder,
  })  : _child = child ?? zeroWidget,
        assert(
          child != null || appBuilder != null,
          'Child and appBuilder both can\'t be null',
        );

  final Widget _child;
  final BeThemeData lightTheme;
  final BeThemeData darkTheme;
  final ThemeMode themeMode;
  final GlobalKey<NavigatorState>? beNavigtor;
  final AppBeThemeBuilder? appBuilder;
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
  BeEdgeInsets getBegoInsts(Breakpoint breakpoint) => switch (breakpoint) {
        // TO-DO(sourav): change insets for different breakpoint
        Breakpoint.extraLarge => const BeInsetsMobile(),
        Breakpoint.large => const BeInsetsMobile(),
        Breakpoint.medium => const BeInsetsMobile(),
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
    final theme = createBegoTheme(beTheme);
    return _BeTheme(
      betheme: beTheme,
      beinsets: beinsets,
      child: appBuilder?.call(
            context,
            createBegoTheme(beTheme),
            beNavigtor,
          ) ??
          _child,
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
