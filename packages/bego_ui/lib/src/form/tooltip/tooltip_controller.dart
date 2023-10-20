import 'package:bego_ui/src/form/tooltip/tooltip.dart';
import 'package:bego_ui/src/form/tooltip/tooltip_overlay.dart';
import 'package:dfunc/dfunc.dart';
import 'package:flutter/material.dart';

/// Controller for the tooltip widget. It is responsible for showing and hiding
/// the tooltip overlay entry.
class TooltipController extends StatefulWidget {
  const TooltipController({
    super.key,
    required this.anchorKey,
    required this.child,
    required this.tooltip,
    required this.tooltipKey,
    this.autoHideDuration = const Duration(seconds: 1),
    this.tooltipPosition,
  });

  /// Key of the widget that should be wrapped with the tooltip.
  final GlobalKey anchorKey;

  /// Key of the tooltip widget.
  final GlobalKey tooltipKey;

  /// Widget that should be wrapped with the tooltip.
  final Widget child;

  /// Tooltip widget.
  final BeTooltip tooltip;

  /// Position of the tooltip relative to the child widget. If not specified,
  /// the tooltip will be positioned automatically. Depending on the space
  /// available will be set to [BeTooltipPosition.top] or
  /// [BeTooltipPosition.bottom].
  final BeTooltipPosition? tooltipPosition;

  /// Duration for which the tooltip will be shown. Defaults to 1 second. If
  /// the tooltip is triggered by a mouse hover, it will not be hidden
  /// until the mouse leaves the widget.
  final Duration autoHideDuration;

  @override
  State<TooltipController> createState() => _TooltipControllerState();
}

class _TooltipControllerState extends State<TooltipController> {
  // ignore: dispose-fields, disposed in _hideTooltip
  OverlayEntry? _entry;

  OverlayEntry _createEntry() => OverlayEntry(
        builder: (context) => GestureDetector(
          onTapDown: (_) => _hideTooltip(),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              TooltipOverlay(
                anchorKey: widget.anchorKey,
                tooltipKey: widget.tooltipKey,
                position: widget.tooltipPosition,
                tooltip: widget.tooltip,
              ),
            ],
          ),
        ),
      );

  void _showTooltip({bool autoHide = true}) {
    if (_entry != null) return;

    _entry = _createEntry().also((it) {
      Overlay.of(context).insert(it);
      if (autoHide) Future.delayed(widget.autoHideDuration, _hideTooltip);
    });
  }

  void _hideTooltip() {
    _entry?.remove();
    _entry?.dispose();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => _showTooltip(autoHide: false),
        onExit: (_) => _hideTooltip(),
        child: GestureDetector(
          onTap: _showTooltip,
          child: widget.child,
        ),
      );
}
