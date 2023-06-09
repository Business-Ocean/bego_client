import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class BouncingScrollBehavior extends ScrollBehavior {
  // Disable overscroll glow.
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;

  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) =>
      child;

  // Set physics to bouncing.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();
}

class BouncingScrollWrapper extends StatelessWidget {
  const BouncingScrollWrapper({
    super.key,
    required this.child,
    this.dragWithMouse = false,
  });
  final Widget child;
  final bool dragWithMouse;

  static Widget builder(
    BuildContext context,
    Widget child, {
    bool dragWithMouse = false,
  }) =>
      BouncingScrollWrapper(dragWithMouse: dragWithMouse, child: child);

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: BouncingScrollBehavior().copyWith(
          dragDevices: dragWithMouse
              ? {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }
              : null,
        ),
        child: child,
      );
}

class ClampingScrollBehavior extends ScrollBehavior {
  // Disable overscroll glow.
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;

  // Set physics to clamping.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

class ClampingScrollWrapper extends StatelessWidget {
  const ClampingScrollWrapper({
    super.key,
    required this.child,
    this.dragWithMouse = false,
  });
  final Widget child;
  final bool dragWithMouse;

  static Widget builder(
    BuildContext context,
    Widget child, {
    bool dragWithMouse = false,
  }) =>
      ClampingScrollWrapper(dragWithMouse: dragWithMouse, child: child);

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ClampingScrollBehavior().copyWith(
          dragDevices: dragWithMouse
              ? {
                  PointerDeviceKind.touch,
                  PointerDeviceKind.mouse,
                }
              : null,
        ),
        child: child,
      );
}
