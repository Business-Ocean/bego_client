import 'package:bego_app/src/actions/event_action.dart';
import 'package:bego_ui/bego_ui.dart';

/// IView is which does not hold any object just abstract method which will
/// get called for different view
/// It used for creating BaseView which represent the ui of the screen.
/// and It get Invoked by DataSource base on data response
/// [showMessage] for handling information received while getting data from
/// data source.
abstract class IViewPage {
  void showLoading();
  void hideLoading();
  void showMessage(
    String title,
    String message, {
    BeStyleVariant style = BeStyleVariant.success,
  });
  void handleAction(
    EventAction action, {
    BeStyleVariant style = BeStyleVariant.success,
  });
}
