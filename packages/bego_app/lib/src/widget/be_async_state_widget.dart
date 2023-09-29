import 'package:bego_app/src/widget/be_loading_widget.dart';
import 'package:flutter/material.dart';

class BeAsyncStateWidget<T> extends StatelessWidget {
  const BeAsyncStateWidget({
    super.key,
    required this.childSuccess,
    this.childUnknown,
    this.childError,
    this.onInit,
    this.initData,
  });
  final T? initData;
  final Future<T> Function()? onInit;
  final Widget Function(T? data)? childUnknown;
  final Widget Function(dynamic error)? childError;
  final Widget Function(T? data) childSuccess;

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        initialData: initData,
        future: onInit?.call(), // a previously-obtained Future<T> or null
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return childError?.call(snapshot.error) ?? const BeLoadingWidget();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return childUnknown?.call(snapshot.data) ??
                  const BeLoadingWidget();
            case ConnectionState.done:
              return childSuccess(snapshot.data);
          }
        },
      );
}
