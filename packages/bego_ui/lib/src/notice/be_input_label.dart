import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeInputLabel extends MultiChildRenderObjectWidget {
  BeInputLabel({
    super.key,
    required this.child,
    required this.label,
    this.offset = Offset.zero,
    this.position = BeInputLabelPosition.topLeft,
  }) : super(children: [child, label]);
  final Widget child;
  final Widget label;
  final BeInputLabelPosition position;
  final Offset offset;
  @override
  RenderObject createRenderObject(BuildContext context) => _BeBadgeRenderObject(
        position: position,
        offset: offset,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _BeBadgeRenderObject renderObject,
  ) {
    renderObject
      .._position = position
      .._offset = offset;
  }
}

class _BeBadgeRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeBadgeChild>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeBadgeChild> {
  _BeBadgeRenderObject({
    required BeInputLabelPosition position,
    required Offset offset,
  })  : _position = position,
        _offset = offset;

  BeInputLabelPosition _position;
  set position(BeInputLabelPosition position) {
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
      BeInputLabelPosition.topLeft => (0, -labelHeight),
      BeInputLabelPosition.topCenter => (
          ((size.width - labelWidth) / 2),
          -labelHeight / 2
        ),
      BeInputLabelPosition.topRight => (
          (size.width - labelWidth / 2),
          (-labelHeight / 2)
        ),
      BeInputLabelPosition.bottomRight => (
          (size.width - labelWidth / 2),
          (size.height - labelHeight / 2)
        ),
      BeInputLabelPosition.bottomCenter => (
          (size.width - labelWidth) / 2,
          (size.height - labelHeight / 2)
        ),
      BeInputLabelPosition.bottomLeft => (
          (-labelWidth / 2),
          (size.height - labelHeight / 2)
        ),
      BeInputLabelPosition.centerLeft => (
          (-labelWidth / 2),
          (size.height - labelHeight) / 2
        ),
      BeInputLabelPosition.center => (
          (size.width - labelWidth) / 2,
          (size.height - labelHeight) / 2
        ),
      BeInputLabelPosition.centerRight => (
          (size.width - labelWidth / 2),
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

enum BeInputLabelPosition {
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
