import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

/// Divider is a visual representation of a separation between two areas.
class BeLableDivider extends StatelessWidget {
  const BeLableDivider({
    super.key,
    this.child,
    this.verticalPadding,
    this.horizontalPadding,
    this.direction = Axis.horizontal,
  });

  /// The text to display in the middle of the divider. If null, the divider
  /// will be just a line.
  final Widget? child;

  /// The direction of the divider.
  final Axis direction;

  final double? verticalPadding;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 200);
    final color = becolors(context).divider;
    final divider = direction == Axis.horizontal
        ? Divider(color: color, thickness: 1)
        : VerticalDivider(color: color, thickness: 1);
    final animatedDivider = AnimatedContainer(
      duration: duration,
      child: divider,
    );

    return Flex(
      direction: direction,
      children: [
        Expanded(child: animatedDivider),
        if (child != null) ...[
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal:
                  horizontalPadding ?? (direction == Axis.horizontal ? 4 : 8),
              vertical:
                  verticalPadding ?? (direction == Axis.horizontal ? 8 : 4),
            ),
            child: AnimatedContainer(
              duration: duration,
              child: DefaultTextStyle.merge(
                style: bestyles(context).labelMedium,
                child: child ?? emptyWidget,
              ),
            ),
          ),
          Expanded(child: animatedDivider),
        ],
      ],
    );
  }
}
