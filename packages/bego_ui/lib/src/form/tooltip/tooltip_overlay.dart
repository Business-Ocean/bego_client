import 'package:bego_ui/src/form/tooltip/tooltip.dart';
import 'package:bego_ui/src/form/tooltip/tooltip_alignment.dart';
import 'package:flutter/material.dart';

abstract class TooltipOverlayController {
  const TooltipOverlayController();

  TooltipAlignment get alignment;
}

class TooltipOverlayData extends InheritedWidget {
  const TooltipOverlayData({
    super.key,
    required super.child,
    required this.controller,
  });

  final TooltipOverlayController controller;

  @override
  bool updateShouldNotify(TooltipOverlayData oldWidget) => true;
}

class TooltipOverlay extends StatefulWidget {
  const TooltipOverlay({
    super.key,
    required this.anchorKey,
    required this.tooltip,
    this.rootOverlay = false,
    required this.tooltipKey,
    this.position,
  });

  /// Key of the widget that should be wrapped with the tooltip.
  final GlobalKey anchorKey;

  /// Key of the tooltip widget.
  final GlobalKey tooltipKey;

  /// Tooltip widget.
  final BeTooltip tooltip;

  /// Whether the tooltip should use the root overlay.
  final bool rootOverlay;

  /// Position of the tooltip relative to the child widget. If not specified,
  /// the tooltip will be positioned automatically. Depending on the space
  /// available will be set to [BeTooltipPosition.top] or
  /// [BeTooltipPosition.bottom].
  final BeTooltipPosition? position;

  static TooltipOverlayController? of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<TooltipOverlayData>()
      ?.controller;

  @override
  State<TooltipOverlay> createState() => TooltipOverlayState();
}

