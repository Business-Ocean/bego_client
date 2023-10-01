import 'package:bego_app/src/actions/event_action.dart';

final class ChangeThemeAction extends EventAction {
  ChangeThemeAction(this.darkMode);
  final bool darkMode;
}
