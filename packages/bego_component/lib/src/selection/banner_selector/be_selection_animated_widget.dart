// // ignore_for_file: library_private_types_in_public_api

// import 'package:bego_component/src/selection/banner_selector/be_selection_view_controller.dart';
// import 'package:flutter/material.dart';

// /// Filter animation to display hidden components
// class BeSelectionAnimationWidget extends StatefulWidget {
//   const BeSelectionAnimationWidget({
//     super.key,
//     required this.controller,
//     required this.view,
//     this.animationMilliseconds = 100,
//   });

//   /// Used to display hidden controllers
//   final BeSelectionListViewController controller;

//   /// Subassembly
//   final Widget view;

//   ///Animation duration
//   final int animationMilliseconds;

//   @override
//   _BeSelectionAnimationWidgetState createState() =>
//       _BeSelectionAnimationWidgetState();
// }

// class _BeSelectionAnimationWidgetState
//     extends State<BeSelectionAnimationWidget>
//     with SingleTickerProviderStateMixin {
//   bool _isControllerDisposed = false;
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     widget.controller.addListener(_onController);
//     _animationController = AnimationController(
//       duration: Duration(milliseconds: widget.animationMilliseconds),
//       vsync: this,
//     );
//   }

//   @override
//   void dispose() {
//     widget.controller.removeListener(_onController);
//     _animationController.dispose();
//     _isControllerDisposed = true;
//     super.dispose();
//   }

//   _onController() {
//     _showListViewWidget();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _animationController.duration =
//         Duration(milliseconds: widget.animationMilliseconds);
//     return _buildListViewWidget();
//   }

//   void _showListViewWidget() {
//     final animation = Tween(
//       begin: 0.0,
//       end: MediaQuery.of(context).size.height -
//           (widget.controller.listViewTop ?? 0),
//     ).animate(_animationController)
//       ..addListener(() {
//         //If this line is not written, there will be no animation effect.
//         setState(() {});
//       });

//     if (_isControllerDisposed) {
//       return;
//     }

//     if (animation.status == AnimationStatus.completed) {
//       _animationController.reverse();
//     } else {
//       _animationController.forward();
//     }
//   }

//   Widget _buildListViewWidget() => Positioned(
//         // width: MediaQuery.of(context).size.width,
//         right: 0,
//         top: 0,
//         left: 0,
//         child: Material(
//           color: const Color(0xB3000000),
//           child: SizedBox(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height -
//                 (widget.controller.listViewTop ?? 0),
//             child: Padding(
//               padding: EdgeInsets.zero,
//               child: widget.view,
//             ),
//           ),
//         ),
//       );
// }
