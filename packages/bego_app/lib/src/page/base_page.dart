import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_core/bego_get.dart';
import 'package:flutter/material.dart';

/// [BasePage] <S> => State of the page or screen or it can be any responsive
/// component which required different state of the widget
/// @override different state of the [Widget] base on the [ViewState<S>] type
/// V is the BaseController which is responsible
/// for [BaseController.updateViewState]
/// [BaseController.updateState]
/// based on  [BaseController.viewState] different view state get rendered.
abstract class BasePage<S, V extends BePageController<S>> extends GetView<V> {
  const BasePage({super.key});
}

// extension FindViewState<S, V extends BaseController<S>> on BasePage<S, V> {
//   ViewState<S> get state => controller.viewState.value;
//   S get viewState => controller.viewState.value.state;
// }
