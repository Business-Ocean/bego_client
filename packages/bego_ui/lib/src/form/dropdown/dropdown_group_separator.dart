import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/widgets.dart';

class OptimusDropdownGroupSeparator extends StatelessWidget {
  const OptimusDropdownGroupSeparator({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        child: DefaultTextStyle.merge(
          style: bestyles(context).titleMedium.copyWith(
                color: BegoColors.green200,
              ),
          child: child,
        ),
      );
}
