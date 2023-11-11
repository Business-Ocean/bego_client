// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bego_ui/src/menu/be_popup_menu_item.dart';
import 'package:flutter/material.dart';

/// Create popup menu button.
class BePopupMenuButton extends StatelessWidget {
  const BePopupMenuButton({super.key, required this.children});

  /// A list of [BePopupMenuItem] to display as [BePopupMenuButton] children.
  final List<BePopupMenuItem> children;

  @override
  Widget build(BuildContext context) => PopupMenuButton<void Function()>(
        itemBuilder: (context) => children.map(_buildPopupMenuEntry).toList(),
        onSelected: (value) => value(),
      );

  PopupMenuEntry<void Function()> _buildPopupMenuEntry(BePopupMenuItem item) =>
      PopupMenuItem(
        value: item.onPressed,
        child: item.icon != null
            ? Row(
                children: [
                  item.icon!,
                  const SizedBox(width: 16),
                  Expanded(child: Text(item.label)),
                ],
              )
            : Text(item.label),
      );
}
