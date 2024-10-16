// This file is "main.dart"
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'app_state.freezed.dart';
// optional: Since our BegoAppState class is serializable, we must add this line.
// But if BegoAppState was not serializable, we could skip it.
// part 'bego_app_state.g.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required String appName,
    required String packageName,
    required String version,
    required String? deviceId,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppState;

  factory AppState.initial() =>
      const AppState(appName: '', deviceId: null, packageName: '', version: '');
}
