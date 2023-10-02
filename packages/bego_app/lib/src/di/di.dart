// ignore_for_file: non_constant_identifier_names

import 'package:bego_app/bego_app.dart';
import 'package:get_it/get_it.dart';

final BegoDi = GetIt.instance;

void setupBegoApp() {
  BegoDi.registerSingleton(BegoAppController(AppState.initial()));
}
