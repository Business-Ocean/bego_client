import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/button/dropdown.dart';
import 'package:bego_ui/src/common/common_widget.dart';
import 'package:bego_ui/src/common/overlay_controller.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tile.dart';
import 'package:flutter/material.dart';

class BaseDropDownButton<T> extends StatefulWidget {
  const BaseDropDownButton({
    super.key,
    this.child,
    required this.items,
    this.onItemSelected,
    this.size = 48,
    this.variant = BeDropdownButtonVariant.defaultButton,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.borderColor,
  });

  /// Typically the button's label.
  final Widget? child;

  final List<BeDropdownTile<T>> items;
  final ValueSetter<T>? onItemSelected;
  final double size;
  final BeDropdownButtonVariant variant;
  final BorderRadius borderRadius;
  final Color? borderColor;
  @override
  State<BaseDropDownButton<T>> createState() => _BaseDropDownButtonState<T>();
}

class _BaseDropDownButtonState<T> extends State<BaseDropDownButton<T>>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0, end: 0.5);

  final _selectFieldKey = GlobalKey();
  final _node = FocusNode();
  bool _isHovered = false;
  bool _isPressed = false;
  late final AnimationController _controller;
  late final Animation<double> _iconTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _node.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    _node
      ..removeListener(_onFocusChanged)
      ..dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  bool get _isEnabled => widget.onItemSelected != null;

  @override
  Widget build(BuildContext context) {
    final child = widget.child;
    return OverlayController(
      items: widget.items,
      anchorKey: _selectFieldKey,
      onItemSelected: widget.onItemSelected ?? (_) {},
      focusNode: _node,
      width: _dropdownWidth,
      onShown: _controller.forward,
      onHidden: _controller.reverse,
      child: IgnorePointer(
        ignoring: !_isEnabled,
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: _node.requestFocus,
            onTapDown: (_) => setState(() => _isPressed = true),
            onTapUp: (_) => setState(() => _isPressed = false),
            onTapCancel: () => setState(() => _isPressed = false),
            child: Focus(
              focusNode: _node,
              child: SizedBox(
                // height: widget.size,
                child: AnimatedContainer(
                  // padding: const EdgeInsets.symmetric(horizontal: 0),
                  key: _selectFieldKey,
                  decoration: BoxDecoration(
                    color: _isHovered || _isPressed
                        ? becolors.primary
                        : BegoColors.transparent,
                    borderRadius: widget.borderRadius,
                    border: widget.borderColor != null
                        ? Border.all(color: widget.borderColor!, width: 1)
                        : null,
                  ),
                  duration: buttonAnimationDuration,
                  curve: buttonAnimationCurve,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (child != null)
                        Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: DefaultTextStyle.merge(
                            style: BegoTextStyle.labelMedium,
                            child: child,
                          ),
                        ),
                      RotationTransition(
                        turns: _iconTurns,
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: widget.size / 2,
                          color: becolors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const double _dropdownWidth = 280;
