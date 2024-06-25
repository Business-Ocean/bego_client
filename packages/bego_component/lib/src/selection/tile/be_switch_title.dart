// ignore_for_file: library_private_types_in_public_api

import 'package:bego_component/src/selection/tile/be_custom_width_indicator.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

/// Description: Level 1 switching title

class BeSwitchTitle extends StatefulWidget {
  const BeSwitchTitle({
    super.key,
    required this.titleList,
    this.defaultSelectIndex = 0,
    this.onSelect,
    this.indicatorWeight = 2.0,
    this.indicatorWidth = 24.0,
    this.padding = const EdgeInsets.fromLTRB(0, 8, 8, 8),
    this.controller,
    this.selectedTextStyle,
    this.dividerColor = BegoColors.transparent,
    this.unselectedTextStyle,
  });

  /// Title copy list
  final List<String> titleList;

  /// Index is selected by default
  ///Default value 0
  final int defaultSelectIndex;

  /// Callback when selected
  /// index index of the selected title
  final void Function(int index)? onSelect;

  /// Title padding, default `EdgeInsets.fromLTRB(0, 14, 20, 14)`
  final EdgeInsets padding;

  /// The height of the underline, the default is 2
  final double indicatorWeight;

  /// Underline width, default is 24. indicatorWidth must be greater than or equal to indicatorWeight.
  final double indicatorWidth;

  /// Control tab switching, no need to pass by default
  /// Only passed when external control of tab switching is required
  final TabController? controller;

  /// Title style when selected, default `TextStyle(fontWeight: FontWeight.w600,fontSize: 18)`
  final TextStyle? selectedTextStyle;

  /// Title style when not selected, default `TextStyle(fontWeight: FontWeight.w600,fontSize: 18)`
  final TextStyle? unselectedTextStyle;

  final Color dividerColor;

  @override
  _BeSwitchTitleState createState() => _BeSwitchTitleState();
}

class _BeSwitchTitleState extends State<BeSwitchTitle>
    with TickerProviderStateMixin {
  static const Color _color = Color(0XFF243238);

  TabController? _controller;

  int _defaultSelectIndex = 0;

  @override
  void didUpdateWidget(BeSwitchTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    _defaultSelectIndex = widget.defaultSelectIndex;
    if (_controller != null) {
      _controller!.index = _defaultSelectIndex;
    }
  }

  @override
  void initState() {
    super.initState();
    _defaultSelectIndex = widget.defaultSelectIndex;
    _controller = widget.controller ??
        TabController(
          initialIndex: _defaultSelectIndex,
          length: widget.titleList.length,
          vsync: this,
        );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.titleList.length > 1) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _toggleButtonsWidget(context),
          // const Divider(),
        ],
      );
    } else {
      return _toggleButtonsWidget(context);
    }
  }

  Widget _toggleButtonsWidget(context) {
    if (widget.titleList.isEmpty) {
      return emptyWidget;
    }

    final List<Widget> widgetChildren = widget.titleList.map((name) {
      final tx = BeText(name);

      /// When there is an underline, you need to subtract 3 from the height of the underline.
      final tempBottomPadding = widget.padding.bottom;
      var bottomPadding = widget.titleList.length == 1
          ? tempBottomPadding
          : tempBottomPadding - 3;
      if (bottomPadding < 0) {
        bottomPadding = 0;
      }

      return Container(
        padding: EdgeInsets.fromLTRB(
          widget.padding.left,
          widget.padding.top,
          widget.padding.right,
          bottomPadding,
        ),
        child: tx,
      );
    }).toList();

    final Decoration indicator = CustomWidthUnderlineTabIndicator(
      width: widget.indicatorWidth,
      insets: EdgeInsets.only(
        left: widget.padding.left,
        right: widget.padding.right,
      ),
      borderSide: BorderSide(
        width: widget.indicatorWeight,
        color: becolors.primary,
      ),
    );

    return TabBar(
      padding: EdgeInsets.zero,
      dividerColor: widget.dividerColor,
      isScrollable: true,
      overlayColor: const WidgetStatePropertyAll(BegoColors.transparent),
      tabs: widgetChildren,
      controller: _controller,
      splashFactory: const NoSplashFactory(),
      splashBorderRadius: bestyles.borderRadius,
      tabAlignment: TabAlignment.start,
      //Selected state color. When there is only one item, the default is black and bold. When there are multiple items, it is the theme color.
      labelColor: widget.titleList.length == 1 ? _color : becolors.primary,
      labelStyle: widget.selectedTextStyle ?? bestyles.bodyMedium,
      // Set to 0 to completely control spacing by external padding
      labelPadding: EdgeInsets.zero,
      //Unselected state color
      unselectedLabelColor: _color,
      //Unselected state style
      unselectedLabelStyle: widget.unselectedTextStyle ?? bestyles.bodyMedium,
      indicator:
          widget.titleList.length == 1 ? const BoxDecoration() : indicator,
      // Set weight to 0 and let the outside set the distance between the underline and the title through padding.
      indicatorWeight: 0,
      onTap: (index) {
        if (widget.titleList.length > 1) {
          widget.onSelect?.call(index);
        }
      },
    );
  }
}
