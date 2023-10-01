// ignore_for_file: use_setters_to_change_properties

import 'package:bego_app/src/actions/event_action.dart';
import 'package:bego_app/src/page/i_view_page.dart';
import 'package:bego_app/src/state/be_data.dart';
import 'package:bego_core/bego_get.dart';

class BePageController<S> extends GetxController implements IViewPage {
  BePageController(S state) : _page = Rx(BeData.empty(data: state));
  final Rx<BeData<S>> _page;

  // BeData<S> _page;

  Rx<BeData<S>> get pageState => _page;

  BeData<S> get page {
    reportRead();
    return _page.value;
  }

  S get viewState => state;

  set page(BeData<S> newStatus) {
    if (newStatus == page) return;
    _page.value = newStatus;
    refresh();
  }

  S get state {
    reportRead();
    return _page.value.data!;
  }

  void updageState(S newstate) {
    if (_page.value.data == newstate) return;
    _page.value = BeData.success(data: newstate);
    refresh();
  }

  void change(BeData<S> status) {
    if (status != this.page) {
      this.page = status;
    }
  }

  void futurize(
    Future<S> Function() body, {
    S? initialData,
    String? errorMessage,
    bool useEmpty = true,
  }) {
    final compute = body;
    if (initialData != null) {
      _page.value = BeData.empty(data: initialData);
    }
    compute().then(
      (newstate) {
        if ((newstate == null) && useEmpty) {
          page = BeData<S>.loading();
        } else {
          page = BeData<S>.success(data: newstate);
        }
        refresh();
      },
      onError: (dynamic err) {
        page = BeError(
          message: errorMessage ?? defaultErrorMessage,
          data: err as S,
        );
        refresh();
      },
    );
  }

  late IViewPage? _viewPage;

  IViewPage? get viewPage => _viewPage;

  void attach(IViewPage viewPage) => _viewPage = viewPage;

  void dettach() => _viewPage = null;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    dettach();
    super.onClose();
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
