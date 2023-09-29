import 'dart:ui';

import 'package:flutter/material.dart';

ClipRRect blurredWidget({
  Key? key,
  required Widget child,
  BorderRadius borderRadius = const BorderRadius.all(Radius.circular(8)),
}) =>
    ClipRRect(
      key: key,
      borderRadius: borderRadius,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: child,
      ),
    );
