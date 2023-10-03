import 'package:bindings_compatible/bindings_compatible.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

typedef OnWidgetSizeChange = void Function(Size size);

///Utility class for monitoring Widget width and height.
class MeasureSizeRenderObject extends RenderProxyBox {
  MeasureSizeRenderObject(this.onChange);
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  @override
  void performLayout() {
    super.performLayout();

    var newSize = Size.zero;
    if (child != null) {
      newSize = child!.size;
    }
    if (oldSize == newSize) return;

    oldSize = newSize;

    useWidgetsBinding().addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

/// Tool class for monitoring Widget width and height changes
class MeasureSize extends SingleChildRenderObjectWidget {
  const MeasureSize({
    super.key,
    required this.onChange,
    required Widget super.child,
  });
  final OnWidgetSizeChange onChange;
  @override
  RenderObject createRenderObject(BuildContext context) =>
      MeasureSizeRenderObject(onChange);
}
