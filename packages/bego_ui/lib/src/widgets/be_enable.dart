import 'package:bego_ui/src/ui_style/bego_style.dart';
import 'package:flutter/widgets.dart';

class BeEnabled extends StatelessWidget {
  const BeEnabled({
    super.key,
    required this.isEnabled,
    required this.child,
  });

  final bool isEnabled;
  final Widget child;

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: isEnabled ? BegoStyle.enabled : BegoStyle.disabled,
        child: IgnorePointer(
          ignoring: !isEnabled,
          child: child,
        ),
      );
}
