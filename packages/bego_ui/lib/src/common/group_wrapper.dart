import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/widgets.dart';

class GroupWrapper extends StatelessWidget {
  const GroupWrapper({
    super.key,
    required this.child,
    this.label,
    this.error,
    this.isRequired = false,
  });

  final Widget child;
  final String? label;
  final String? error;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final error = this.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null && label.isNotEmpty)
          BeTextTagged(
            label: '*',
            child: BeText.labelMedium(label),
          ),
        child,
        if (error != null && error.isNotEmpty)
          BeText.bodySmall(
            error,
            color: becolors(context).error,
          ),
      ],
    );
  }
}
