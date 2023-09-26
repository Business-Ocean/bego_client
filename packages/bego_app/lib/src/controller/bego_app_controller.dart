import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/state/app_state.dart';

class BegoAppController extends BePageController<AppState> {
  BegoAppController(super.value);

  void changeTheme() {
    state = state.copyWith(isDarkTheme: (state.isDarkTheme)!);
  }
}
