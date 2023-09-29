import 'package:bego_component/src/dialog/be_safe_dialog.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

///The circular loading box in the middle of the page or pop-up window, with customizable loading copy [content] on the left, such as: loading, submitting, etc.
///
///This component does not support obtaining the animation value at the specified moment.
///
///Used in the page
///Scaffold(
///appBar: BeAppBar(
///title: 'Loading case',
///),
///body: BePageLoading(),
///)
///
///used in dialog box
///showDialog(
///context: context,
///barrierDismissible: barrierDismissible,
///useRootNavigator: useRootNavigator,
///builder: (_) {
///return BeLoadingDialog(content: content);
///});
///
///Other loading components:
///*[LinearProgressIndicator], linear loading component.
///*[RefreshIndicator], refresh the component.
///*[BeLoadingDialog], loading dialog box.

class BePageLoading extends StatelessWidget {
  const BePageLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox.square(
        dimension: 28,
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
      ),
    );
  }
}

///The loading status pop-up window constructed by [BePageLoading] displays the loading animation and loading text side by side, and in the middle of the screen. passable
///Control the display and closing of the pop-up window through [BeLoadingDialog.show] and [BeLoadingDialog.dismiss]. Will not turn off automatically.
class BeLoadingDialog extends Dialog {
  /// tag is used to mark types in BeSafeDialog
  static const String _loadingDialogTag = '_loadingDialogTag';

  const BeLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const BePageLoading();
  }

  ///Static method to display loading pop-up window.
  ///
  ///*[context] context
  ///*[content] Prompt copy when loading
  ///*[barrierDismissible] Whether to close the pop-up window when clicking on the masked background. The default is true and can be closed. For details, see [barrierDismissible] in [showDialog]
  ///*[useRootNavigator] Add the pop-up window to the rootNavigator in [context] or the nearest [Navigator], the default is true, add it to
  ///rootNavigator, see [useRootNavigator] in [showDialog] for details.
  static Future<T?> show<T>(
    BuildContext context, {
    String? content,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
  }) {
    return BeSafeDialog.show<T>(
        context: context,
        tag: _loadingDialogTag,
        barrierDismissible: barrierDismissible,
        useRootNavigator: useRootNavigator,
        builder: (_) {
          return BeTheme(
            child: BackdropFilter(
              filter: BegoStyle.dialogBlur,
              child: const BeLoadingDialog(),
            ),
          );
        });
  }

  ///Close the pop-up window.
  ///
  ///*[context] Context.
  static void dismiss<T extends Object?>(BuildContext context, [T? result]) {
    BeSafeDialog.dismiss<T>(
      context: context,
      tag: _loadingDialogTag,
      result: result,
    );
  }
}
