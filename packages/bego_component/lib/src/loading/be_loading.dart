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
  final String? content;
  final BoxConstraints constraints;

  const BePageLoading({
    Key? key,
    this.content,
    this.constraints = const BoxConstraints(
      minWidth: 130,
      maxWidth: 130,
      minHeight: 50,
      maxHeight: 50,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double loadingMaxWidth = MediaQuery.of(context).size.width * 2 / 3;
    double iconSize = 19.0;
    double textLeftPadding = 8.0;
    double outPadding = 10.0;
    String loadingText = content ?? 'Please wait';
    // Get actual text length
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      text: TextSpan(
          text: loadingText,
          style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.none)),
    )..layout(
        maxWidth: loadingMaxWidth - iconSize - textLeftPadding, minWidth: 0);
    double maxWidth =
        textPainter.width + iconSize + textLeftPadding + outPadding * 2;

    return Center(
      child: Container(
        padding: EdgeInsets.all(outPadding),
        constraints: BoxConstraints(
            maxWidth: maxWidth, minWidth: iconSize + textLeftPadding),
        height: 50,
        width: loadingMaxWidth,
        decoration: BoxDecoration(
            color: BeTheme.of(context).becolors.primary,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: iconSize,
                width: iconSize,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: textLeftPadding),
                  child: Text(
                    loadingText,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
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

  ///The prompt text when loading, the default is `Loading...`
  final String? content;

  const BeLoadingDialog({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BePageLoading(content: content ?? 'Please wait!');
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
          return BeTheme(child: BeLoadingDialog(content: content ?? 'Loading'));
        });
  }

  ///Close the pop-up window.
  ///
  ///*[context] Context.
  static void dismiss<T extends Object?>(BuildContext context, [T? result]) {
    BeSafeDialog.dismiss<T>(
        context: context, tag: _loadingDialogTag, result: result);
  }
}
