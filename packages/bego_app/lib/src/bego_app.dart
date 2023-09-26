// ignore_for_file: unused_element

import 'package:bego_app/src/controller/bego_app_controller.dart';
import 'package:bego_app/src/state/bego_app_state.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// class BegoApp extends BasePage<BegoAppState, BePageController<BegoAppState>> {
//   const BegoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const _BegoApp();
//   }
// }

class BegoApp extends GetMaterialApp {
  const BegoApp({
    required this.appName,
    required this.packageName,
    required this.version,
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.home,
    super.routes = const <String, WidgetBuilder>{},
    super.initialRoute,
    super.onGenerateRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.useInheritedMediaQuery = false,
    super.navigatorObservers = const <NavigatorObserver>[],
    super.builder,
    super.textDirection,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    super.theme,
    super.darkTheme,
    super.themeMode = ThemeMode.system,
    super.locale,
    super.fallbackLocale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales = const <Locale>[Locale('en', 'US')],
    super.debugShowMaterialGrid = false,
    super.showPerformanceOverlay = false,
    super.checkerboardRasterCacheImages = false,
    super.checkerboardOffscreenLayers = false,
    super.showSemanticsDebugger = false,
    super.debugShowCheckedModeBanner = true,
    super.shortcuts,
    super.scrollBehavior,
    super.customTransition,
    super.translationsKeys,
    super.translations,
    super.onInit,
    super.onReady,
    super.onDispose,
    super.routingCallback,
    super.defaultTransition,
    super.getPages,
    super.opaqueRoute,
    super.enableLog = kDebugMode,
    super.logWriterCallback,
    super.popGesture,
    super.transitionDuration,
    super.defaultGlobalState,
    super.smartManagement = SmartManagement.full,
    super.binds = const [],
    super.unknownRoute,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.actions,
  });

  final String appName;
  final String packageName;
  final String version;

  @override
  Widget build(BuildContext context) {
    final widget = super.build(context);
    return GetBuilder<BegoAppController>(
      init: BegoAppController(BegoAppState(
        appName: appName,
        packageName: packageName,
        version: version,
      )),
      // initState: (_) {},
      builder: (controller) {
        return BeTheme(
          themeMode: themeMode,
          child: widget,
        );
      },
    );
  }
}
