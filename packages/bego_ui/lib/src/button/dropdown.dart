import 'package:bego_ui/src/button/base_dropdown_button.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum OptimusDropdownButtonVariant {
  /// The default option. Use this variant for the majority of cases.
  defaultButton,

  /// Use if you want to grab the user's attention and group together main
  /// actions that don't have any clear priority.
  primary,

  /// Use in non-crucial situations, e.g., to group more actions together.
  text,
}

/// Dropdown buttons trigger a dropdown menu with more actions related to the
/// context of the button.
class OptimusDropDownButton<T> extends StatelessWidget {
  const OptimusDropDownButton({
    super.key,
    required this.child,
    required this.items,
    this.onItemSelected,
    this.size = 48,
    this.variant = OptimusDropdownButtonVariant.defaultButton,
  });

  /// Typically the button's label.
  final Widget child;

  final List<OptimusDropdownTile<T>> items;
  final ValueSetter<T>? onItemSelected;
  final double size;
  final OptimusDropdownButtonVariant variant;

  @override
  Widget build(BuildContext context) => BaseDropDownButton(
        items: items,
        onItemSelected: onItemSelected,
        size: size,
        variant: variant,
        child: child,
      );
}
