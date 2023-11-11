import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

///Click event callback of Action Item
typedef BeCommonActionSheetItemClickCallBack = void Function(
  int index,
  BeCommonActionSheetItem actionItem,
);

/// Action Item click event interception callback
typedef BeCommonActionSheetItemClickInterceptor = bool Function(
  int index,
  BeCommonActionSheetItem actionItem,
);

/// create BeCommonActionSheetItem
class BeCommonActionSheetItem {
  BeCommonActionSheetItem(
    this.title, {
    this.desc,
    this.titleStyle,
    this.descStyle,
  });

  /// Title text
  String title;

  /// Supplementary information
  String? desc;

  /// Main title text style
  final TextStyle? titleStyle;

  /// Auxiliary information text style
  final TextStyle? descStyle;
}

class BeCommonActionSheet extends StatelessWidget {
  const BeCommonActionSheet({
    super.key,
    required this.actions,
    this.title,
    this.titleWidget,
    this.cancelTitle,
    this.clickCallBack,
    this.separatorLineColor,
    this.spaceColor = const Color(0xfff8f8f8),
    this.maxTitleLines = 2,
    this.maxSheetHeight = 0,
    this.onItemClickInterceptor,
  });

  /// List of configuration information related to each option
  /// Each option supports modification content, see [BeCommonActionSheetItem]
  final List<BeCommonActionSheetItem> actions;

  /// ActionSheet title
  final String? title;

  /// The title area widget is mutually exclusive with the title field. When titleWidget is not null, titleWidget is used first.
  final Widget? titleWidget;

  /// Color of the dividing line between Actions, default value Color(0xfff0f0f0)
  final Color? separatorLineColor;

  /// The color of the dividing line between the cancel button and the Action, default value Color(0xfff8f8f8)
  final Color spaceColor;

  /// Cancel button text
  final String? cancelTitle;

  /// The maximum number of lines in the title, the default is 2
  final int maxTitleLines;

  /// The maximum height limit of the list, the default is the screen height minus the upper and lower safety distance
  /// Default is 0
  final double maxSheetHeight;

  /// Click event of Action Item
  final BeCommonActionSheetItemClickCallBack? clickCallBack;

  /// Action Item click event interception callback
  final BeCommonActionSheetItemClickInterceptor? onItemClickInterceptor;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQueryData.fromView(View.of(context)).padding;
    final maxHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;

    var maxSheetHeight = 0.0;

    if (maxSheetHeight <= 0.0 || maxSheetHeight > maxHeight) {
      maxSheetHeight = maxHeight;
    }
    return GestureDetector(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: bestyles(context).bottomSheetRadius,
          ),
        ),
        child: SafeArea(child: _configActionWidgets(context, maxSheetHeight)),
      ),
      onVerticalDragUpdate: (v) => {},
    );
  }

  ///Build the button of actionSheet
  Widget _configActionWidgets(BuildContext context, double maxSheetHeight) {
    final widgets = <Widget>[];
    // Build the overall title
    if (titleWidget != null) {
      //If passed in, use it directly
      widgets.add(titleWidget!);
    } else if (title != null && title.toString().trim() != '') {
      // If only the title is passed in, the default title will be constructed based on the copy.
      widgets.add(_configTitleActions());
    }
    widgets
      ..add(_configListActions(context))
      ..add(
        Divider(
          color: spaceColor,
          thickness: 1,
          height: 1,
        ),
      )
      ..add(_configCancelAction(context));

    return Container(
      constraints: BoxConstraints(maxHeight: maxSheetHeight),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: widgets,
      ),
    );
  }

  /// Build title widget
  // Build the overall title
  Widget _configTitleActions() => Column(
        children: <Widget>[
          Center(
            child: Text(
              title!,
              textAlign: TextAlign.center,
              maxLines: maxTitleLines,
            ),
          ),
          Divider(
            //If there is a title, add a dividing line
            thickness: 1,
            height: 1,
            color: separatorLineColor,
          ),
        ],
      );

  /// Build list widget
  Widget _configListActions(BuildContext context) {
    final tiles = <Widget>[];
    //Build list content
    for (var index = 0; index < actions.length; index++) {
      tiles
        ..add(
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              child: _configTile(actions[index]),
            ),
            onTap: () {
              if (onItemClickInterceptor == null ||
                  !onItemClickInterceptor!(index, actions[index])) {
                // It is recommended to use callback methods to handle click events!!!!!!!!!!
                if (clickCallBack != null) {
                  clickCallBack!(index, actions[index]);
                }
                // If not intercepted, pop out the current page and carry information (it is not recommended to use this information for click time processing)
                Navigator.of(context).pop([index, actions[index]]);
              }
            },
          ),
        )
        ..add(
          Divider(
            thickness: 1,
            height: 1,
            color: separatorLineColor,
          ),
        );
    }
    return Flexible(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: tiles,
      ),
    );
  }

  /// Configure internal information for each option
  /// action configuration item for each item [BeCommonActionSheetItem]
  Widget _configTile(BeCommonActionSheetItem action) {
    final tileElements = <Widget>[
      Center(
        child: Text(
          action.title,
          maxLines: 1,
        ),
      ),
    ];
    // If there is auxiliary information, add auxiliary information
    if (action.desc != null) {
      tileElements
        ..add(
          const SizedBox(
            height: 2,
          ),
        )
        ..add(
          Center(
            child: Text(
              action.desc!,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
          ),
        );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: tileElements,
    );
  }

  /// Build a cancel operation button
  Widget _configCancelAction(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          // color: const Color(0xffffffff),
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: BeText.labelMedium(
                cancelTitle ?? 'Cancled',
              ),
            ),
          ),
        ),
      );
}
