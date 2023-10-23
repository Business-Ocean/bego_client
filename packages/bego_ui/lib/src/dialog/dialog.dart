// import 'package:bego_ui/bego_ui.dart';
// import 'package:bego_ui/src/common/common.dart';
// import 'package:bego_ui/src/dialog/dialog_content.dart';
// import 'package:bego_ui/src/dialog/dialog_size.dart';
// import 'package:bego_ui/src/layout/be_breakpoint.dart';
// import 'package:flutter/material.dart';

// /// The position of a dialog is determined by functionality.
// enum OptimusDialogPosition {
//   /// Centered dialogs direct user attention to their content in order to make
//   /// users focus on a single task within them. They are used in combination
//   /// with modal behavior.
//   center,

//   /// Corner dialogs usually deliver non-vital messages to users. These dialogs
//   /// are non-modal and keep their position when scrolling a page.
//   corner,
// }

// class OptimusDialogAction {
//   const OptimusDialogAction({
//     required this.title,
//     this.onPressed,
//     this.key,
//   });

//   final Widget title;
//   final VoidCallback? onPressed;
//   final Key? key;
// }

// /// [isDismissible] – If a dialog contains a close icon, it can also be closed
// /// by clicking on background layer. Otherwise, only by buttons.
// Future<T?> showOptimusDialog<T>({
//   required BuildContext context,
//   required Widget title,
//   Widget? content,
//   ContentWrapperBuilder? contentWrapperBuilder,
//   List<OptimusDialogAction> actions = const [],
//   OptimusDialogSize size = OptimusDialogSize.regular,
//   OptimusDialogType type = OptimusDialogType.common,
//   bool isDismissible = true,
//   bool useRootNavigator = true,
// }) =>
//     showGeneralDialog<T>(
//       context: context,
//       pageBuilder: (buildContext, animation, secondaryAnimation) =>
//           OptimusDialog.modal(
//         title: title,
//         content: content,
//         contentWrapperBuilder: contentWrapperBuilder,
//         actions: actions,
//         size: size,
//         type: type,
//       ),
//       barrierDismissible: isDismissible,
//       barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
//       barrierColor: BeTheme.of(context).colors.dialogBackground,
//       transitionDuration: const Duration(milliseconds: 150),
//       transitionBuilder: (_, animation, __, child) => FadeTransition(
//         opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
//         child: child,
//       ),
//       useRootNavigator: useRootNavigator,
//     );

// /// A dialog is an overlay on top of a main page which lets a user perform
// /// a short term task without losing the context of the underlying page.
// class OptimusDialog extends StatelessWidget {
//   const OptimusDialog._({
//     super.key,
//     required this.title,
//     required this.content,
//     this.contentWrapperBuilder,
//     this.actions = const [],
//     this.size = OptimusDialogSize.regular,
//     this.type = OptimusDialogType.common,
//     this.close,
//     this.isDismissible,
//     this.position = OptimusDialogPosition.center,
//   });

//   const OptimusDialog.modal({
//     Key? key,
//     required Widget title,
//     Widget? content,
//     ContentWrapperBuilder? contentWrapperBuilder,
//     List<OptimusDialogAction> actions = const [],
//     OptimusDialogSize size = OptimusDialogSize.regular,
//     OptimusDialogType type = OptimusDialogType.common,
//     bool? isDismissible,
//   }) : this._(
//           key: key,
//           title: title,
//           content: content,
//           contentWrapperBuilder: contentWrapperBuilder,
//           actions: actions,
//           size: size,
//           type: type,
//           isDismissible: isDismissible,
//         );

//   const OptimusDialog.nonModal({
//     Key? key,
//     required Widget title,
//     Widget? content,
//     ContentWrapperBuilder? contentWrapperBuilder,
//     List<OptimusDialogAction> actions = const [],
//     OptimusDialogSize size = OptimusDialogSize.regular,
//     bool? isDismissible,
//     required VoidCallback close,
//   }) : this._(
//           key: key,
//           title: title,
//           content: content,
//           contentWrapperBuilder: contentWrapperBuilder,
//           actions: actions,
//           size: size == OptimusDialogSize.large
//               ? OptimusDialogSize.regular
//               : size,
//           isDismissible: isDismissible,
//           close: close,
//           position: OptimusDialogPosition.corner,
//         );

