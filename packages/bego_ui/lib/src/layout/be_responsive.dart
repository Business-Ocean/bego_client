import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/src/common/common_widget.dart';
import 'package:flutter/widgets.dart';

/// Show widget based on device width.
class BeResponsiveBuilder extends StatelessWidget {
  const BeResponsiveBuilder({
    super.key,
    required this.sm,
    this.md,
    this.lg,
    this.xl,
    this.doubleXl,
  });

  final Widget sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final Widget? doubleXl;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size.width;

    if (deviceSize >= BeBreakpoint.extraLarge.maxwidth) {
      return doubleXl ?? xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= BeBreakpoint.large.maxwidth) {
      return xl ?? lg ?? md ?? sm;
    }

    if (deviceSize >= BeBreakpoint.small.maxwidth) {
      return lg ?? md ?? sm;
    }

    if (deviceSize >= BeBreakpoint.extraSmall.maxwidth) {
      return md ?? sm;
    }

    return sm;
  }
}

mixin BeResponsiveMixin on Widget {
  @protected
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).screenBreakPoint;
    final widget = switch (screen) {
      BeBreakpoint.extraSmall => buildExtraSmall(context),
      BeBreakpoint.small => buildSmall(context),
      BeBreakpoint.medium => buildMedium(context),
      BeBreakpoint.large => buildLarge(context),
      BeBreakpoint.extraLarge => buildExtraLarge(context),
    };
    return widget ?? builder(context) ?? emptyWidget;
  }

// 360
  Widget? buildExtraSmall(BuildContext context360) => null;
// 600
  Widget? buildSmall(BuildContext context600) => null;
// 1024
  Widget? buildMedium(BuildContext context1024) => null;
// 1400
  Widget? buildLarge(BuildContext context1400) => null;
// 1600
  Widget? buildExtraLarge(BuildContext context1600) => null;

  Widget? builder(BuildContext context) => null;
}
