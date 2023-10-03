import 'package:flutter/widgets.dart';

class BeRoundClipRect extends ClipRRect {
  const BeRoundClipRect({
    super.key,
    BorderRadius super.borderRadius = const BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    ),
    super.child,
  });
}
