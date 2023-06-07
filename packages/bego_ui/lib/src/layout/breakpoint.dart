import 'package:flutter/material.dart';

enum Breakpoint {
  extraSmall(360),
  small(600),
  medium(1024),
  large(1400),
  extraLarge(1600);

  const Breakpoint(this.maxwidth);
  final double maxwidth;
}

extension MediaQueryDataScreenBreakpoint on MediaQueryData {
  Breakpoint get screenBreakPoint {
    final width = size.width;

    if (width < Breakpoint.extraLarge.maxwidth) {
      return Breakpoint.extraSmall;
    }

    if (width < Breakpoint.small.maxwidth) {
      return Breakpoint.small;
    }

    if (width < Breakpoint.medium.maxwidth) {
      return Breakpoint.medium;
    }

    if (width < Breakpoint.large.maxwidth) {
      return Breakpoint.large;
    }

    return Breakpoint.extraLarge;
  }
}
