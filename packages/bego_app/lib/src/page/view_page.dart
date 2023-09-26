import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/page/i_view_page.dart';
import 'package:bego_core/bego_get.dart';
import 'package:flutter/material.dart';

/// [ViewPage] <S> => State of the page or screen or it can be any responsive
/// component which required different state of the widget
/// @override different state of the [Widget] base on the [ViewState<S>] type
/// V is the BaseController which is responsible
/// for [BaseController.updateViewState]
/// [BaseController.updateState]
/// based on  [BaseController.viewState] different view state get rendered.
abstract class ViewPage<S, V extends BePageController<S>> extends GetView<V>
    implements IViewPage {
  const ViewPage({super.key});

  @override
  void hideLoading() {}

  @override
  void showInfoDialog(Map<String, String> data,
      {MessageStyle style = MessageStyle.success}) {}

  @override
  void showLoading() {}

  @override
  void showMessage(String title, String message,
      {MessageStyle style = MessageStyle.success}) {}
}

// extension FindViewState<S, V extends BaseController<S>> on BasePage<S, V> {
//   ViewState<S> get state => controller.viewState.value;
//   S get viewState => controller.viewState.value.state;
// }
