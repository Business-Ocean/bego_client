import 'package:bego_core/bego_get.dart';

abstract class BePageController<S> extends GetxController {
  BePageController(this._value);
  S _value;
  GetStatus<S>? _status;

  GetStatus<S> get status {
    reportRead();
    return _status ??= _status = GetStatus.loading();
  }

  S get state => value;

  set status(GetStatus<S> newStatus) {
    if (newStatus == status) return;
    _status = newStatus;
    if (newStatus is SuccessStatus<S>) {
      _value = newStatus.data!;
    }
    refresh();
  }

  S get value {
    reportRead();
    return _value;
  }

  set value(S newValue) {
    if (_value == newValue) return;
    _value = newValue;
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
      _value ??= initialData;
    }
    compute().then((newValue) {
      if ((newValue == null) && useEmpty) {
        status = GetStatus<S>.loading();
      } else {
        status = GetStatus<S>.success(newValue);
      }

      refresh();
    }, onError: (err) {
      status = GetStatus.error(errorMessage ?? err.toString());
      refresh();
    });
  }
}
