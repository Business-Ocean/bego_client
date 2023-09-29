import 'package:bego_app/src/state/be_data.dart';
import 'package:bego_core/bego_get.dart';

abstract class BePageController<S> extends GetxController {
  BePageController(this._state);
  S _state;
  BeData<S>? _status;

  BeData<S> get status {
    reportRead();
    return _status ??= _status = const BeData.loading();
  }

  S get viewState => state;

  set status(BeData<S> newStatus) {
    if (newStatus == status) return;
    _status = newStatus;
    if (newStatus is BeSuccess<S>) {
      _state = newStatus.data;
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

  void change(BeData<S> status) {
    if (status != this.status) {
      this.status = status;
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
      _state ??= initialData;
    }
    compute().then(
      (newstate) {
        if ((newstate == null) && useEmpty) {
          status = BeData<S>.loading();
        } else {
          status = BeData<S>.success(newstate);
        }
        refresh();
      },
      onError: (dynamic err) {
        status = BeError(err as S);
        refresh();
      },
    );
  }
}
