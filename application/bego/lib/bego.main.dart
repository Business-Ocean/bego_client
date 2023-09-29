import 'package:bego/routes/app_pages.dart';
import 'package:bego/setup/di/di.dart';
import 'package:bego/setup/setup.dart';
import 'package:bego_app/bego_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appSystemConfigSetup();
  setupConfig();
  runApp(
    BegoApp(
      state: const AppState(
        appName: 'Bego',
        packageName: 'com.businessocean.bego',
        version: '0.0.1',
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      // home: MyHomePage(title: 'Flutter GetX Tutorial'),
    ),
  );
}
