import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/themes/be_theme.dart';
import 'package:bego_ui/src/widgets/text/be_text_responsive.dart';
import 'package:flutter/material.dart';

class BeText extends StatelessWidget {
  const BeText(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
  });

  final String? text;
  final Color? color;
  final int? maxLine;
  final TextAlign? align;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) => text == null
      ? zeroWidget
      : BeTextResponsive(
          resolveStyle: (_) => const TextStyle(),
          color: color,
          maxLines: maxLine,
          align: align,
          child: Padding(
            padding: padding ?? BeTheme.of(context).beinsets.defaultText,
            child: Text(text!),
          ),
        );
}
