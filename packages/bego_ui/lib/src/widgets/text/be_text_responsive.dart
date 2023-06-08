import 'package:bego_ui/src/_resolve_style.dart';
import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:flutter/widgets.dart';

class BeTextResponsive extends StatelessWidget {
  const BeTextResponsive({
    super.key,
    required this.resolveStyle,
    this.color,
    required this.child,
    this.maxLines,
    this.align,
  });

  final ResolveTextStyle resolveStyle;
  final Widget child;
  final Color? color;
  final int? maxLines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).screenBreakPoint;

    return DefaultTextStyle.merge(
      child: child,
      textAlign: align,
      maxLines: maxLines,
      style: resolveStyle(screenSize).copyWith(color: color),
    );
  }
}
