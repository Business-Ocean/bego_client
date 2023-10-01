import 'package:bego_app/src/actions/event_action.dart';
import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/page/i_view_page.dart';
import 'package:flutter/material.dart';

abstract class ViewPage<S, V extends BePageController<S>>
    extends StatelessWidget implements IViewPage {
  const ViewPage({super.key});

  @override
  void hideLoading() {}

  @override
  void handleAction(
    EventAction action, {
    MessageStyle style = MessageStyle.success,
  }) {}

  @override
  void showLoading() {}

  @override
  void showMessage(
    String title,
    String message, {
    MessageStyle style = MessageStyle.success,
  }) {}
}
