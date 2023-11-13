// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/menu/be_popup_menu_item.dart';
import 'package:flutter/material.dart';

/// Create popup menu button.
class BePopupMenuButton extends StatelessWidget {
  const BePopupMenuButton({
    super.key,
    required this.children,
    this.child,
    this.enabled = true,
    this.overlap = false,
  });

  /// A list of [BePopupMenuItem] to display as [BePopupMenuButton] children.
  final List<BePopupMenuItem> children;
  final Widget? child;
  final bool enabled;
  final bool overlap;

  @override
  Widget build(BuildContext context) => PopupMenuButton<void Function()>(
        itemBuilder: (context) => children.map(_buildPopupMenuEntry).toList(),
        onSelected: (value) => value(),
        // icon: const Icon(Icons.abc),
        enabled: enabled,
        elevation: 4,
        position: overlap ? PopupMenuPosition.over : PopupMenuPosition.under,
        child: child,
      );

  PopupMenuEntry<void Function()> _buildPopupMenuEntry(BePopupMenuItem item) =>
      PopupMenuItem(
        value: item.onPressed,
        child: item.icon != null
            ? Row(
                children: [
                  item.icon!,
                  space16,
                  Expanded(child: Text(item.label)),
                ],
              )
            : Text(item.label),
      );
}
