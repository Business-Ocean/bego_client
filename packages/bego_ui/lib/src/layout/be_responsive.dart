import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/src/common/common_widget.dart';
import 'package:flutter/widgets.dart';

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
