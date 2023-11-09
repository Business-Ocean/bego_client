import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:uibook/uibook.directories.g.dart';
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
        ThemeAddon<BeThemeData>(
          themeBuilder: themeBuilder,
          themes: [
            const WidgetbookTheme(
              name: 'Bego Light',
              data: BeThemeData.light(),
            ),
            const WidgetbookTheme(
              name: 'Bego Dark',
              data: BeThemeData.dark(),
            ),
          ],
        ),
        AlignmentAddon(),

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

  Widget themeBuilder(BuildContext context, BeThemeData theme, Widget child) {
    return BeTheme(
      darkTheme: theme,
      lightTheme: theme,
      themeMode: ThemeMode.light,
      child: Theme(
        data: BeTheme.createTheme(const BeThemeData.light()),
        child: Container(color: Colors.white, child: child),
      ),
    );
  }
}

// ThemeData get lightTheme => BeTheme.createTheme(const BeThemeData.light());
// ThemeData get darkTheme => BeTheme.createTheme(const BeThemeData.light());