class TooltipOverlayState extends State<TooltipOverlay>
    implements TooltipOverlayController {
  late Rect _savedRect = _calculateRect(widget.anchorKey);
  late Rect _tooltipRect = _calculateRect(widget.tooltipKey);
  late Size? _overlaySize = _getOverlaySize();
  late BeTooltipPosition _position = _getPreferredPosition;

  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterInitialLayoutCallback);
  }

  @override
  void didUpdateWidget(TooltipOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback(_updateRect);
  }

  double get _overlayWidth => _overlaySize?.width ?? 0;

  double get _overlayHeight => _overlaySize?.height ?? 0;

  bool get _isOnTop => _spaceTop > _spaceBottom;

  double get _spaceLeft => _savedRect.left - _widgetPadding;

  double get _spaceRight => _overlayWidth - _widgetPadding - _savedRect.right;

  double get _spaceTop => _savedRect.top - _screenPadding;

  double get _spaceBottom =>
      _overlayHeight - _screenPadding - _savedRect.bottom;

  double get _horizontalCenterLeft =>
      _savedRect.left + _savedRect.width / 2 - _tooltipRect.width / 2;

  double get _horizontalCenterRight =>
      _savedRect.left + _savedRect.width / 2 + _tooltipRect.width / 2;

  double get _verticalCenterTop =>
      _savedRect.top - _savedRect.height / 2 - _tooltipRect.height / 2;

  double get _verticalCenterBottom =>
      _savedRect.top - _savedRect.height / 2 + _tooltipRect.height / 2;

  BeTooltipPosition get _getPreferredPosition =>
      widget.position ?? _fallbackPosition;

  BeTooltipPosition get _fallbackPosition =>
      _isOnTop ? BeTooltipPosition.top : BeTooltipPosition.bottom;

  BeTooltipPosition _calculatePosition() {
    final position = widget.position;

    return position != null
        ? _isOverflowing(position)
            ? _fallbackPosition
            : position
        : _fallbackPosition;
  }

  bool _isOverflowing(BeTooltipPosition position) => switch (position) {
        BeTooltipPosition.top => _tooltipRect.top < _screenPadding,
        BeTooltipPosition.bottom =>
          _tooltipRect.bottom > _overlayHeight - _screenPadding,
        BeTooltipPosition.left => _tooltipRect.left < _screenPadding,
        BeTooltipPosition.right =>
          _tooltipRect.right > _overlayWidth - _screenPadding,
      };

  double get _leftOffset => switch (alignment) {
        TooltipAlignment.leftTop ||
        TooltipAlignment.leftCenter ||
        TooltipAlignment.leftBottom =>
          _savedRect.left - _tooltipRect.width - _sideAlignOffset,
        TooltipAlignment.rightTop ||
        TooltipAlignment.rightCenter ||
        TooltipAlignment.rightBottom =>
          _savedRect.right + _widgetPadding,
        TooltipAlignment.topLeft ||
        TooltipAlignment.bottomLeft =>
          _savedRect.right - _tooltipRect.width + _sideAlignOffset,
        TooltipAlignment.topCenter ||
        TooltipAlignment.bottomCenter =>
          _savedRect.left + (_savedRect.width / 2 - _tooltipRect.width / 2),
        TooltipAlignment.topRight ||
        TooltipAlignment.bottomRight =>
          _savedRect.left - _sideAlignOffset,
      };

  double? get _topOffset => switch (alignment) {
        TooltipAlignment.rightTop || TooltipAlignment.leftTop => null,
        TooltipAlignment.leftBottom ||
        TooltipAlignment.rightBottom =>
          _savedRect.top + _savedRect.height / 2 - _tooltipAlignOffset,
        TooltipAlignment.rightCenter ||
        TooltipAlignment.leftCenter =>
          _savedRect.top + (_savedRect.height / 2 - _tooltipRect.height / 2),
        TooltipAlignment.topCenter ||
        TooltipAlignment.topLeft ||
        TooltipAlignment.topRight =>
          _savedRect.top - _tooltipRect.height - _widgetPadding,
        TooltipAlignment.bottomLeft ||
        TooltipAlignment.bottomCenter ||
        TooltipAlignment.bottomRight =>
          _savedRect.bottom + _widgetPadding,
      };

  double? get _bottomOffset => switch (alignment) {
        TooltipAlignment.rightTop ||
        TooltipAlignment.leftTop =>
          _overlayHeight -
              _savedRect.top -
              _savedRect.height / 2 -
              _tooltipAlignOffset,
        TooltipAlignment.leftBottom ||
        TooltipAlignment.rightBottom ||
        TooltipAlignment.rightCenter ||
        TooltipAlignment.leftCenter ||
        TooltipAlignment.topCenter ||
        TooltipAlignment.topLeft ||
        TooltipAlignment.topRight ||
        TooltipAlignment.bottomLeft ||
        TooltipAlignment.bottomCenter ||
        TooltipAlignment.bottomRight =>
          null,
      };

  @override
  TooltipAlignment get alignment => switch (_position) {
        BeTooltipPosition.top => _calculateHorizontalAlignment(
            TooltipAlignment.topLeft,
            TooltipAlignment.topCenter,
            TooltipAlignment.topRight,
          ),
        BeTooltipPosition.bottom => _calculateHorizontalAlignment(
            TooltipAlignment.bottomLeft,
            TooltipAlignment.bottomCenter,
            TooltipAlignment.bottomRight,
          ),
        BeTooltipPosition.left => _calculateVerticalAlignment(
            TooltipAlignment.leftTop,
            TooltipAlignment.leftCenter,
            TooltipAlignment.leftBottom,
          ),
        BeTooltipPosition.right => _calculateVerticalAlignment(
            TooltipAlignment.rightTop,
            TooltipAlignment.rightCenter,
            TooltipAlignment.rightBottom,
          ),
      };

  TooltipAlignment _calculateHorizontalAlignment(
    TooltipAlignment start,
    TooltipAlignment center,
    TooltipAlignment end,
  ) =>
      _horizontalCenterLeft < _screenPadding ||
              _horizontalCenterRight > _overlayWidth - _screenPadding
          ? _spaceLeft > _spaceRight
              ? start
              : end
          : center;

  TooltipAlignment _calculateVerticalAlignment(
    TooltipAlignment start,
    TooltipAlignment center,
    TooltipAlignment end,
  ) =>
      _verticalCenterTop < _screenPadding ||
              _verticalCenterBottom > _overlayHeight - _screenPadding
          ? _spaceTop > _spaceBottom
              ? start
              : end
          : center;

  void _afterInitialLayoutCallback(dynamic _) {
    _updateRect(_);
    WidgetsBinding.instance.addPostFrameCallback(_afterFirstLayoutCallback);
  }

  void _afterFirstLayoutCallback(dynamic _) {
    if (!mounted) return;
    setState(() {
      _position = _calculatePosition();
      _opacity = 1.0;
    });
  }

  void _updateRect(dynamic _) {
    if (!mounted) return;
    final newRect = _calculateRect(widget.anchorKey);
    final newTooltipRect = _calculateRect(widget.tooltipKey);
    if (newRect != _savedRect || newTooltipRect != _tooltipRect) {
      final newSize = _getOverlaySize();
      setState(() {
        _savedRect = newRect;
        _tooltipRect = newTooltipRect;
        _overlaySize = newSize;
      });
    }
  }

  Rect _calculateRect(GlobalKey key) {
    final renderObject = key.currentContext?.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) return Rect.zero;
    final size = renderObject.size;

    return renderObject.localToGlobal(Offset.zero, ancestor: _getOverlay()) &
        size;
  }

  RenderBox? _getOverlay() =>
      Overlay.of(context, rootOverlay: widget.rootOverlay)
          .context
          .findRenderObject() as RenderBox?;

  Size? _getOverlaySize() => _getOverlay()?.size;

  @override
  Widget build(BuildContext context) => TooltipOverlayData(
        controller: this,
        child: Builder(
          builder: (context) => Positioned(
            left: _leftOffset,
            top: _topOffset,
            bottom: _bottomOffset,
            child: AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.easeIn,
              duration: _animationDuration,
              child: widget.tooltip,
            ),
          ),
        ),
      );
}

const double _screenPadding = 16;
const double _widgetPadding = 8;
const double _sideAlignOffset = 8;
const double _tooltipAlignOffset = 20.0;
const Duration _animationDuration = Duration(milliseconds: 100);
