import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/state/app_state.dart';
import 'package:bego_core/bego_get.dart';
import 'package:flutter/material.dart';

class BegoAppController extends BePageController<AppState> {
  BegoAppController(super.value);

  void toggleTheme() {
    bool isDark = state.themeMode == ThemeMode.dark;
    final newState =
        state.copyWith(themeMode: !isDark ? ThemeMode.dark : ThemeMode.light);
    state = newState;
    Get.changeThemeMode(state.themeMode);
  }
}
