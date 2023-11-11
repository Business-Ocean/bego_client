import 'package:bego_ui/src/common/resolve_style.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:flutter/material.dart';

class BeTextResponsive extends StatelessWidget {
  const BeTextResponsive({
    super.key,
    required this.resolveStyle,
    this.color,
    required this.child,
    this.maxLines,
    this.align = TextAlign.start,
    this.overflow,
  });

  final ResolveTextStyle resolveStyle;
  final Widget child;
  final Color? color;
  final int? maxLines;
  final TextAlign align;
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
