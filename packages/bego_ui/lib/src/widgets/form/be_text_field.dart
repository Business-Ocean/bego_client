import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeTextField extends StatelessWidget {
  const BeTextField({
    super.key,
    this.mandatory = false,
    this.hint,
    this.labelOffset,
    this.mandatoryOffset,
    this.mandatorySize = 6,
    this.labelStyle,
    this.label,
  });

  final bool mandatory;
  final String? hint;
  final Offset? labelOffset;
  final Offset? mandatoryOffset;
  final double mandatorySize;
  final TextStyle? labelStyle;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        hintText: hint ?? '',
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );

    final labelTextField = BeInputLabel(
      label: BeText(
        label,
        style: labelStyle ??
            bestyles(context)
                .labelLarge
                .copyWith(color: becolors(context).text),
      ),
      offset: labelOffset ?? const Offset(0, -4),
      child: textField,
    );
    if (!mandatory) return labelTextField;

    return BeBadge(
      offset: mandatoryOffset ?? const Offset(-3, 3),
      badge: Container(
        width: mandatorySize,
        height: mandatorySize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: becolors(context).primary,
        ),
      ),
      child: labelTextField,
    );
  }
}
