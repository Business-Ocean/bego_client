import 'package:bego_app/src/state/be_data.dart';
import 'package:bego_app/src/widget/be_empty_widget.dart';
import 'package:bego_app/src/widget/be_error_widget.dart';
import 'package:bego_app/src/widget/be_loading_widget.dart';
import 'package:flutter/material.dart';

class BeDataWidget<T> extends StatelessWidget {
  const BeDataWidget({
    super.key,
    this.data = const BeData.loading(),
    required this.onSuccessWidget,
    this.onErrorWidget,
  });

  final BeData<T> data;
  final Widget Function(String title, String message, int code, dynamic data)?
      onErrorWidget;
  final Widget Function(int code, T data) onSuccessWidget;
  // final Widget Function(T data)? onInitWidget;

  @override
  Widget build(BuildContext context) => data.when(
        loading: (data) => const BeLoadingWidget(),
        empty: (code, data) => const BeEmptyWidget(),
        error: (data, title, message, code) =>
            onErrorWidget?.call(title, message, code, data) ??
            BeErrorWidget(
              title: title,
              description: message,
            ),
        success: onSuccessWidget,
      );
}
