import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeLabel extends MultiChildRenderObjectWidget {
  BeLabel({
    super.key,
    required this.child,
    required this.label,
    this.offset = Offset.zero,
    this.position = BeLabelPosition.topLeft,
  }) : super(children: [child, label]);
  final Widget child;
  final Widget label;
  final BeLabelPosition position;
  final Offset offset;
  @override
  RenderObject createRenderObject(BuildContext context) => _BeLabelRenderObject(
        position: position,
        offset: offset,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _BeLabelRenderObject renderObject,
  ) {
    renderObject
      .._position = position
      .._offset = offset;
  }
}

class _BeLabelRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeBadgeChild>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeBadgeChild> {
  _BeLabelRenderObject({
    required BeLabelPosition position,
    required Offset offset,
  })  : _position = position,
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

  @override
  void setupParentData(covariant RenderObject child) {
    child.parentData = _BeBadgeChild();
  }

  @override
  void performLayout() {
    var childConstraints = constraints;
    final child = firstChild;
    final badge = lastChild;
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      childConstraints = BoxConstraints.tight(child.size);
    }

    if (badge != null) {
      badge.layout(
        BoxConstraints.loose(
          Size(childConstraints.minWidth, childConstraints.minHeight),
        ),
      );
    }
    size = child?.size ?? badge?.size ?? constraints.smallest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final children = getChildrenAsList();
    final badge = lastChild;
    for (final child in children) {
      if (child == badge) {
        final badgeOffset =
            _getOffset(offset, child.size.width, child.size.height);
        context.paintChild(child, badgeOffset);
      } else {
        context.paintChild(child, offset);
      }
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      defaultHitTestChildren(result, position: position);

  Offset _getOffset(
    Offset originalOffset,
    double labelWidth,
    double labelHeight,
  ) {
    var translateX = 0.0;
    var translateY = 0.0;

    final (double x, double y) = switch (_position) {
      BeLabelPosition.topLeft => (0, -labelHeight),
      BeLabelPosition.topCenter => (
          ((size.width - labelWidth) / 2),
          -labelHeight
        ),
      BeLabelPosition.topRight => ((size.width - labelWidth), (-labelHeight)),
      BeLabelPosition.bottomRight => (
          (size.width - labelWidth / 2),
          (size.height)
        ),
      BeLabelPosition.bottomCenter => (
          (size.width - labelWidth) / 2,
          (size.height)
        ),
      BeLabelPosition.bottomLeft => ((-labelWidth / 2), (size.height)),
      BeLabelPosition.centerLeft => (
          (-labelWidth),
          (size.height - labelHeight) / 2
        ),
      BeLabelPosition.center => (
          (size.width - labelWidth) / 2,
          (size.height - labelHeight) / 2
        ),
      BeLabelPosition.centerRight => (
          (size.width),
          (size.height - labelHeight) / 2
        ),
    };
    translateX = x + _offset.dx;
    translateY = y + _offset.dy;

    return originalOffset.translate(translateX, translateY);
  }
}

class _BeBadgeChild extends ContainerBoxParentData<RenderBox>
    with ContainerParentDataMixin<RenderBox> {}

enum BeLabelPosition {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}
