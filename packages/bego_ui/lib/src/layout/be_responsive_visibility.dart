import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/helper/context_extensions.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:flutter/widgets.dart';

/// First value will be the default value
final class BeResponsiveVisibility {
  BeResponsiveVisibility({required this.child, this.onVisible});
  final Map<BeBreakpoint, bool>? onVisible;
  final Widget child;
  Widget resolve(BuildContext context) {
    if (onVisible == null) return child;
    final isVisible = switch (context.mediaQuery.screenBreakPoint) {
          BeBreakpoint.extraSmall => onVisible![BeBreakpoint.extraSmall],
          BeBreakpoint.small => onVisible![BeBreakpoint.small],
          BeBreakpoint.medium => onVisible![BeBreakpoint.medium],
          BeBreakpoint.large => onVisible![BeBreakpoint.large],
          BeBreakpoint.extraLarge => onVisible![BeBreakpoint.extraLarge],
        } ??
        true;
    return isVisible ? child : emptyWidget;
  }
}
