import 'package:flutter/material.dart';

/// Create popup menu item.
class BePopupMenuItem {
  BePopupMenuItem({
    required this.onPressed,
    this.icon,
    required this.label,
  });
  final void Function() onPressed;
  final Widget? icon;
  final String label;
}
