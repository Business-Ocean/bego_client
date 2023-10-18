// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

// class BeMultiLabel extends MultiChildRenderObjectWidget {
//   BeMultiLabel({
//     super.key,
//     required this.child,
//     required this.labels,
//   }) : super(children: [child, ...labels]);
//   final Widget child;
//   final List<BeLabelChild> labels;
//   @override
//   RenderObject createRenderObject(BuildContext context) => _BeMultiRenderObject(
//         labels: labels,
//       );

//   @override
//   void updateRenderObject(
//     BuildContext context,
//     _BeMultiRenderObject renderObject,
//   ) {
//     renderObject._labels = labels;
//   }
// }

// class _BeMultiRenderObject extends RenderBox
//     with
//         ContainerRenderObjectMixin<RenderBox, _BeBadgeChild>,
//         RenderBoxContainerDefaultsMixin<RenderBox, _BeBadgeChild> {
//   _BeMultiRenderObject({
//     required List<BeLabelChild> labels,
//   }) : _labels = labels;

//   final List<BeLabelChild> _labels;
//   set _labels(List<BeLabelChild> labels) {
//     _labels = labels;
//     markNeedsPaint();
//   }

//   @override
//   void setupParentData(covariant RenderObject child) {
//     child.parentData = _BeBadgeChild();
//   }

//   @override
//   void performLayout() {
//     var childConstraints = constraints;
//     final child = firstChild;
//     final badge = lastChild;
//     if (child != null) {
//       child.layout(constraints, parentUsesSize: true);
//       childConstraints = BoxConstraints.tight(child.size);
//     }

//     if (badge != null) {
//       badge.layout(
//         BoxConstraints.loose(
//           Size(childConstraints.minWidth, childConstraints.minHeight),
//         ),
//       );
//     }
//     size = child?.size ?? badge?.size ?? constraints.smallest;
//   }

//   @override
//   void paint(PaintingContext context, Offset offset) {
//     final children = getChildrenAsList();
//     for (final child in children) {
//       if (child is BeLabelChild) {
//         final badgeOffset =
//             _getOffset(offset, child.size.width, child.size.height);
//         context.paintChild(child, badgeOffset);
//       } else {
//         context.paintChild(child, offset);
//       }
//     }
//   }

//   @override
//   bool hitTestChildren(BoxHitTestResult result, {required Offset position}) =>
//       defaultHitTestChildren(result, position: position);

//   Offset _getOffset(
//     Offset originalOffset,
//     double labelWidth,
//     double labelHeight,
//   ) {
//     const translateX = 0.0;
//     const translateY = 0.0;
//     const position = BeMultiLabelPosition.center;

//     final (double x, double y) = switch (position) {
//       BeMultiLabelPosition.topLeft => (0, -labelHeight),
//       BeMultiLabelPosition.topCenter => (
//           ((size.width - labelWidth) / 2),
//           -labelHeight
//         ),
//       BeMultiLabelPosition.topRight => (
//           (size.width - labelWidth),
//           (-labelHeight)
//         ),
//       BeMultiLabelPosition.bottomRight => (
//           (size.width - labelWidth / 2),
//           (size.height)
//         ),
//       BeMultiLabelPosition.bottomCenter => (
//           (size.width - labelWidth) / 2,
//           (size.height)
//         ),
//       BeMultiLabelPosition.bottomLeft => ((-labelWidth / 2), (size.height)),
//       BeMultiLabelPosition.centerLeft => (
//           (-labelWidth),
//           (size.height - labelHeight) / 2
//         ),
//       BeMultiLabelPosition.center => (
//           (size.width - labelWidth) / 2,
//           (size.height - labelHeight) / 2
//         ),
//       BeMultiLabelPosition.centerRight => (
//           (size.width),
//           (size.height - labelHeight) / 2
//         ),
//     };
//     // translateX = x + _offset.dx;
//     // translateY = y + _offset.dy;

//     return originalOffset.translate(translateX, translateY);
//   }
// }

// class _BeBadgeChild extends ContainerBoxParentData<RenderBox>
//     with ContainerParentDataMixin<RenderBox> {}

// enum BeMultiLabelPosition {
//   topLeft,
//   topCenter,
//   topRight,
//   centerLeft,
//   center,
//   centerRight,
//   bottomLeft,
//   bottomCenter,
//   bottomRight,
// }

// class BeLabelChild extends SingleChildRenderObjectWidget {
//   const BeLabelChild({
//     super.key,
//     this.offset = Offset.zero,
//     required this.position,
//     required super.child,
//   });
//   final BeMultiLabelPosition position;
//   final Offset offset;

//   @override
//   RenderObject createRenderObject(BuildContext context) => _LabelRenderBox();
// }

// class _LabelRenderBox extends RenderBox
//     with RenderObjectWithChildMixin<RenderObject> {
//   // Add any properties and constructor you need

//   // @override
//   // void paint(PaintingContext context, Offset offset) {
//   //   super.paint(context, offset);
//   // }

//   // @override
//   // bool hitTestSelf(Offset position) {
//   //   // Implement hit testing logic if needed
//   //   return false;
//   // }
// }
