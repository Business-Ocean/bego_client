import 'package:bego_core/bego_get.dart';

abstract class BePageController<S> extends GetxController {
  BePageController(this._state);
  S _state;
  GetStatus<S>? _status;

  GetStatus<S> get status {
    reportRead();
    return _status ??= _status = GetStatus.loading();
  }

  S get viewState => state;

  set status(GetStatus<S> newStatus) {
    if (newStatus == status) return;
    _status = newStatus;
    if (newStatus is SuccessStatus<S>) {
      _state = newStatus.data!;
    }
    refresh();
  }

  S get state {
    reportRead();
    return _state;
  }

  set state(S newstate) {
    if (_state == newstate) return;
    _state = newstate;
    refresh();
  }

  void change(GetStatus<S> status) {
    if (status != this.status) {
      this.status = status;
    }
  }

  void futurize(Future<S> Function() body,
      {S? initialData, String? errorMessage, bool useEmpty = true}) {
    final compute = body;
    if (initialData != null) {
      _state ??= initialData;
    }
    compute().then((newstate) {
      if ((newstate == null) && useEmpty) {
        status = GetStatus<S>.loading();
      } else {
        status = GetStatus<S>.success(newstate);
      }

      refresh();
    }, onError: (err) {
      status = GetStatus.error(errorMessage ?? err.toString());
      refresh();
    });
  }
}
