import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> appInitalization() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark, // transparent status bar
    ),
  );
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
