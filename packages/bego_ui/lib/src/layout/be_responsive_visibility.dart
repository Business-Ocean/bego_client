import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:flutter/widgets.dart';

/// First value will be the default value
final class BeResponsiveVisibility {
  BeResponsiveVisibility({required this.child, this.onVisible});
  final Map<Breakpoint, bool>? onVisible;
  final Widget child;
  Widget resolve(BuildContext context) {
    if (onVisible == null) return child;
    final isVisible = switch (context.mediaQuery.screenBreakPoint) {
          Breakpoint.extraSmall => onVisible![Breakpoint.extraSmall],
          Breakpoint.small => onVisible![Breakpoint.small],
          Breakpoint.medium => onVisible![Breakpoint.medium],
          Breakpoint.large => onVisible![Breakpoint.large],
          Breakpoint.extraLarge => onVisible![Breakpoint.extraLarge],
        } ??
        true;
    return isVisible ? child : emptyWidget;
  }
}
