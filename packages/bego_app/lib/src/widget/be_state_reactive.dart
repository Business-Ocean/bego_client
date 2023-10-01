import 'dart:ui';

import 'package:bego_app/bego_app.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeReactiveWidget<T> extends StatelessWidget {
  const BeReactiveWidget({
    super.key,
    this.data = const BeData.empty(),
    this.badgePosition = BeBadgePosition.center,
    required this.builder,
    this.overlayBuilder,
    this.retryCallback,
    this.offset,
  });
  final BeBadgePosition badgePosition;
  final BeData<T> data;
  final Offset? offset;

  final Widget Function(BeData<T> data) builder;
  final Widget Function(BeData<T> data)? overlayBuilder;
  final VoidCallback? retryCallback;

  @override
  Widget build(BuildContext context) => BeBadge(
        offset: offset ?? Offset.zero,
        position: badgePosition,
        badge: overlayBuilder?.call(data) ?? _overLayBuilder(data),
        child: AbsorbPointer(
          absorbing: data.map(
            loading: (loading) => true,
            error: (error) => true,
            empty: (empty) => false,
            success: (success) => false,
          ),
          child: builder(data),
        ),
      );

  Widget _overLayBuilder(BeData<T> data) => data.when(
        loading: (d) => _blurLoadinState(),
        error: (d, title, message, code) => _blurErrorState(title, message),
        empty: (c, d) => emptyWidget,
        success: (c, d) => emptyWidget,
      );
  Widget _blurLoadinState() => BackdropFilter(
        filter: ImageFilter.compose(
          outer: BegoStyle.tinyBlur,
          inner: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
        ),
        child: const BeLoadingWidget(),
      );
  Widget _blurErrorState(String title, String message) => BackdropFilter(
        filter: ImageFilter.compose(
          outer: BegoStyle.tinyBlur,
          inner: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
        ),
        child: BeErrorWidget(
          title: title,
          description: message,
          retryCallback: retryCallback,
        ),
      );
}
