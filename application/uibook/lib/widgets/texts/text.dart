import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(
//   name: 'Buttons',
//   type: BeText,
//   designLink:
//       'https://www.figma.com/file/FGjzyMrtehR5q1tMAgSPxn/Material-Me-v2?type=design&node-id=10295%3A260064&t=6VwryFXdXr7zhTBd-1',
// )

@widgetbook.UseCase(name: 'Be Animated Text', type: BeText)
Widget displayAnimatedTextUseCase(BuildContext context) {
  return const BeAnimatedText(['Hello', 'I', 'am', 'animated text']);
}
