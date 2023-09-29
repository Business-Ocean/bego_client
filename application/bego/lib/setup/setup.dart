import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> appSystemConfigSetup() async {
  // can get platform brightness
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light, // transparent status bar
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
