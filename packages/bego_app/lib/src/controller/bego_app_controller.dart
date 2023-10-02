import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/state/app_state.dart';

class BegoAppController extends BePageController<AppState> {
  BegoAppController(super.state);

  void toggleTheme() {
    // final isDark = state.themeMode == ThemeMode.dark;
    // final ns =
    //     state.copyWith(themeMode: !isDark ? ThemeMode.dark : ThemeMode.light);
    // updageState(ns);
    // Get.changeThemeMode(state.themeMode);
  }
}
