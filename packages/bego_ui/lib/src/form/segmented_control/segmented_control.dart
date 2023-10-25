import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/common/group_wrapper.dart';
import 'package:flutter/material.dart';

/// Segmented Control is a set of two or more segments, that provide closely
/// related choices that affect an object, state, or view.
class BeSegmentedControl<T> extends StatelessWidget {
  BeSegmentedControl({
    super.key,
    this.size = 48,
    required Iterable<BeGroupItem<T>> items,
    required this.value,
    required this.onItemSelected,
    this.label,
    this.error,
    this.isEnabled = true,
    this.isRequired = false,
    this.maxLines,
    this.direction = Axis.horizontal,
  })  : assert(
          items.map((i) => i.value).contains(value),
          'Segmented control should always have some existing value',
        ),
        items = List.unmodifiable(items);

  /// Size of the segmented control.
  final double size;

  /// List of segment control items.
  final List<BeGroupItem<T>> items;

  /// Current selected value.
  final T value;

  /// Callback that is called when user selects a new item.
  final ValueChanged<T> onItemSelected;

  /// Label of the segmented control.
  final String? label;

  /// Error message that is displayed below the segmented control.
  final String? error;

  /// Whether the segmented control is enabled or not.
  final bool isEnabled;

  /// Whether the segmented control is required or not.
  final bool isRequired;

  /// Direction of the segmented control widget.
  final Axis direction;

  /// Limits the number of lines of the segmented item text. In case of
  /// the [Axis.horizontal] this will be set to 1.
  final int? maxLines;

  int? get _maxLines => direction == Axis.horizontal ? 1 : maxLines;

  BeStackDistribution get _distribution => direction == Axis.horizontal
      ? BeStackDistribution.stretch
      : BeStackDistribution.basic;

  @override
  Widget build(BuildContext context) => GroupWrapper(
        label: label,
        error: error,
        isRequired: isRequired,
        child: BeEnabled(
          isEnabled: isEnabled,
          child: DecoratedBox(
            decoration: direction == Axis.horizontal
                ? BoxDecoration(
                    color: becolors(context).scaffoldBackground,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  )
                : const BoxDecoration(),
            child: BeStack(
              direction: direction,
              distribution: _distribution,
              spacing: 16,
              children: items
                  .map(
                    (item) => _BeSegmentedControlItem<T>(
                      value: item.value,
                      size: size,
                      groupValue: value,
                      onItemSelected: onItemSelected,
                      isEnabled: isEnabled,
                      maxLines: _maxLines,
                      child: item.label,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

class _BeSegmentedControlItem<T> extends StatefulWidget {
  const _BeSegmentedControlItem({
    super.key,
    required this.child,
    required this.size,
    required this.value,
    required this.groupValue,
    required this.onItemSelected,
    required this.isEnabled,
    required this.maxLines,
  });

  final Widget child;
  final double size;
  final T value;
  final T groupValue;
  final ValueChanged<T> onItemSelected;
  final bool isEnabled;
  final int? maxLines;

  @override
  _BeSegmentedControlItemState<T> createState() =>
      _BeSegmentedControlItemState<T>();
}

class _BeSegmentedControlItemState<T>
    extends State<_BeSegmentedControlItem<T>> {
  bool _isHovering = false;
  bool _isTappedDown = false;

  bool get _isSelected => widget.value == widget.groupValue;

  void _onHoverChanged(bool isHovering) =>
      setState(() => _isHovering = isHovering);

  void _onChanged() {
    if (!_isSelected) {
      widget.onItemSelected(widget.value);
    }
  }

  Color _color(BeThemeData theme) {
    if (!widget.isEnabled) return theme.colors.disabled;
    if (_isTappedDown) return theme.colors.primary.withAlpha(10);
    if (_isHovering) return theme.colors.primary.withAlpha(10);

    return _isSelected ? theme.colors.primary : BegoColors.transparent;
  }

  Color _foregroundColor(BeThemeData theme) {
    if (!widget.isEnabled) return theme.colors.disabled;
    if (_isHovering) return theme.colors.accent;

    return (_isSelected || _isTappedDown)
        ? BegoColors.white
        : BegoColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);

    return LayoutBuilder(
      builder: (context, constrains) => MouseRegion(
        onEnter: (_) => _onHoverChanged(true),
        onExit: (_) => _onHoverChanged(false),
        child: GestureDetector(
          onTap: _onChanged,
          onTapDown: (_) => setState(() => _isTappedDown = true),
          onTapUp: (_) => setState(() => _isTappedDown = false),
          onTapCancel: () => setState(() => _isTappedDown = false),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
              constraints: BoxConstraints(minHeight: widget.size),
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: _color(theme),
                borderRadius: theme.style.xsRadius,
              ),
              alignment: Alignment.center,
              child: DefaultTextStyle.merge(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: widget.maxLines,
                style: theme.style.labelMedium
                    .copyWith(color: _foregroundColor(theme)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constrains.adaptivePadding,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on BoxConstraints {
  double get adaptivePadding => maxWidth < 300 ? 8 : 16;
}
