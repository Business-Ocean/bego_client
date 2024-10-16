// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

///Position enumeration
enum BeToastGravity {
  ///Bottom display
  bottom(Alignment.bottomCenter),

  ///Center display
  center(Alignment.center),

  ///Top display
  top(Alignment.topCenter);

  const BeToastGravity(this.alignment);
  final Alignment alignment;
}

///Toast display duration
class BeDuration {
  BeDuration._();

  ///Toast is displayed for a shorter time (1s)
  static const Duration short = Duration(seconds: 1);

  ///Toast is displayed for a long time (3s)
  static const Duration long = Duration(seconds: 3);
}

///Common Toast component
class BeToast {
  // ///Toast is the default distance from the top
  // static const int _defaultTopOffset = 50;

  // ///The default distance between Toast and the bottom
  // static const int _defaultBottomOffset = 50;

  ///_ToastView
  static _ToastView? preToastView;

  ///Displayed in the middle. If duration is not set, it will be automatically calculated based on the content length (more friendly, up to 5 seconds)
  static void showInCenter({
    required String text,
    required BuildContext context,
    Duration? duration,
  }) {
    show(
      context,
      text,
      duration: duration,
      gravity: BeToastGravity.center,
    );
  }

  ///Display Toast. If duration is not set, it will be automatically calculated based on the content length (more friendly, up to 5 seconds)
  static void show(
    BuildContext context,
    String text, {
    Duration? duration,
    Color? background,
    TextStyle textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    double? radius,
    Widget? leading,
    Widget? trailing,
    double verticalOffset = 16,
    VoidCallback? onDismiss,
    BeToastGravity gravity = BeToastGravity.bottom,
    BoxConstraints? constraints,
  }) {
    final overlayState = Overlay.of(context);

    preToastView?._dismiss();
    preToastView = null;

    ///Automatically determine the display duration based on the content length, making it more user-friendly
    final autoDuration = min(text.length * 0.06 + 0.8, 5.0).ceil();
    final finalDuration = duration ?? Duration(seconds: autoDuration);
    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        widget: ToastChild(
          background: background,
          radius: radius,
          msg: text,
          leading: leading,
          trailing: trailing,
          textStyle: textStyle,
          gravity: gravity,
          verticalOffset: verticalOffset,
          constraints: constraints,
        ),
      ),
    );
    final toastView =
        _ToastView(overlayState: overlayState, overlayEntry: overlayEntry);
    preToastView = toastView;
    toastView._show(
      duration: finalDuration,
      onDismiss: onDismiss,
    );
  }
}

class _ToastView {
  _ToastView({
    required this.overlayState,
    required this.overlayEntry,
  });
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  bool _isVisible = false;

  Future<void> _show({
    required Duration duration,
    VoidCallback? onDismiss,
  }) async {
    _isVisible = true;
    overlayState.insert(overlayEntry);
    Future.delayed(duration, () {
      _dismiss();
      onDismiss?.call();
    });
  }

  Future<void> _dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    overlayEntry.remove();
  }
}

class ToastChild extends StatelessWidget {
  const ToastChild({
    super.key,
    required this.msg,
    required this.verticalOffset,
    this.gravity = BeToastGravity.bottom,
    this.background,
    this.radius,
    this.leading,
    this.trailing,
    this.constraints,
    this.textStyle,
  });

  EdgeInsets get padding {
    switch (gravity) {
      case BeToastGravity.bottom:
        return EdgeInsets.only(bottom: verticalOffset);
      case BeToastGravity.top:
        return EdgeInsets.only(top: verticalOffset);
      case BeToastGravity.center:
      default:
        return EdgeInsets.only(top: verticalOffset);
    }
  }

  final String msg;
  final double verticalOffset;
  final Color? background;
  final double? radius;
  final Widget? leading;
  final Widget? trailing;
  final BeToastGravity gravity;
  final TextStyle? textStyle;
  final BoxConstraints? constraints;

  InlineSpan get leadingSpan => WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child:
            Padding(padding: const EdgeInsets.only(right: 8), child: leading!),
      );

  InlineSpan get trailingSpan => WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child:
            Padding(padding: const EdgeInsets.only(left: 8), child: trailing!),
      );

  @override
  Widget build(BuildContext context) => Container(
        margin: padding,
        alignment: gravity.alignment,
        child: Container(
          constraints:
              constraints ?? const BoxConstraints(minWidth: infinityWidth),
          decoration: BoxDecoration(
            color: background ?? BegoColors.blueGray900,
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leading != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: leading!,
                ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: msg, style: textStyle),
                    ],
                  ),
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: trailing!,
                ),
            ],
          ),
        ),
      );
}

class _ToastWidget extends StatelessWidget {
  const _ToastWidget({
    required this.widget,
  });

  final Widget widget;

  ///Use IgnorePointer to facilitate gesture transmission
  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Material(color: Colors.transparent, child: widget),
      );
}
