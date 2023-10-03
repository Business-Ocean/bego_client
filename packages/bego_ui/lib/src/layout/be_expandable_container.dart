// ignore_for_file: comment_references

import 'package:flutter/material.dart';

/// A single-line [ListTile] with a trailing button that expands or collapses
/// the tile to reveal or hide the [children].
///
/// This widget is typically used with [ListView] to create an
/// "expand / collapse" list entry. When used with scrolling widgets like
/// [ListView], a unique [PageStorageKey] must be specified to enable the
/// [BeExpandableGroupWidget] to save and restore its expanded state when it is scrolled
/// in and out of view.
///
/// See also:
///
///  * [ListTile], useful for creating expansion tile [children] when the
///    expansion tile represents a sublist.
///  * The "Expand/collapse" section of

class BeExpandableContainerWidget extends StatefulWidget {
  /// Creates a single-line [ListTile] with a trailing button that expands or collapses
  /// the tile to reveal or hide the [children]. The [initiallyExpanded] property must
  /// be non-null.
  const BeExpandableContainerWidget({
    super.key,
    this.onExpansionChanged,
    this.headerBuilder,
    this.child,
    this.initiallyExpanded = false,
    this.animationDuration,
    this.expandableController,
  });
  final Widget Function(BuildContext context)? headerBuilder;

  /// A widget to display before the title.
  ///
  /// Typically a [CircleAvatar] widget.
  /// Called when the tile expands or collapses.
  ///
  /// When the tile starts expanding, this function is called with the value
  /// true. When the tile starts collapsing, this function is called with
  /// the value false.
  final ValueChanged<bool>? onExpansionChanged;

  /// The widgets that are displayed when the tile expands.
  ///
  /// Typically [ListTile] widgets.
  final Widget? child;

  /// Specifies if the list tile is initially expanded (true) or collapsed (false, the default).
  final bool initiallyExpanded;

  final Duration? animationDuration;

  final BeExpandableContainerController? expandableController;

  @override
  _BeExpansionContainerElementState createState() =>
      _BeExpansionContainerElementState();
}

class _BeExpansionContainerElementState
    extends State<BeExpandableContainerWidget>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);

  BeExpandableContainerController? _expandableController;
  AnimationController? _animationController;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  Widget? arrowIcon;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _expandableController =
        widget.expandableController ?? BeExpandableContainerController();

    _expandableController!.addListener(_expandableContainerControllerTick);
    _animationController = AnimationController(
      duration: widget.animationDuration ??
          const Duration(milliseconds: 200) /*_kExpand*/,
      vsync: this,
    );
    _heightFactor = _animationController!.drive(_easeInTween);
    if (_isExpanded) {
      _animationController!.value = 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final closed = !_isExpanded && _animationController!.isDismissed;
    return AnimatedBuilder(
      animation: _animationController!.view,
      builder: _buildHeader,
      child: closed ? null : widget.child,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _expandableController?.removeListener(_expandableContainerControllerTick);
    _expandableController = null;
    _animationController?.dispose();
  }

  void _expandableContainerControllerTick() {
    if (_expandableController!.expandableAction != BeExpandableAction.none) {
      if (_expandableController!.expandableAction ==
          BeExpandableAction.toggle) {
        _handleTap();
      } else if (_isExpanded == false &&
          _expandableController!.expandableAction ==
              BeExpandableAction.expand) {
        _handleTap();
      } else if (_isExpanded == true &&
          _expandableController!.expandableAction ==
              BeExpandableAction.collapse) {
        _handleTap();
      }
    }
    _expandableController!.expandableAction = BeExpandableAction.none;
  }

  void _handleTap() {
    if (!mounted) return;
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController!.forward();
      } else {
        _animationController!.reverse();
      }
      PageStorage.of(context).writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged!(_isExpanded);
    }
  }

  Widget _buildHeader(BuildContext context, Widget? child) {
    Widget? content;
    if (widget.headerBuilder != null) {
      content = widget.headerBuilder!(context);
    }
    content ??= Container();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            content,
          ],
        ),

        /// 可展开收起项
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: child,
          ),
        ),
      ],
    );
  }
}

class BeExpandableContainerController extends ChangeNotifier {
  BeExpandableAction expandableAction = BeExpandableAction.none;

  void toggle() {
    expandableAction = BeExpandableAction.toggle;
    notifyListeners();
  }

  void expand() {
    expandableAction = BeExpandableAction.expand;
    notifyListeners();
  }

  void collapse() {
    expandableAction = BeExpandableAction.collapse;
    notifyListeners();
  }
}

enum BeExpandableAction {
  expand,
  collapse,
  toggle,
  none,
}
