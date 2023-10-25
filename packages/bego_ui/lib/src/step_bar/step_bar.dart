import 'dart:math';

import 'package:bego_core/bego_dfunc.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/helper/context_extensions.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:bego_ui/src/step_bar/_step_bar_common.dart';
import 'package:flutter/material.dart';

/// Step-bars are used to communicate a sense of progress visually through
/// a sequence of either numbered or logical steps.
///
/// Every step-bar is composed of repeatable elements in individual steps
/// linked by either horizontal or vertical lines to convey the sense
/// of journeying through a process.
class BeStepBar extends StatefulWidget {
  const BeStepBar({
    super.key,
    required this.type,
    required this.layout,
    required this.items,
    this.currentItem = 0,
    this.maxItem,
  });

  /// Type of the step bar.
  final BeStepBarType type;

  /// Whether the step bar would be laid out horizontally or vertically.
  ///
  /// For screen size of Breakpoint.extraSmall] and Breakpoint.small]
  /// this parameter is ignored and [Axis.vertical] is always used.
  final Axis layout;

  /// Step bar items.
  final List<BeStepBarItem> items;

  /// Current (active) step.
  final int currentItem;

  /// The maximum enabled step.
  ///
  /// All the steps after [maxItem] will be disabled. If `null` all the steps
  /// are enabled.
  final int? maxItem;

  @override
  State<BeStepBar> createState() => _BeStepBarState();
}

class _BeStepBarState extends State<BeStepBar> {
  BeStepBarItemState _getItemState(BeStepBarItem item) {
    final position = widget.items.indexOf(item);
    if (position == widget.currentItem) {
      return BeStepBarItemState.active;
    }
    if (position < widget.currentItem) {
      return BeStepBarItemState.completed;
    }

    final maxItem = widget.maxItem;

    return maxItem == null || position <= maxItem
        ? BeStepBarItemState.enabled
        : BeStepBarItemState.disabled;
  }

  String _indicatorText(BeStepBarItem item) =>
      (widget.items.indexOf(item) + 1).toString();

  List<Widget> _buildItems(List<BeStepBarItem> items, double maxWidth) => items
      .intersperseWith(
        itemBuilder: (item) => StepBarItem(
          maxWidth: maxWidth,
          item: item,
          state: _getItemState(item),
          type: widget.type,
          indicatorText: _indicatorText(item),
        ),
        separatorBuilder: (_, nextItem) => StepBarSpacer(
          nextItemState: _getItemState(nextItem),
          layout: _effectiveLayout,
        ),
      )
      .toList();

  Axis get _effectiveLayout =>
      context.mediaQuery.screenBreakPoint.index > BeBreakpoint.small.index
          ? widget.layout
          : Axis.vertical;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final totalSpacerWidth = (widget.items.length - 1) * spacerMinWidth;
          final totalFreeSpace =
              (constraints.maxWidth - totalSpacerWidth) / widget.items.length;
          final maxItemWidth = max(totalFreeSpace, itemMinWidth);

          return BeStack(
            mainAxisSize: _effectiveLayout == Axis.vertical
                ? MainAxisSize.min
                : MainAxisSize.max,
            direction: _effectiveLayout,
            crossAxisAlignment: _effectiveLayout == Axis.vertical
                ? BeStackAlignment.start
                : BeStackAlignment.center,
            children: _buildItems(widget.items, maxItemWidth),
          );
        },
      );
}

enum BeStepBarType { icon, numbered }
