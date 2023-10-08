import 'package:flutter/material.dart';

class BeIconTextButton extends IconButton {
  BeIconTextButton({
    super.key,
    required this.buttonIcon,
    required this.buttonText,
    double space = 4,
    BeIconDirection direction = BeIconDirection.top,
    super.iconSize,
    super.visualDensity,
    super.padding,
    super.alignment,
    super.splashRadius,
    super.color,
    super.focusColor,
    super.hoverColor,
    super.highlightColor,
    super.splashColor,
    super.disabledColor,
    super.mouseCursor,
    super.focusNode,
    super.autofocus = false,
    super.tooltip,
    super.enableFeedback,
    super.constraints,
    super.style,
    super.isSelected,
    super.selectedIcon,
    required super.onPressed,
  }) : super(
          icon: switch (direction) {
            BeIconDirection.left => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buttonIcon, SizedBox(width: space), buttonText],
              ),
            BeIconDirection.right => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [buttonText, SizedBox(width: space), buttonIcon],
              ),
            BeIconDirection.top => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [buttonIcon, SizedBox(height: space), buttonText],
              ),
            BeIconDirection.bottom => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [buttonText, SizedBox(height: space), buttonIcon],
              ),
          },
        );

  final Widget buttonIcon;
  final Widget buttonText;
}

enum BeIconDirection {
  left,
  right,
  top,
  bottom,
}