//   final VoidCallback? close;
//   final bool? isDismissible;
//   final OptimusDialogPosition position;

//   /// Serves as an identification of the action in the dialog. Can be
//   /// a sentence, question, or just a subject.
//   final Widget title;

//   final Widget? content;

//   /// {@template optimus.dialog.wrapper}
//   /// Builds custom content. If content padding needed wrap in
//   /// [OptimusDialogContentPadding].
//   /// {@endtemplate}
//   final ContentWrapperBuilder? contentWrapperBuilder;

//   /// {@template optimus.dialog.actions}
//   /// Controls dialog actions.
//   ///
//   /// First button should always contain primary action. When single button it
//   /// has [OptimusButtonVariant.tertiary] variant, otherwise it has
//   /// [OptimusButtonVariant.primary] variant for [OptimusDialogType.common] type
//   /// or [OptimusButtonVariant.danger] variant for
//   /// [OptimusDialogType.destructive] type.
//   ///
//   /// Second button represents secondary action. It always has
//   /// [OptimusButtonVariant.tertiary] variant.
//   ///
//   /// All other buttons have [OptimusButtonVariant.ghost] variant and represent
//   /// additional actions.
//   /// {@endtemplate}
//   final List<OptimusDialogAction> actions;

//   /// Controls dialog size.
//   ///
//   /// If screen size is small ([Breakpoint.small] or less), this parameter is
//   /// ignored and [OptimusDialogSize.small] is always used.
//   final OptimusDialogSize size;

//   final OptimusDialogType type;

//   OptimusDialogSize _autoSize(BuildContext context) =>
//       switch (MediaQuery.sizeOf(context).screenBreakPoint) {
//         BeBreakpoint.extraSmall ||
//         BeBreakpoint.small =>
//           OptimusDialogSize.small,
//         BeBreakpoint.medium ||
//         BeBreakpoint.large ||
//         BeBreakpoint.extraLarge =>
//           size,
//       };

//   Alignment _alignment(BuildContext context) =>
//       switch (MediaQuery.sizeOf(context).screenBreakPoint) {
//         BeBreakpoint.extraSmall || BeBreakpoint.small => _smallScreenAlignment,
//         BeBreakpoint.medium ||
//         BeBreakpoint.large ||
//         BeBreakpoint.extraLarge =>
//           _largeScreenAlignment,
//       };

//   Alignment get _smallScreenAlignment => switch (position) {
//         OptimusDialogPosition.center => Alignment.center,
//         OptimusDialogPosition.corner => Alignment.topCenter,
//       };

//   Alignment get _largeScreenAlignment => switch (position) {
//         OptimusDialogPosition.center => Alignment.center,
//         OptimusDialogPosition.corner => Alignment.bottomRight,
//       };

//   @override
//   Widget build(BuildContext context) {
//     final size = _autoSize(context);

//     return SafeArea(
//       child: Align(
//         alignment: _alignment(context),
//         child: DialogContent(
//           title: title,
//           content: content,
//           actions: actions,
//           type: type,
//           size: size,
//           maxWidth: size.width,
//           spacing: 32,
//           margin: MediaQuery.viewInsetsOf(context),
//           contentWrapperBuilder: contentWrapperBuilder,
//           isDismissible: isDismissible,
//           close: close,
//         ),
//       ),
//     );
//   }
// }

// class OptimusDialogContentPadding extends StatelessWidget {
//   const OptimusDialogContentPadding({
//     super.key,
//     this.child,
//   });

//   final Widget? child;

//   @override
//   Widget build(BuildContext context) =>
//       Padding(padding: const EdgeInsets.all(16), child: child);
// }
