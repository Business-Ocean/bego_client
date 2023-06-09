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
    this.overflow,
  });

  final ResolveTextStyle resolveStyle;
  final Widget child;
  final Color? color;
  final int? maxLines;
  final TextAlign? align;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final breakPoint = MediaQuery.of(context).screenBreakPoint;
    return DefaultTextStyle.merge(
      child: child,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: resolveStyle(breakPoint).copyWith(color: color),
    );
  }
}
