import 'package:bego_app/bego_app.dart';
import 'package:flutter/material.dart';

class BeStreamStateWidget<T> extends StatelessWidget {
  const BeStreamStateWidget({
    super.key,
    required this.childSuccess,
    this.childStream,
    this.childError,
    this.onStream,
    this.initData,
  });
  final T? initData;
  final Stream<T>? onStream;
  final Widget Function(T? data)? childStream;
  final Widget Function(dynamic error)? childError;
  final Widget Function(T? data) childSuccess;

  @override
  Widget build(BuildContext context) => StreamBuilder<T>(
        initialData: initData,
        stream: onStream, // a previously-obtained Future<T> or null
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.hasError) {
            return childError?.call(snapshot.error) ??
                BeErrorWidget(
                  title: defaultErrorTitle,
                  description: snapshot.error.toString(),
                );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return childStream?.call(snapshot.data) ??
                  const BeLoadingWidget();
            case ConnectionState.done:
              return childSuccess(snapshot.data);
          }
        },
      );
}
