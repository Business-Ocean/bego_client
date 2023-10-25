// import 'package:bego_ui/bego_ui.dart';
// import 'package:bego_ui/src/common/common.dart';
// import 'package:bego_ui/src/dialog/dialog.dart';
// import 'package:bego_ui/src/dialog/dialog_size.dart';
// import 'package:bego_ui/src/list/be_no_scroll_behaviour.dart';
// import 'package:flutter/material.dart';

// class DialogContent extends StatelessWidget {
//   const DialogContent({
//     super.key,
//     required this.actions,
//     required this.type,
//     required this.size,
//     required this.maxWidth,
//     this.content,
//     this.title,
//     this.close,
//     this.isDismissible,
//     this.contentWrapperBuilder,
//     this.spacing,
//     this.margin,
//   }) : assert(
//           title != null || content != null,
//           'Either title or content need to be provided',
//         );

//   final List<BeDialogAction> actions;
//   final Widget? title;
//   final double? spacing;
//   final double maxWidth;
//   final EdgeInsetsGeometry? margin;

//   final Widget? content;
//   final VoidCallback? close;
//   final BeDialogSize size;
//   final bool? isDismissible;
//   final BeDialogType type;

//   final ContentWrapperBuilder? contentWrapperBuilder;

//   // Widget _divider(BeThemeData theme) =>
//   // Divider(height: 1, color: theme.colors.divider);

//   @override
//   Widget build(BuildContext context) {
//     final theme = BeTheme.of(context);
//     final title = this.title;
//     final content = this.content;

//     return Padding(
//       padding: EdgeInsets.all(spacing ?? 0),
//       child: ConstrainedBox(
//         constraints: BoxConstraints(maxWidth: maxWidth),
//         child: Material(
//           color: theme.colors.scaffoldBackground,
//           child: Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               boxShadow: BegoShadows.boxShadow1,
//               color: becolors(context).scaffoldBackground,
//               borderRadius: bestyles(context).borderRadius,
//             ),
//             // position: DecorationPosition.foreground,

//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 if (title != null) title,
//                 if (content != null)
//                   _Content(
//                     content: content,
//                     contentWrapperBuilder: contentWrapperBuilder,
//                   ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Content extends StatelessWidget {
//   const _Content({
//     required this.content,
//     this.contentWrapperBuilder,
//   });

//   final Widget content;
//   final ContentWrapperBuilder? contentWrapperBuilder;

//   @override
//   Widget build(BuildContext context) {
//     final contentWrapperBuilder = this.contentWrapperBuilder;
//     final wrappedContent = contentWrapperBuilder == null
//         ? BeNoScrollScrollConfiguration(
//             child: SingleChildScrollView(
//               child: BeDialogContentPadding(child: content),
//             ),
//           )
//         : contentWrapperBuilder(context, content);

//     return Flexible(fit: FlexFit.loose, child: wrappedContent);
//   }
// }
