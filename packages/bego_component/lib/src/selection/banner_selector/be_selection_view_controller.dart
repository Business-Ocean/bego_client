// import 'package:flutter/material.dart';

// class BeSelectionListViewController extends ChangeNotifier {
//   BeSelectionListViewController({
//     this.menuIndex = -1,
//     this.isShow = false,
//   });

//   /// Menu indexmel
//   int menuIndex;

//   /// Whether to display the drop-down filter list
//   bool isShow;

//   /// Top coordinates of the drop-down filter list
//   double? listViewTop;

//   /// Screen height, not used yet
//   double? screenHeight;

//   /// Display the layer of the drop-down filter list
//   OverlayEntry? entry;

//   /// Display drop-down filter list
//   void show(int index) {
//     isShow = true;
//     menuIndex = index;
//     notifyListeners();
//   }

//   /// Hide drop-down filter list
//   void hide() {
//     isShow = false;
//     entry?.remove();
//     entry = null;
//     notifyListeners();
//   }
// }

// // /// Filter controller
// // class BeSelectionViewController {
// //   /// Close the filter pop-up window
// //   void closeSelectionView() {
// //     BeEventBus.instance.fire(CloseSelectionViewEvent());
// //   }

// //   /// Actively refresh menu menu title
// //   void refreshSelectionTitle() {
// //     BeEventBus.instance.fire(RefreshMenuTitleEvent());
// //   }
// // }

// /// Filter events
// // abstract class BaseSelectionEvent {}

// // /// Refresh menu title event
// // class RefreshMenuTitleEvent extends BaseSelectionEvent {}

// // /// Close the filter pop-up window event
// // class CloseSelectionViewEvent extends BaseSelectionEvent {}
