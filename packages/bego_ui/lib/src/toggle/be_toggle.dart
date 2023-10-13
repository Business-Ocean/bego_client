import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// The toggle component serves as a visual representation of a binary choice,
/// providing users with a clear way to control settings, preferences, or switch
/// between different views. With its ability to instantly communicate changes
/// and offer immediate feedback, the toggle component greatly enhances
/// usability and interactivity.
class BeToggle extends StatefulWidget {
  const BeToggle({
    super.key,
    this.offIcon,
    this.onIcon,
    this.isChecked = false,
    required this.onChanged,
  });

  /// An optional icon for the off state.
  final IconData? offIcon;

  /// An optional icon for the on state.
  final IconData? onIcon;

  /// Whether the toggle is checked. The state of the toggle is managed in the
  /// parent widget.
  final bool isChecked;

  /// The callback on the toggle state change. If not provided, the toggle will
  /// be disabled.
  final ValueChanged<bool>? onChanged;

  @override
  State<BeToggle> createState() => _BeToggleState();
}

class _BeToggleState extends State<BeToggle> {
  bool _isHovered = false;
  bool _isTapped = false;

  bool get _isEnabled => widget.onChanged != null;

  // Color get _iconColor => _isEnabled
  //     ? becolors.lightInverse
  //     : context.tokens.textDisabled;

  // Widget get _spacer => const SizedBox(width: spacing50);
  double get _leftPadding => widget.isChecked ? 20 : 0;

  Color get _tappedColor =>
      widget.isChecked ? becolors.primary : becolors.primary.withAlpha(200);

  Color get _hoveredColor =>
      widget.isChecked ? becolors.accent : becolors.accent.withAlpha(200);

  Color get _defaultColor => widget.isChecked
      ? becolors.darkInverse
      : becolors.darkInverse.withAlpha(200);

  Color get _color => !_isEnabled
      ? becolors.disabled
      : _isTapped
          ? _tappedColor
          : _isHovered
              ? _hoveredColor
              : _defaultColor;

  Widget get _onIcon => widget.onIcon != null
      ? Opacity(
          opacity: widget.isChecked ? 0 : 1,
          child: Icon(
            widget.onIcon,
            size: _iconSize,
            color: becolors.lightInverse,
          ),
        )
      : const SizedBox(width: _iconSize);

  Widget get _offIcon => widget.offIcon != null
      ? Opacity(
          opacity: widget.isChecked ? 1 : 0,
          child: Icon(
            widget.offIcon,
            size: _iconSize,
            color: becolors.lightInverse,
          ),
        )
      : const SizedBox(width: _iconSize);

  @override
  Widget build(BuildContext context) {
    final leftIcon = widget.offIcon;
    final rightIcon = widget.onIcon;

    return IgnorePointer(
      ignoring: !_isEnabled,
      child: MouseRegion(
        onEnter: (event) => setState(() => _isHovered = true),
        onExit: (event) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (details) => setState(() => _isTapped = true),
          onTapUp: (details) => setState(() => _isTapped = false),
          onTap: () => widget.onChanged?.call(!widget.isChecked),
          child: AnimatedContainer(
            width: _toggleWidth,
            height: _toggleHeight,
            duration: _animationDuration,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              color: _color,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(56)),
              ),
            ),
            child: Stack(
              children: [
                if (leftIcon != null || rightIcon != null)
                  Row(children: [_offIcon, space4, _onIcon]),
                AnimatedPositioned(
                  duration: _animationDuration,
                  curve: _animationCurve,
                  left: _leftPadding,
                  child: const _Knob(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Knob extends StatelessWidget {
  const _Knob();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: _iconSize,
        height: _iconSize,
        child: DecoratedBox(
          decoration: ShapeDecoration(
            color: becolors(context).primary,
            shape: const OvalBorder(),
          ),
        ),
      );
}

const Duration _animationDuration = Duration(milliseconds: 200);
const Curve _animationCurve = Curves.fastOutSlowIn;
const double _iconSize = 16;
const double _toggleWidth = 44;
const double _toggleHeight = 24;
