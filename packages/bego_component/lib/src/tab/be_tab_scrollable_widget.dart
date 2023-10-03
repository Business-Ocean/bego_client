import 'package:bego_component/bego_component.dart';
import 'package:bego_component/src/tab/_tab_scrollable_controller.dart';
import 'package:bindings_compatible/bindings_compatible.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Build the Widget at the specified index
typedef TabLinkedContentBuilder<T> = (Widget, Widget) Function(
  BuildContext context,
  BeTabWithContent<T> tabWithContent,
);
typedef TabTapHandler<T> = void Function(
  BeTabWithContent<T> tabWithContent,
);

class BeTabScrollableWidget<T> extends StatefulWidget {
  const BeTabScrollableWidget({
    super.key,
    required this.tabs,
    required this.tabLinkedContentBuilder,
    this.tabClicked,
    this.controller,
  });
  final List<BeTabWithContent<T>> tabs;
  final TabLinkedContentBuilder<T> tabLinkedContentBuilder;
  final TabTapHandler<T>? tabClicked;

  final TabController? controller;
  @override
  State<BeTabScrollableWidget<T>> createState() =>
      _BeTabScrollableWidgetState();
}

class _BeTabScrollableWidgetState<T> extends State<BeTabScrollableWidget<T>>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;

  late final TabController _tabController;

  late final GlobalKey _key;

  late final List<double> _cardOffsetList;
  late final List<GlobalKey> _bodyKeyList;

  /// beTabBarBadge expands more close handling controllers
  BeCloseWindowPopupController? _closeWindowController;
  // The position of the sliding component on the screen

  /// beTabBarBadge expands more data processing controllers
  late BeTabbarController _beTabbarController;
  double listDy = 0;
  bool tab = false;

  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _bodyKeyList = [];
    _key = GlobalKey();
    _scrollController = ScrollController();

    _cardOffsetList = List.filled(widget.tabs.length, -1.0);
    _tabController = TabController(length: widget.tabs.length, vsync: this);

    useWidgetsBinding().addPostFrameCallback((_) {
      _fillOffset();
      _scrollController.addListener(() {
        _updateOffset();
        currentIndex = createIndex(_scrollController.offset);
        //Prevent sending message again
        if (!tab) {
          _tabController.index = currentIndex;
        }
      });
    });
  }

  void fillKeyList() {
    for (final _ in widget.tabs) {
      _bodyKeyList.add(GlobalKey());
    }
  }

  @override
  void didUpdateWidget(BeTabScrollableWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    _cardOffsetList = List.filled(widget.tabs.length, -1.0);
    final sub = widget.tabs.length - oldWidget.tabs.length;
    if (sub < 0) {
      _bodyKeyList = _bodyKeyList.sublist(0, widget.tabs.length);
    } else if (sub > 0) {
      for (var i = 0; i < sub; i++) {
        _bodyKeyList.add(GlobalKey());
      }
    }
    if (sub != 0) {
      _tabController = TabController(length: widget.tabs.length, vsync: this);
    }
    _tabController.addListener(() {
      _closeWindowController?.syncWindowState(_beTabbarController.isShow);

      // Update TabBar selected position
      if (widget.controller != null) {
        widget.controller!.animateTo(_beTabbarController.selectIndex);
      }
      // Refresh the selected TabBar red dot
      refreshBadgeState(_beTabbarController.selectIndex);
      //Update Tabbar with more icon styles
      setState(() {});
    });

    useWidgetsBinding().addPostFrameCallback((_) {
      _fillOffset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final multiListWidget = buildTabContainWidgets();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _tabController,
          tabs: multiListWidget.$1,
          automaticIndicatorColorAdjustment: true,
          dragStartBehavior: DragStartBehavior.start,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabAlignment: TabAlignment.start,
          onTap: (index) {
            //  final tabWithContent= widget.tabs[index];
            //  state.refreshBadgeState(index);
            currentIndex = index;
            tab = true;
            _scrollController
                .animateTo(
              _cardOffsetList[index],
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            )
                .whenComplete(
              () {
                tab = false;
              },
            );
          },
        ),
        Expanded(
          child: SingleChildScrollView(
            key: _key,
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: multiListWidget.$2,
            ),
          ),
        ),
      ],
    );
  }

  (List<Widget> tabWidgets, List<Widget> tabContent) buildTabContainWidgets() {
    final tabWidgets = <Widget>[];
    final tabContent = <Widget>[];
    (Widget, Widget) items;
    for (final tabData in widget.tabs) {
      if (tabData.data == null) continue;
      final key = GlobalKey();
      _bodyKeyList.add(key);
      items = widget.tabLinkedContentBuilder(context, tabData);
      tabWidgets.add(items.$1);
      tabContent.add(Container(key: key, child: items.$2));
    }

    return (tabWidgets, tabContent);
  }

  void _fillOffset() {
    final globalToLocal = (_key.currentContext!.findRenderObject() as RenderBox)
        .localToGlobal(Offset.zero);
    listDy = globalToLocal.dy;
    final n = widget.tabs.length;
    for (var i = 0; i < n; i++) {
      if (_cardOffsetList[i] == -1.0 &&
          _bodyKeyList[i].currentContext != null) {
        final cardOffset =
            (_bodyKeyList[i].currentContext!.findRenderObject() as RenderBox)
                .localToGlobal(
                  Offset.zero,
                ) //The position of the control relative to the origin
                .dy; //y point coordinates

        _cardOffsetList[i] = cardOffset + _scrollController.offset - listDy;
      }
    }
  }

  void _updateOffset() {
    for (var i = 0; i < widget.tabs.length; i++) {
      if (_bodyKeyList[i].currentContext != null) {
        final cardOffset =
            (_bodyKeyList[i].currentContext!.findRenderObject() as RenderBox)
                .localToGlobal(
                  Offset.zero,
                ) //The position of the control relative to the origin
                .dy;
//y point coordinates

        _cardOffsetList[i] = cardOffset + _scrollController.offset - listDy;
      }
    }
  }

  void refreshBadgeState(int index) {
    setState(() {
      final badgeTab = widget.tabs[index];
      if (badgeTab.isAutoDismiss) {
        badgeTab
          ..badgeText = null
          ..showRedBadge = false;
      }
    });
  }

  /// Determine tab index based on offset
  int createIndex(double offset) {
    final index = widget.tabs.length - 1;
    for (var i = 0; i < widget.tabs.length - 1; i++) {
      if (offset >= _cardOffsetList[i] && (offset <= _cardOffsetList[i + 1])) {
        return i;
      }
    }
    return index;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _scrollController.dispose();
  }
}
