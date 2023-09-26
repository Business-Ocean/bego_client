import 'package:bego/testing/counter_app.dart';
import 'package:bego_app/bego_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BegoApp(
    state: const AppState(
      appName: 'Bego',
      packageName: 'com.businessocean.bego',
      version: '0.0.1',
      isDarkTheme: false,
    ),
    home: MyHomePage(title: "Flutter GetX Tutorial"),
  ));
}
