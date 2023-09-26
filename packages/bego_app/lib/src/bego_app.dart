import 'package:bego_app/src/controller/bego_app_controller.dart';
import 'package:bego_app/src/state/app_state.dart';
import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BegoApp extends StatefulWidget {
  const BegoApp({
    super.key,
    required this.state,
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
    this.theme,
    this.darkTheme,
    this.themeMode = ThemeMode.system,
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
        routerConfig = null;

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
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeMode themeMode;
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

  final AppState state;

  @override
  State<BegoApp> createState() => BegoAppState();
}

class BegoAppState extends State<BegoApp> {
  @override
  void initState() {
    super.initState();
    Get.put(BegoAppController(widget.state), permanent: true);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BegoAppController>(
      init: BegoAppController(widget.state),
      builder: (controller) {
        final themeMode = switch (controller.state.isDarkTheme) {
          false => ThemeMode.light,
          true => ThemeMode.dark,
          _ => ThemeMode.system,
        };
        print("BegoApp called");
        return BeTheme(
          themeMode: themeMode,
          child: GetMaterialApp(
            navigatorKey: widget.navigatorKey,
            scaffoldMessengerKey: widget.scaffoldMessengerKey,
            home: widget.home,
            routes: widget.routes ?? const <String, WidgetBuilder>{},
            initialRoute: widget.initialRoute,
            onGenerateRoute: widget.onGenerateRoute,
            onGenerateInitialRoutes: widget.onGenerateInitialRoutes,
            onUnknownRoute: widget.onUnknownRoute,
            useInheritedMediaQuery: widget.useInheritedMediaQuery,
            navigatorObservers:
                widget.navigatorObservers ?? <NavigatorObserver>[],
            builder: widget.builder,
            textDirection: widget.textDirection,
            title: controller.state.appName,
            onGenerateTitle: widget.onGenerateTitle,
            color: widget.color,
            theme: BeTheme.createTheme(const BeThemeData.light()),
            darkTheme: BeTheme.createTheme(const BeThemeData.dark()),
            themeMode: themeMode,
            locale: widget.locale,
            fallbackLocale: widget.fallbackLocale,
            localizationsDelegates: widget.localizationsDelegates,
            localeListResolutionCallback: widget.localeListResolutionCallback,
            localeResolutionCallback: widget.localeResolutionCallback,
            supportedLocales: widget.supportedLocales,
            debugShowMaterialGrid: widget.debugShowMaterialGrid,
            showPerformanceOverlay: widget.showPerformanceOverlay,
            checkerboardRasterCacheImages: widget.checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: widget.checkerboardOffscreenLayers,
            showSemanticsDebugger: widget.showSemanticsDebugger,
            debugShowCheckedModeBanner: widget.debugShowCheckedModeBanner,
            shortcuts: widget.shortcuts,
            scrollBehavior: widget.scrollBehavior,
            customTransition: widget.customTransition,
            translationsKeys: widget.translationsKeys,
            translations: widget.translations,
            onInit: widget.onInit,
            onReady: widget.onReady,
            onDispose: widget.onDispose,
            routingCallback: widget.routingCallback,
            defaultTransition: widget.defaultTransition,
            getPages: widget.getPages,
            opaqueRoute: widget.opaqueRoute,
            enableLog: widget.enableLog ?? kDebugMode,
            logWriterCallback: widget.logWriterCallback,
            popGesture: widget.popGesture,
            transitionDuration: widget.transitionDuration,
            defaultGlobalState: widget.defaultGlobalState,
            smartManagement: widget.smartManagement,
            binds: widget.binds,
            unknownRoute: widget.unknownRoute,
            highContrastTheme: widget.highContrastTheme,
            highContrastDarkTheme: widget.highContrastDarkTheme,
            actions: widget.actions,
          ),
        );
      },
    );
  }
}
