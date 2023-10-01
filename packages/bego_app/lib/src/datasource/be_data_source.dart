// ignore_for_file: use_setters_to_change_properties

import 'package:bego_app/src/page/i_view_page.dart';

class BeDataSource {
  late IViewPage? _viewPage;

  IViewPage? get viewPage => _viewPage;

  void attach(IViewPage viewPage) => _viewPage = viewPage;

  void dettach() => _viewPage = null;

  // @override
  // void hideLoading() => _viewPage?.hideLoading();

  // @override
  // void showLoading() => _viewPage?.showLoading();

  // @override
  // void handleAction(
  //   EventAction action, {
  //   MessageStyle style = MessageStyle.success,
  // }) =>
  //     _viewPage?.handleAction(action);

  // @override
  // void showMessage(
  //   String title,
  //   String message, {
  //   MessageStyle style = MessageStyle.success,
  // }) =>
  //     _viewPage?.showMessage(title, message, style: style);
}
