import 'package:flutter/material.dart';

enum BeBreakpoint {
  extraSmall(360),
  small(600),
  medium(1024),
  large(1400),
  extraLarge(1600);

  const BeBreakpoint(this.maxwidth);
  final double maxwidth;
}

extension MediaQueryDataScreenBreakpoint on MediaQueryData {
  BeBreakpoint get screenBreakPoint {
    final width = size.width;
    // return Breakpoint.extraLarge;
    if (width < BeBreakpoint.extraSmall.maxwidth) {
      return BeBreakpoint.extraSmall;
    }

    if (width < BeBreakpoint.small.maxwidth) {
      return BeBreakpoint.small;
    }

    if (width < BeBreakpoint.medium.maxwidth) {
      return BeBreakpoint.medium;
    }

    if (width < BeBreakpoint.large.maxwidth) {
      return BeBreakpoint.large;
    }

    return BeBreakpoint.extraLarge;
  }
}

extension MediaQuerySizeDataScreenBreakpoint on Size {
  BeBreakpoint get screenBreakPoint {
    final width = this.width;
    // return Breakpoint.extraLarge;
    if (width < BeBreakpoint.extraSmall.maxwidth) {
      return BeBreakpoint.extraSmall;
    }

    if (width < BeBreakpoint.small.maxwidth) {
      return BeBreakpoint.small;
    }

    if (width < BeBreakpoint.medium.maxwidth) {
      return BeBreakpoint.medium;
    }

    if (width < BeBreakpoint.large.maxwidth) {
      return BeBreakpoint.large;
    }

    return BeBreakpoint.extraLarge;
  }
}
