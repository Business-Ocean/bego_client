import 'package:bego_app/src/actions/event_action.dart';
import 'package:bego_app/src/controller/be_page_controller.dart';
import 'package:bego_app/src/di/di.dart';
import 'package:bego_app/src/page/i_view_page.dart';
import 'package:bego_app/src/state/be_data.dart';
import 'package:bego_app/src/widget/be_error_widget.dart';
import 'package:bego_component/bego_component.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

abstract class ViewPage<S, V extends BePageController<S>>
    extends StatelessWidget implements IViewPage {
  ViewPage({super.key});
  final V controller = BegoDi.get<V>();
  @override
  void hideLoading() {}

  @override
  void handleAction(
    EventAction action, {
    BeStyleVariant style = BeStyleVariant.success,
  }) {}

  @override
  void showLoading() {}

  @override
  void showMessage(
    String title,
    String message, {
    BeStyleVariant style = BeStyleVariant.success,
  }) {}

  @override
  Widget build(BuildContext context) => StreamBuilder<BeData<S>>(
        stream: controller.pageStream,
        initialData: BeData.empty(code: 0, data: controller.initState),
        builder: (BuildContext context, AsyncSnapshot<BeData<S>> snapshot) {
          final pageData = snapshot.data;
          return pageData!.when(
                empty: (code, data) => buildLoading(context, pageData.data),
                error: (code, error, data) => buildError(context, error, data),
                loading: (data) => buildLoading(
                  context,
                  data ?? controller.initState,
                ),
                success: (code, data) => buildPage(context, data),
              ) ??
              buildPage(context, pageData.data as S);
        },
      );
  Widget buildError(BuildContext context, dynamic erro, S? data) =>
      const BeErrorWidget();
  Widget buildLoading(BuildContext context, S? pageData) =>
      const BePageLoading();
  Widget buildPage(BuildContext context, S pageData);
}
