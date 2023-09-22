import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:uibook/uibook.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
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
    return Widgetbook.material(
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
        return Scaffold(body: child);
      },
    );
  }

  Widget themeBuilder(BuildContext context, ThemeData theme, Widget child) {
    return BeTheme(
      child: Theme(
        data: theme,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        child: child,
      ),
    );
  }
}

ThemeData get lightTheme => BeTheme.createTheme(const BeThemeData.light());
ThemeData get darkTheme => BeTheme.createTheme(const BeThemeData.light());
