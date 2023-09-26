import 'package:flutter/material.dart';

/// IView is which does not hold any object just abstract method which will
/// get called for different view
/// It used for creating BaseView which represent the ui of the screen.
/// and It get Invoked by DataSource base on data response
/// [showMessage] for handling information received while getting data from
/// data source.
abstract class IViewPage {
  void showLoading();
  void hideLoading();
  void showMessage(String title, String message,
      {MessageStyle style = MessageStyle.success});
  void showInfoDialog(Map<String, String> data,
      {MessageStyle style = MessageStyle.success});
}

enum MessageStyle {
  success(
      color: Color(0xFF00CC99),
      background: Color(0xFF2F3032),
      iconData: Icons.done),
  error(
      color: Color(0xFFEB5757),
      background: Color(0xFF2F3032),
      iconData: Icons.done),
  warning(
      color: Color(0xFFF2C94C),
      background: Color(0xFF2F3032),
      iconData: Icons.done),
  info(
      color: Color(0xFF5458F7),
      background: Color(0xFF2F3032),
      iconData: Icons.done);

  const MessageStyle({
    required this.color,
    required this.background,
    required this.iconData,
  });

  final Color color;
  final Color background;
  final IconData iconData;
}

// enum DialogStyle {
//   success(
//       color: Color(0xFF00CC99),
//       background: Color(0xFF2F3032),
//       iconData: Icons.done),
//   error(
//       color: Color(0xFFEB5757),
//       background: Color(0xFF2F3032),
//       iconData: Icons.done),
//   warning(
//       color: Color(0xFFF2C94C),
//       background: Color(0xFF2F3032),
//       iconData: Icons.done),
//   info(
//       color: Color(0xFF5458F7),
//       background: Color(0xFF2F3032),
//       iconData: Icons.done);

//   const DialogStyle({
//     required this.color,
//     required this.background,
//     required this.iconData,
//   });

//   final Color color;
//   final Color background;
//   final IconData iconData;
// }
