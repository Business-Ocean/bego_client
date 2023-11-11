// import 'dart:async';

// import 'package:bego_component/bego_component.dart';
// import 'package:bego_component/src/selection/banner_selector/be_selection_animated_widget.dart';
// import 'package:bego_ui/bego_widgets.dart';
// import 'package:flutter/material.dart';

// class BeBannerSelector extends StatefulWidget {
//   const BeBannerSelector({
//     super.key,
//     required this.data,
//     this.constantTop = 0,
//     this.extraScrollController,
//   });
//   final List<String> data;

//   /// Scrolling of the external list of the list where the filter is located needs to be closed.
//   /// This is the outermost list, which is a bit disgusting,
//   /// but I can only think of this method for the time being.
//   /// If you have a better way, please tell me.
//   final ScrollController? extraScrollController;
//   final double constantTop;
//   @override
//   State<BeBannerSelector> createState() => _BeBannerSelectorState();
// }

// class _BeBannerSelectorState extends State<BeBannerSelector> {
//   late final BeSelectionListViewController listViewController =
//       BeSelectionListViewController();
//   late final StreamSubscription<dynamic> _refreshTitleSubscription;

//   // late final ScrollController? _scrollController;
//   // late final StreamSubscription<dynamic> _closeSelectionPopupWindowSubscription;
//   final bool _needRefreshTitle = true;

//   List<bool> menuItemActiveState = [];
//   @override
//   void initState() {
//     super.initState();
//     // _refreshTitleSubscription = BeEventBus.instance
//     //     .on<RefreshMenuTitleEvent>()
//     //     .listen((RefreshMenuTitleEvent event) {
//     //   _needRefreshTitle = true;
//     //   setState(() {});
//     // });

//     // _closeSelectionPopupWindowSubscription = BeEventBus.instance
//     //     .on<CloseSelectionViewEvent>()
//     //     .listen((CloseSelectionViewEvent event) {
//     //   _closeSelectionPopupWindow();
//     // });
//     // if (widget.extraScrollController != null) {
//     //   _scrollController = widget.extraScrollController!;
//     //   _scrollController!.addListener(_closeSelectionPopupWindow);
//     // }
//   }

//   @override
//   Widget build(BuildContext context) => Row(
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               RenderBox? dropDownItemRenderBox;
//               if (context.findRenderObject() != null &&
//                   context.findRenderObject() is RenderBox) {
//                 dropDownItemRenderBox = context.findRenderObject() as RenderBox;
//               }
//               final position = dropDownItemRenderBox?.localToGlobal(
//                 Offset.zero,
//                 ancestor: null,
//               );
//               final size = dropDownItemRenderBox?.size;
//               listViewController.listViewTop = (size?.height ?? 0) +
//                   (widget.constantTop ?? position?.dy ?? 0);
//               if (listViewController.isShow &&
//                   listViewController.menuIndex != 0) {
//                 listViewController.hide();
//               }

//               final entry = _createEntry(widget.data[0]);
//               Overlay.of(context).insert(entry);

//               listViewController
//                 ..entry = entry
//                 ..show(0);
//             },
//             child: const BeText('Button'),
//           ),
//         ],
//       );

//   void _closeSelectionPopupWindow() {
//     if (listViewController.isShow) {
//       listViewController.hide();
//       setState(() {
//         for (var i = 0; i < menuItemActiveState.length; i++) {
//           if (i != listViewController.menuIndex) {
//             menuItemActiveState[i] = false;
//           } else {
//             menuItemActiveState[i] = !menuItemActiveState[i];
//           }
//           // if (widget.data[listViewController.menuIndex].type == 'more') {
//           //   menuItemActiveState[i] = false;
//           // }
//         }
//       });
//     }
//   }

//   /// Create widget based on [Filter group]
//   OverlayEntry _createEntry(String entity) {
//     final content = _createContentView();
//     return OverlayEntry(
//       opaque: false,
//       maintainState: true,
//       builder: (context) => GestureDetector(
//         onTap: _closeSelectionPopupWindow,
//         child: Container(
//           padding: EdgeInsets.only(
//             top: listViewController.listViewTop ?? 0,
//           ),
//           child: Stack(
//             fit: StackFit.loose,
//             children: <Widget>[
//               BeSelectionAnimationWidget(
//                 controller: listViewController,
//                 view: content,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // _scrollController?.removeListener(_closeSelectionPopupWindow);
//     _refreshTitleSubscription.cancel();
//     // _closeSelectionPopupWindowSubscription.cancel();
//     listViewController.hide();
//     super.dispose();
//   }

//   Widget _createContentView() => Container(
//         // color: Colors.red,
//         child: InkWell(
//           onTap: () {
//             listViewController.hide();
//             BeToast.show(context, 'Hello');
//           },
//           child: const Text('Hello'),
//         ),
//       );
// }
