import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

/// Removes platform native animations from scroll.
class BeNoScrollScrollConfiguration extends StatelessWidget {
  const BeNoScrollScrollConfiguration({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: const BeNoScrollBehaviour(),
        child: child,
      );
}

class BeNoScrollBehaviour extends ScrollBehavior {
  const BeNoScrollBehaviour();
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}
