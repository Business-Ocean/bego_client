import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeBadge extends MultiChildRenderObjectWidget {
  BeBadge({
    super.key,
    required this.child,
    required this.badge,
    this.rounded = false,
    this.offset = Offset.zero,
    this.position = BeBadgePosition.topRight,
  }) : super(children: [child, if (badge != null) badge]);
  final Widget child;
  final Widget? badge;
  final BeBadgePosition position;
  final bool rounded;
  final Offset offset;
  @override
  RenderObject createRenderObject(BuildContext context) => _BeBadgeRenderObject(
        position: position,
        rounded: rounded,
        offset: offset,
      );

  @override
  void updateRenderObject(
    BuildContext context,
    _BeBadgeRenderObject renderObject,
  ) {
    renderObject
      ..badgePosition = position
      ..rounded = rounded
      ..offset = offset;
  }
}

class _BeBadgeRenderObject extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _BeBadgeChild>,
        RenderBoxContainerDefaultsMixin<RenderBox, _BeBadgeChild> {
  _BeBadgeRenderObject({
    required BeBadgePosition position,
    required bool rounded,
    required Offset offset,
  })  : _badgePosition = position,
        _rounded = rounded,
        _offset = offset;

  BeBadgePosition _badgePosition;
  set badgePosition(BeBadgePosition position) {
    _badgePosition = position;
    markNeedsPaint();
  }

  bool _rounded;
  set rounded(bool value) {
    _rounded = value;
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
    if (child != null) {
      child.layout(constraints, parentUsesSize: true);
      childConstraints = BoxConstraints.tight(child.size);
    }
    final badge = lastChild;
    if (childCount > 1) {
      if (badge != null) {
        badge.layout(
          BoxConstraints.loose(
            Size(childConstraints.minWidth, childConstraints.minHeight),
          ),
        );
      }
    }

    size = child?.size ?? badge?.size ?? constraints.smallest;
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final children = getChildrenAsList();
    final badge = lastChild;
    for (final child in children) {
      if (child == badge && child != firstChild) {
        final badgeOffset =
            _getOffset(offset, child.size.width, child.size.height);
        context.paintChild(child, badgeOffset);
      } else {
        context.paintChild(child, offset);
      }
    }
  }

  Offset _getOffset(
    Offset originalOffset,
    double badgeWidth,
    double badgeHeight,
  ) {
    var translateX = 0.0;
    var translateY = 0.0;
    final radius = min(size.width, size.height) / 2;
    final roundShift = radius / 2;

    final (double x, double y) = switch (_badgePosition) {
      BeBadgePosition.topLeft => (
          (-badgeWidth / 2) + (_rounded ? roundShift : 0),
          -badgeHeight / 2 + (_rounded ? roundShift / 3 : 0)
        ),
      BeBadgePosition.topCenter => (
          ((size.width - badgeWidth) / 2),
          -badgeHeight / 2
        ),
      BeBadgePosition.topRight => (
          (size.width - badgeWidth / 2) - (_rounded ? roundShift : 0),
          (-badgeHeight / 2) + (_rounded ? roundShift / 3 : 0)
        ),
      BeBadgePosition.bottomRight => (
          (size.width - badgeWidth / 2) - (_rounded ? roundShift : 0),
          (size.height - badgeHeight / 2) - (_rounded ? roundShift / 3 : 0)
        ),
      BeBadgePosition.bottomCenter => (
          (size.width - badgeWidth) / 2,
          (size.height - badgeHeight / 2)
        ),
      BeBadgePosition.bottomLeft => (
          (-badgeWidth / 2) + (_rounded ? roundShift : 0),
          (size.height - badgeHeight / 2) - (_rounded ? roundShift / 3 : 0)
        ),
      BeBadgePosition.centerLeft => (
          (-badgeWidth / 2),
          (size.height - badgeHeight) / 2
        ),
      BeBadgePosition.center => (
          (size.width - badgeWidth) / 2,
          (size.height - badgeHeight) / 2
        ),
      BeBadgePosition.centerRight => (
          (size.width - badgeWidth / 2),
          (size.height - badgeHeight) / 2
        ),
    };
    translateX = x + _offset.dx;
    translateY = y + _offset.dy;

    return originalOffset.translate(translateX, translateY);
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
      defaultHitTestChildren(
        result,
        position: position - _offset,
      );
}

class _BeBadgeChild extends ContainerBoxParentData<RenderBox>
    with ContainerParentDataMixin<RenderBox> {}

enum BeBadgePosition {
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
