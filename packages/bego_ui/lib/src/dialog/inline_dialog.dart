// import 'package:bego_ui/src/common/anchored_overlay.dart';
// import 'package:bego_ui/src/common/common.dart';
// import 'package:bego_ui/src/dialog/dialog.dart';
// import 'package:bego_ui/src/dialog/dialog_content.dart';
// import 'package:bego_ui/src/dialog/dialog_size.dart';
// import 'package:flutter/material.dart';

// /// A dialog that is anchored to a specific widget.
// ///
// /// The dialog is used in cases where a user needs to make a local change or
// /// display extra information while keeping the main content still visible.
// class BeInlineDialog extends StatelessWidget {
//   const BeInlineDialog({
//     super.key,
//     required this.content,
//     this.contentWrapperBuilder,
//     this.actions = const [],
//     this.close,
//     required this.anchorKey,
//   });

//   /// Key of the widget that the dialog should be anchored to.
//   final GlobalKey anchorKey;

//   /// {@macro bego.dialog.wrapper}
//   final ContentWrapperBuilder? contentWrapperBuilder;

//   /// {@macro bego.dialog.actions}
//   final List<BeDialogAction> actions;

//   final VoidCallback? close;
//   final Widget content;

//   @override
//   Widget build(BuildContext context) => AnchoredOverlay(
//         anchorKey: anchorKey,
//         width: BeDialogSize.small.width,
//         child: DialogContent(
//           content: content,
//           actions: actions,
//           type: BeDialogType.common,
//           size: BeDialogSize.small,
//           maxWidth: BeDialogSize.small.width,
//           contentWrapperBuilder: contentWrapperBuilder,
//           isDismissible: true,
//           close: close,
//         ),
//       );
// }
