import 'package:flutter/material.dart';

///  Breakpoints constants [https://github.com/fronio/google_ui/blob/main/lib/src/responsive/breakpoints.dart].
// class Breakpoints {
//   static const SM = 640;
//   static const MD = 768;
//   static const LG = 1024;
//   static const XL = 1280;
//   static const DOUBLE_XL = 1536;
// }

enum BeBreakpoint {
  extraSmall(360),
  small(640),
  medium(768),
  large(1024),
  extraLarge(1280);

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
