import 'package:bego/routes/app_routes.dart';
import 'package:bego/setup/di/di.dart';
import 'package:bego/setup/setup.dart';
import 'package:bego_app/bego_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appSystemConfigSetup();
  await setupConfig();
  final deviceId = await BeDeviceInfo.getDeviceId();

  runApp(
    BegoApp.router(
      state: AppState(
        appName: 'Bego',
        packageName: 'com.businessocean.bego',
        version: '0.0.1',
        deviceId: deviceId,
        themeMode: ThemeMode.light,
      ),
      routerConfig: appRouter,
    ),
  );
}
