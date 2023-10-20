import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

class BeRadioTile<T> extends StatelessWidget {
  const BeRadioTile({
    super.key,
    required this.title,
    this.leading,
    this.description,
    this.selectedValue,
    required this.value,
    this.onChange,
  });
  final T? selectedValue;
  final T value;
  final String title;
  final String? description;
  final Widget? leading;
  final ValueChanged<T?>? onChange;

  @override
  Widget build(BuildContext context) => RadioListTile<T>(
        secondary: leading,
        controlAffinity: ListTileControlAffinity.trailing,
        title: BeText.titleMedium(
          title,
          color: BegoColors.slate900,
        ),
        subtitle: description != null
            ? BeText.bodySmall(
                description,
                color: BegoColors.slate600,
              )
            : null,
        groupValue: selectedValue,
        value: value,
        onChanged: onChange,
      );
}
