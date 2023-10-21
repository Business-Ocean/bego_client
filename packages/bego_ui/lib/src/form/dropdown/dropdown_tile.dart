import 'package:bego_ui/src/form/dropdown/base_dropdown_tile.dart';
import 'package:flutter/widgets.dart';

abstract class OptimusDropdownTile<T> extends StatelessWidget {
  const OptimusDropdownTile({super.key, required this.value});

  final T value;

  @override
  Widget build(BuildContext context);
}

class ListDropdownTile<T> extends OptimusDropdownTile<T> {
  const ListDropdownTile({
    super.key,
    required super.value,
    required this.title,
    this.subtitle,
    this.isSelected,
  });

  final Widget title;
  final Widget? subtitle;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) => BaseDropdownTile(
        title: title,
        subtitle: subtitle,
        isSelected: isSelected,
      );
}
