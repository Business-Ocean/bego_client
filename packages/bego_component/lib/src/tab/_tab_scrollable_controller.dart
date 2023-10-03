// ignore_for_file: use_setters_to_change_properties

import 'dart:async';

import 'package:flutter/material.dart';

class BeTabbarController extends ChangeNotifier {
  ///
  /// More options distance from top
  ///
  double? top;

  ///
  /// Whether to display more options popup box
  ///
  bool isShow = false;

  ///
  ///Screen height
  ///
  double? screenHeight;

  ///
  /// Expand more layers
  ///
  OverlayEntry? entry;

  ///
  /// Selected corner mark
  ///
  int selectIndex = 0;

  ///Set the selected position
  /// [index] selected position
  void setSelectIndex(int index) {
    selectIndex = index;
    notifyListeners();
  }

  /// Set more options to pop up
  void show() {
    isShow = true;
    notifyListeners();
  }

  /// Set more options to hide
  void hide() {
    isShow = false;
    notifyListeners();
  }
}

/// Close more pop-up events
class CloseWindowPopupEvent {
  CloseWindowPopupEvent({this.isShow});
  bool? isShow = false;
}

///
/// Provided to the outside for controlling the closing of more pop-up boxes
///
class BeCloseWindowPopupController {
  ///
  /// Expand whether to display more pop-up boxes
  ///
  bool isShow = false;

  final StreamController<CloseWindowPopupEvent> _closeController =
      StreamController.broadcast();

  StreamController<CloseWindowPopupEvent> getCloseController() =>
      _closeController;

  ///
  /// Synchronize the pop-up box expansion state
  ///
  void syncWindowState(bool state) {
    isShow = state;
  }

  /// Close the "More" pop-up box
  void closeMoreWindow() {
    _closeController.add(CloseWindowPopupEvent());
  }
}
