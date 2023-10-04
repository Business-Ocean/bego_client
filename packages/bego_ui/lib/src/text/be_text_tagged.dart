import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeTextTagged extends StatelessWidget {
  const BeTextTagged({
    super.key,
    required this.child,
    this.label,
    this.offset,
    this.tagBackground,
    this.tagspace = 4,
    this.tagPadding = const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
    this.tagColor = BegoColors.primary,
    this.tagStyle = BegoTextStyle.labelSmall,
    this.position = BeBadgePosition.topLeft,
  });
  final String? label;
  final Offset? offset;
  final BeBadgePosition position;
  final TextStyle tagStyle;
  final Color tagColor;
  final Color? tagBackground;
  final EdgeInsets? tagPadding;
  final double tagspace;
  final Widget child;
  @override
  Widget build(BuildContext context) => BeBadge(
        offset: offset ?? _calculateOffset(),
        position: position,
        badge: Container(
          padding: tagPadding,
          decoration: BoxDecoration(
            borderRadius: bestyles(context).xsRadius,
            color: tagBackground ?? tagColor.withAlpha(50),
          ),
          child: BeText(
            label,
            style: tagStyle.copyWith(color: tagColor),
          ),
        ),
        child: child,
      );

  Offset _calculateOffset() {
    final size = BeTextUtil.textSize(label, tagStyle);
    var dx = size.width;
    var dy = size.height;

    switch (position) {
      case BeBadgePosition.topRight:
        dx = dx / 2 + tagspace;
        dy = dy / 3;
      case BeBadgePosition.topCenter:
        dx = 0;
        dy = 0 - tagspace;
      case BeBadgePosition.bottomCenter:
        dx = 0;
        dy = dy / 3 + tagspace;

      case BeBadgePosition.centerRight:
        dx = dx / 2 + tagspace;
        dy = 0;
      case BeBadgePosition.centerLeft:
        dx = -dx / 2 - tagspace;
        dy = 0;
        break;

      case BeBadgePosition.topLeft:
        dx = -dx / 2 - tagspace;
        dy = dy / 3;
      case BeBadgePosition.center:
        dx = 0;
        dy = 0;
      case BeBadgePosition.bottomLeft:
        dx = -dx / 2 - tagspace;
        dy = -dy / 3;
      case BeBadgePosition.bottomRight:
        dx = dx / 2 + tagspace;
        dy = -dy / 3;
    }

    final offset = Offset(dx, dy);
    return offset;
  }
}
