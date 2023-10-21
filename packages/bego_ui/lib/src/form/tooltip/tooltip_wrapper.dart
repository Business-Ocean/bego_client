import 'package:bego_ui/src/form/tooltip/tooltip.dart';
import 'package:bego_ui/src/form/tooltip/tooltip_controller.dart';
import 'package:flutter/material.dart';

/// Wrapper for the [BeTooltip] widget. It is responsible for showing and
/// hiding the tooltip. Will try to position the tooltip depending on the
/// available space.
class BeTooltipWrapper extends StatefulWidget {
  const BeTooltipWrapper({
    super.key,
    required this.text,
    required this.child,
    this.tooltipPosition = BeTooltipPosition.top,
    this.size,
    this.autoHideDuration = const Duration(seconds: 1),
  });

  /// Tooltip text. Typically a [Text] widget. This widget will be passed to the
  /// tooltip and styled accordingly.
  final Widget text;

  /// Widget that should be wrapped with the tooltip.
  final Widget child;

  /// Size of the tooltip.
  final double? size;

  /// Position of the tooltip relative to the child widget. If not specified,
  /// the tooltip will be positioned automatically. Defaults to
  /// [BeTooltipPosition.top] or [BeTooltipPosition.bottom], whichever
  /// has more space available.
  final BeTooltipPosition? tooltipPosition;

  /// Duration for which the tooltip will be shown.
  final Duration autoHideDuration;

  @override
  State<BeTooltipWrapper> createState() => _BeTooltipWrapperState();
}

class _BeTooltipWrapperState extends State<BeTooltipWrapper> {
  final GlobalKey _anchorKey = GlobalKey();
  final GlobalKey _tooltipKey = GlobalKey();

  @override
  Widget build(BuildContext context) => TooltipController(
        anchorKey: _anchorKey,
        tooltipKey: _tooltipKey,
        tooltipPosition: widget.tooltipPosition,
        autoHideDuration: widget.autoHideDuration,
        tooltip: BeTooltip(
          key: _tooltipKey,
          size: widget.size,
          tooltipPosition: widget.tooltipPosition,
          content: widget.text,
        ),
        child: Container(key: _anchorKey, child: widget.child),
      );
}
