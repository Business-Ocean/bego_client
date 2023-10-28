import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeLabel extends MultiChildRenderObjectWidget {
  BeLabel({
    super.key,
    required this.child,
    this.label,
    this.offset = Offset.zero,
    this.childSized = false,
    this.position = BeLabelPosition.topLeft,
  }) : super(children: [child, label ?? emptyWidget]);
  final Widget child;
  final Widget? label;
  final BeLabelPosition position;
  final Offset offset;
  final bool childSized;
  @override
  RenderObject createRenderObject(BuildContext context) => _BeLabelRenderObject(
        position: position,
        offset: offset,
        childSized: childSized,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _BeLabelRenderObject renderObject,
  ) {
    renderObject
      ..position = position
      ..offset = offset
      ..childSized = childSized;
  }
}

class _BeLabelRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeLabelChildParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeLabelChildParentData> {
  _BeLabelRenderObject({
    required BeLabelPosition position,
    required Offset offset,
    required bool childSized,
  })  : _position = position,
        _childSized = childSized,
        _offset = offset;

  BeLabelPosition _position;
  set position(BeLabelPosition position) {
    _position = position;
    markNeedsPaint();
  }

  Offset _offset;
  set offset(Offset value) {
    _offset = value;
    markNeedsPaint();
  }

  bool _childSized;
  set childSized(bool value) {
    _childSized = value;
    markParentNeedsLayout();
    markNeedsLayout();
    markNeedsPaint();
  }

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = _BeLabelChildParentData();
  }

  @override
  void performLayout() {
    final child = firstChild;
    final badge = lastChild;
    child!.layout(constraints, parentUsesSize: true);

    size = child.size;

    badge!.layout(
      _childSized ? BoxConstraints.loose(size) : const BoxConstraints(),
      parentUsesSize: true,
    );

    final badgeParentData = badge.parentData as _BeLabelChildParentData;
    final labelOffset = _getOffset(
      badge.size.width,
      badge.size.height,
    );
    badgeParentData.offset = labelOffset;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }

  Offset _getOffset(
    double labelWidth,
    double labelHeight,
  ) {
    final (double x, double y) = switch (_position) {
      BeLabelPosition.topLeft => (0, -labelHeight),
      BeLabelPosition.leftTop => (-labelWidth, 0),
      BeLabelPosition.topCenter => (
          ((size.width - labelWidth) / 2),
          -labelHeight
        ),
      BeLabelPosition.topRight => ((size.width - labelWidth), (-labelHeight)),
      BeLabelPosition.rightTop => ((size.width), 0),
      BeLabelPosition.bottomRight => ((size.width - labelWidth), (size.height)),
      BeLabelPosition.rightBottom => (
          (size.width),
          (size.height - labelHeight)
        ),
      BeLabelPosition.rightCenter => (
          size.width,
          (size.height - labelHeight) / 2
        ),
      BeLabelPosition.bottomCenter => (
          (size.width - labelWidth) / 2,
          size.height
        ),
      BeLabelPosition.bottomLeft => (0, (size.height)),
      BeLabelPosition.leftBottom => (-labelWidth, size.height - labelHeight),
      BeLabelPosition.leftCenter => (
          (-labelWidth),
          (size.height - labelHeight) / 2
        ),
      BeLabelPosition.center => (
          (size.width - labelWidth) / 2,
          (size.height - labelHeight) / 2
        ),
    };

    return Offset(x + _offset.dx, y + _offset.dy);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      defaultHitTestChildren(
        result,
        position: position,
      );
}

class _BeLabelChildParentData extends ContainerBoxParentData<RenderBox>
    with ContainerParentDataMixin<RenderBox> {}

enum BeLabelPosition {
  topLeft,
  topCenter,
  topRight,
  rightTop,
  rightCenter,
  rightBottom,
  bottomRight,
  bottomCenter,
  bottomLeft,
  leftBottom,
  leftCenter,
  leftTop,
  center,
}
