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

  Widget _overLayBuilder(BeData<T> bedata) => bedata.when(
        loading: (data) => _blurLoadinState(),
        error: (code, error, data) => _blurErrorState(error, data),
        empty: (code, data) => emptyWidget,
        success: (code, data) => emptyWidget,
      );
  Widget _blurLoadinState() => BackdropFilter(
        filter: ImageFilter.compose(
          outer: BegoStyle.tinyBlur,
          inner: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
        ),
        child: const BeLoading(),
      );
  Widget _blurErrorState(dynamic error, T? data) => BackdropFilter(
        filter: ImageFilter.compose(
          outer: BegoStyle.tinyBlur,
          inner: const ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
        ),
        child: BeErrorWidget(
          retryCallback: retryCallback,
        ),
      );
}
