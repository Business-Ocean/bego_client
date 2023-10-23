import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/step_bar/_step_bar_common.dart';
import 'package:bego_ui/src/text/be_text_responsive.dart';
import 'package:flutter/material.dart';

/// Both types of step have dedicated states. State is shown through a visual
/// change in the step indicator and in the divider between steps.
/// All of this forms a visual distinction between the finished and unfinished
/// part of a process.
enum OptimusStepBarItemState {
  /// The step is finished. The icon is always changed to a check icon.
  completed,

  /// The step is active and unfinished.
  active,

  /// The step is inactive and unfinished.
  enabled,

  /// The step is disabled and unavailable.
  disabled,
}

class OptimusStepBarItem {
  const OptimusStepBarItem({
    required this.label,
    this.description,
    required this.icon,
  });

  final Widget label;
  final Widget? description;
  final IconData icon;
}

class StepBarItem extends StatelessWidget {
  const StepBarItem({
    super.key,
    required this.maxWidth,
    required this.item,
    required this.state,
    required this.type,
    required this.indicatorText,
  });

  final double maxWidth;
  final OptimusStepBarItem item;
  final OptimusStepBarItemState state;
  final OptimusStepBarType type;
  final String indicatorText;

  Widget get _icon => switch (type) {
        OptimusStepBarType.icon => StepBarItemIconIndicator(
            icon: item.icon,
            state: state,
            type: type,
          ),
        OptimusStepBarType.numbered =>
          StepBarItemNumberIndicator(state: state, text: indicatorText),
      };

  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);
    final description = item.description;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: itemMinWidth),
      child: BeEnabled(
        isEnabled: state != OptimusStepBarItemState.disabled,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: _itemLeftPadding),
            _icon,
            const SizedBox(width: 4),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BeTextResponsive(
                    resolveStyle: (_) => theme.style.labelMedium
                        .copyWith(overflow: TextOverflow.ellipsis),
                    maxLines: 1,
                    child: item.label,
                  ),
                  if (description != null)
                    BeTextResponsive(
                      resolveStyle: (_) => theme.style.bodySmall.copyWith(
                        overflow: TextOverflow.ellipsis,
                        color: theme.colors.text,
                      ),
                      maxLines: 1,
                      child: description,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}

class StepBarItemIconIndicator extends StatelessWidget {
  const StepBarItemIconIndicator({
    super.key,
    required this.icon,
    required this.state,
    required this.type,
  });

  final IconData icon;
  final OptimusStepBarItemState state;
  final OptimusStepBarType type;

  Color _color(BeThemeData betheme) => state == OptimusStepBarItemState.active
      ? betheme.colors.primary
      : Colors.transparent;

  IconData get _icon =>
      state == OptimusStepBarItemState.completed ? Icons.done : icon;

  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);

    return Container(
      width: _iconWrapperSize,
      height: _iconWrapperSize,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _color(theme)),
      child: Icon(_icon, color: state.iconColor),
    );
  }
}

class StepBarItemNumberIndicator extends StatelessWidget {
  const StepBarItemNumberIndicator({
    super.key,
    required this.state,
    required this.text,
  });

  final OptimusStepBarItemState state;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);

    return state == OptimusStepBarItemState.completed
        ? SizedBox(
            width: _iconWrapperSize,
            height: _iconWrapperSize,
            child: Icon(
              Icons.done,
              color: theme.colors.primary,
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _iconWrapperSize,
                height: _iconWrapperSize,
                decoration: state == OptimusStepBarItemState.active
                    ? BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colors.text,
                      )
                    : null,
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.iconBackgroundColor(theme),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: theme.style.bodyMedium.merge(
                      TextStyle(height: 1, color: state.textColor(theme)),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class StepBarSpacer extends StatelessWidget {
  const StepBarSpacer({
    super.key,
    required this.nextItemState,
    required this.layout,
  });

  final OptimusStepBarItemState nextItemState;
  final Axis layout;

  @override
  Widget build(BuildContext context) {
    final theme = BeTheme.of(context);
    final enabled = nextItemState.isAccessible;
    final color = enabled ? theme.colors.primary : theme.colors.text;

    return switch (layout) {
      Axis.horizontal => Flexible(
          child: Container(
            constraints: const BoxConstraints(minWidth: spacerMinWidth),
            height: _spacerThickness,
            color: color,
          ),
        ),
      Axis.vertical => Padding(
          padding: const EdgeInsets.only(
            left: _verticalSpacerLeftPadding,
            bottom: 4,
            top: 4,
          ),
          child: SizedBox(
            height: _spacerHeight,
            width: _spacerThickness,
            child: Container(color: color),
          ),
        ),
    };
  }
}

extension OptimusStepBarItemTheme on OptimusStepBarItemState {
  Color iconBackgroundColor(BeThemeData theme) => switch (this) {
        OptimusStepBarItemState.completed ||
        OptimusStepBarItemState.active =>
          theme.colors.primary,
        OptimusStepBarItemState.enabled ||
        OptimusStepBarItemState.disabled =>
          theme.isDark ? theme.colors.primary : theme.colors.disabled,
      };

  Color textColor(BeThemeData theme) => switch (this) {
        OptimusStepBarItemState.completed => theme.colors.primary,
        OptimusStepBarItemState.active =>
          theme.isDark ? theme.colors.primary : theme.colors.primary,
        OptimusStepBarItemState.enabled ||
        OptimusStepBarItemState.disabled =>
          theme.isDark ? theme.colors.disabled : theme.colors.disabled,
      };

  Color get iconColor => switch (this) {
        OptimusStepBarItemState.completed ||
        OptimusStepBarItemState.active =>
          BegoColors.yellow,
        OptimusStepBarItemState.enabled ||
        OptimusStepBarItemState.disabled =>
          BegoColors.green300,
      };

  bool get isAccessible =>
      this == OptimusStepBarItemState.completed ||
      this == OptimusStepBarItemState.active;
}

const _iconWrapperSize = 40.0;
const _itemLeftPadding = 8.0;
const _verticalSpacerLeftPadding = _iconWrapperSize / 2 + _itemLeftPadding;
const double _spacerHeight = 16;
const double _spacerThickness = 1;
