import 'package:bego_core/bego_get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:uibook/uibook.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App(foldersExpanded: false, widgetsExpanded: false)
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themes = [
      WidgetbookTheme(name: 'Light', data: lightTheme),
      WidgetbookTheme(name: 'Dark', data: darkTheme),
    ];

    final scales = [
      1.0,
      0.8,
      1.5,
      2.0,
    ];
    return Widgetbook(
      directories: directories,
      integrations: const [],
      addons: [
        ThemeAddon<ThemeData>(
          initialTheme: themes.first,
          themes: themes,
          themeBuilder: themeBuilder,
        ),
        TextScaleAddon(
          scales: scales,
          initialScale: scales.first,
        ),
        DeviceFrameAddon(devices: Devices.all),
        // LocalizationAddon(locales: locales, localizationsDelegates: localizationsDelegates)
      ],
      appBuilder: (context, child) {
        return GetMaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          home: SafeArea(child: child),
        );
      },
    );
  }

  Widget themeBuilder(BuildContext context, ThemeData theme, Widget child) {
    return Theme(
      data: theme,
      child: child,
    );
  }
}

ThemeData get lightTheme => ThemeData.light(useMaterial3: true);
ThemeData get darkTheme => ThemeData.dark(useMaterial3: true);
