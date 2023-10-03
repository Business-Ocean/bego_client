// import 'package:bego_component/bego_component.dart';
// import 'package:flutter/material.dart';

// const int _scrollableLimitTabLength = 4;

// class BeTabBar extends StatefulWidget {
//   const BeTabBar({
//     super.key,
//     required this.tabs,
//     required this.controller,
//     this.tabWidth,
//     this.isScroll = false,
//   });

//   final TabController? controller;
//   final List<BadgeTab> tabs;
//   final double? tabWidth;
//   final bool isScroll;

//   @override
//   State<BeTabBar> createState() => _BeTabBarState();
// }

// class _BeTabBarState extends State<BeTabBar> with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();

//     // _beTabbarController = beTabbarController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isScrollable = widget.tabs.length > _scrollableLimitTabLength ||
//         widget.tabWidth != null ||
//         widget.isScroll;
//     return TabBar(
//       tabs: fillWidgetByDataList(isScrollable),
//       controller: widget.controller,
//       // tabs: fillWidgetByDataList(isScrollable),
//       // controller: widget.controller,
//       // isScrollable: isScrollable,
//       // labelColor: widget.labelColor ?? widget.themeData!.labelStyle.color,
//       // labelStyle: widget.labelStyle ??
//       //     widget.themeData!.labelStyle.generateTextStyle(),
//       // labelPadding: widget.labelPadding,
//       // unselectedLabelColor: widget.unselectedLabelColor ??
//       //     widget.themeData!.unselectedLabelStyle.color,
//       // unselectedLabelStyle: widget.unselectedLabelStyle ??
//       //     widget.themeData!.unselectedLabelStyle.generateTextStyle(),
//       // dragStartBehavior: widget.dragStartBehavior,
//       // onTap: (index) {
//       //   if (widget.onTap != null) {
//       //     widget.onTap!(this, index);
//       //     _beTabbarController.setSelectIndex(index);
//       //     _beTabbarController.isShow = false;
//       //     _beTabbarController.entry?.remove();
//       //     _beTabbarController.entry = null;
//       //   }
//       // },
//       // indicator: CustomWidthUnderlineTabIndicator(
//       //   insets: widget.indicatorPadding,
//       //   borderSide: BorderSide(
//       //     width: widget.themeData!.indicatorHeight,
//       //     color: widget.indicatorColor ?? widget.themeData!.labelStyle.color!,
//       //   ),
//       //   width: widget.themeData!.indicatorWidth,
//       // ),
//     );
//   }

//   List<Widget> fillWidgetByDataList(bool isScrollable) {
//     final widgets = <Widget>[];
//     final tabList = widget.tabs;
//     if (tabList.isNotEmpty) {
//       for (var i = 0; i < tabList.length; i++) {
//         final badgeTab = tabList[i];
//         final tab = Tab(
//           text: badgeTab.text,
//         );
//         widgets.add(tab);
//       }
//     }
//     return widgets;
//   }
// }
