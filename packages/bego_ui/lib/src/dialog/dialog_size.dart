// enum BeDialogSize {
//   /// Intended for short, to the point messages.
//   ///
//   /// Not suitable for dialogs with a lot of UI elements. Mostly used for
//   /// non-modal dialogs to deliver users a message without preventing them from
//   /// interacting with the application. Footers in small dialogs use only
//   /// vertical button groups.
//   small,

//   /// The most common dialog size.
//   ///
//   /// Suitable for any content except those with very complex UI.
//   regular,

//   /// Intended for dialogs with complex UI elements (tables, forms with multiple
//   /// columns, etc.) or large components like images.
//   ///
//   /// It can only be used as a modal dialog with centered position.
//   large,
// }

// enum BeDialogType {
//   /// Default dialog type. Used for common action.
//   common,

//   /// Primary button has [BeDialogType.destructive] variant, used for
//   /// destructive actions.
//   destructive,
// }

// extension DialogSize on BeDialogSize {
//   double get width => switch (this) {
//         BeDialogSize.small => 320,
//         BeDialogSize.regular => 576,
//         BeDialogSize.large => 896,
//       };
// }
