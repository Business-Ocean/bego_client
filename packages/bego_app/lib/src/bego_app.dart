import 'package:bego_app/src/controller/bego_app_controller.dart';
import 'package:bego_app/src/state/app_state.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BegoApp extends StatelessWidget {
  BegoApp({
    super.key,
    required AppState state,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.useInheritedMediaQuery = false,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.textDirection,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.fallbackLocale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.scrollBehavior,
    this.customTransition,
    this.translationsKeys,
    this.translations,
    this.onInit,
    this.onReady,
    this.onDispose,
    this.routingCallback,
    this.defaultTransition,
    this.getPages,
    this.opaqueRoute,
    this.enableLog = kDebugMode,
    this.logWriterCallback,
    this.popGesture,
    this.transitionDuration,
    this.defaultGlobalState,
    this.smartManagement = SmartManagement.full,
    this.binds = const [],
    this.unknownRoute,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.actions,
  })  : routeInformationProvider = null,
        backButtonDispatcher = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        controller = Get.put(BegoAppController(state), permanent: true);

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final GenerateAppTitle? onGenerateTitle;

  final CustomTransition? customTransition;
  final Color? color;
  final Map<String, Map<String, String>>? translationsKeys;
  final Translations? translations;
  final TextDirection? textDirection;
  final Locale? locale;
  final Locale? fallbackLocale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final ScrollBehavior? scrollBehavior;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Map<Type, Action<Intent>>? actions;
  final bool debugShowMaterialGrid;
  final ValueChanged<Routing?>? routingCallback;
  final Transition? defaultTransition;
  final bool? opaqueRoute;
  final VoidCallback? onInit;
  final VoidCallback? onReady;
  final VoidCallback? onDispose;
  final bool? enableLog;
  final LogWriterCallback? logWriterCallback;
  final bool? popGesture;
  final SmartManagement smartManagement;
  final List<Bind> binds;
  final Duration? transitionDuration;
  final bool? defaultGlobalState;
  final List<GetPage>? getPages;
  final GetPage? unknownRoute;
  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final RouterConfig<Object>? routerConfig;
  final BackButtonDispatcher? backButtonDispatcher;
  final bool useInheritedMediaQuery;
  // app state and controller
  final BegoAppController controller;

  @override
  Widget build(BuildContext context) {
    controller.state = controller.state.copyWith(
      themeMode: _getThemeMode(context),
    );
    return GetBuilder<BegoAppController>(
      // init: BegoAppController(state),
      builder: (controller) {
        return BeTheme(
          themeMode: controller.state.themeMode,
          child: GetMaterialApp(
            title: controller.state.appName,
            navigatorKey: navigatorKey,
            themeMode: controller.state.themeMode,
            scaffoldMessengerKey: scaffoldMessengerKey,
            home: home,
            routes: routes ?? const <String, WidgetBuilder>{},
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute: onUnknownRoute,
            useInheritedMediaQuery: useInheritedMediaQuery,
            navigatorObservers: navigatorObservers ?? <NavigatorObserver>[],
            builder: builder,
            textDirection: textDirection,
            onGenerateTitle: onGenerateTitle,
            color: color,
            theme: BeTheme.createTheme(const BeThemeData.light()),
            darkTheme: BeTheme.createTheme(const BeThemeData.dark()),
            locale: locale,
            fallbackLocale: fallbackLocale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            scrollBehavior: scrollBehavior,
            customTransition: customTransition,
            translationsKeys: translationsKeys,
            translations: translations,
            onInit: onInit,
            onReady: onReady,
            onDispose: onDispose,
            routingCallback: routingCallback,
            defaultTransition: defaultTransition,
            getPages: getPages,
            opaqueRoute: opaqueRoute,
            enableLog: enableLog ?? kDebugMode,
            logWriterCallback: logWriterCallback,
            popGesture: popGesture,
            transitionDuration: transitionDuration,
            defaultGlobalState: defaultGlobalState,
            smartManagement: smartManagement,
            binds: binds,
            unknownRoute: unknownRoute,
            highContrastTheme: highContrastTheme,
            highContrastDarkTheme: highContrastDarkTheme,
            actions: actions,
          ),
        );
      },
    );
  }

  ThemeMode _getThemeMode(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDark = controller.state.themeMode == ThemeMode.dark ||
        (controller.state.themeMode == ThemeMode.system &&
            brightness == Brightness.dark);
    return !isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
