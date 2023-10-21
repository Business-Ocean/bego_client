import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class Suffix extends StatelessWidget {
  const Suffix({
    super.key,
    this.suffix,
    this.passwordButton,
    this.trailing,
    this.inlineError,
    this.clearAllButton,
    this.showLoader = false,
  });

  final Widget? suffix;
  final Widget? passwordButton;
  final Widget? trailing;
  final Widget? clearAllButton;
  final Widget? inlineError;
  final bool showLoader;

  BeLoading get _loader => const BeLoading(
        color: BegoColors.blue,
        strokeWidth: 2.5,
        dimension: 18,
      );

  @override
  Widget build(BuildContext context) {
    final suffixWidget = suffix;
    final clearAllButtonWidget = clearAllButton;
    final passwordButtonWidget = passwordButton;
    final trailingWidget = trailing;

    return inlineError ??
        BeStack(
          direction: Axis.horizontal,
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (suffixWidget != null) suffixWidget,
            if (showLoader) _loader,
            if (clearAllButtonWidget != null) clearAllButtonWidget,
            if (passwordButtonWidget != null)
              passwordButtonWidget
            else if (trailingWidget != null)
              trailingWidget,
          ],
        );
  }
}

class Prefix extends StatelessWidget {
  const Prefix({super.key, this.prefix, this.leading});

  final Widget? prefix;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final prefix = this.prefix;
    final leading = this.leading;

    return BeStack(
      direction: Axis.horizontal,
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [if (leading != null) leading, if (prefix != null) prefix],
    );
  }
}

class InlineErrorTooltip extends StatelessWidget {
  const InlineErrorTooltip({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) => BeTooltipWrapper(
        text: Text(error),
        child: Icon(Icons.error, color: becolors(context).error),
      );
}

abstract class OpacityValue {
  static const double enabled = 1;
  static const double disabled = .32;
}
