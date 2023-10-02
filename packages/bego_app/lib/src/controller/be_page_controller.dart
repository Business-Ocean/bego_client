// ignore_for_file: use_setters_to_change_properties

import 'package:bego_app/src/actions/event_action.dart';
import 'package:bego_app/src/page/i_view_page.dart';
import 'package:bego_app/src/state/be_data.dart';
import 'package:bego_core/bego_rx.dart';

class BePageController<S> implements IViewPage {
  BePageController(this.initState);

  final S initState;

  late IViewPage? _viewPage;

  IViewPage? get viewPage => _viewPage;

  void attach(IViewPage viewPage) => _viewPage = viewPage;

  void dettach() => _viewPage = null;

  late final BehaviorSubject<BeData<S>> _pageState =
      BehaviorSubject<BeData<S>>.seeded(
    BeData.success(data: initState, code: 0),
  );

  Stream<BeData<S>> get pageStream => _pageState.stream;

  Future<BeData<S>> get pageState async => pageStream.first;
  Future<S> get state async => (await pageStream.first).data!;

  void updateState(S state) {
    _pageState.add(BeData.success(data: state));
  }

  void updatePage(BeData<S> pageState) {
    _pageState.add(pageState);
  }

  @override
  void handleAction(
    EventAction action, {
    MessageStyle style = MessageStyle.success,
  }) =>
      _viewPage?.handleAction(action, style: style);

  @override
  void hideLoading() => _viewPage?.showLoading();

  @override
  void showLoading() => _viewPage?.hideLoading();

  @override
  void showMessage(
    String title,
    String message, {
    MessageStyle style = MessageStyle.success,
  }) =>
      _viewPage?.showMessage(title, message);
}
