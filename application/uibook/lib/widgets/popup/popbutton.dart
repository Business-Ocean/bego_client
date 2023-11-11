import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(
//   name: 'Buttons',
//   type: BeText,
//   designLink:
//       'https://www.figma.com/file/FGjzyMrtehR5q1tMAgSPxn/Material-Me-v2?type=design&node-id=10295%3A260064&t=6VwryFXdXr7zhTBd-1',
// )

@widgetbook.UseCase(name: 'BePopupMenuButton', type: BePopupMenuButton)
Widget displayBePopupMenuButtonUseCase(BuildContext context) {
  final list = [
    BePopupMenuItem(onPressed: () {}, label: 'Hello'),
    BePopupMenuItem(onPressed: () {}, label: 'Menu'),
    BePopupMenuItem(onPressed: () {}, label: 'Popup'),
  ];
  return BePopupMenuButton(
    children: list,
  );
}
