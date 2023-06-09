import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/themes/be_theme.dart';
import 'package:bego_ui/src/widgets/text/be_text_responsive.dart';
import 'package:bego_ui/src/widgets/text/be_text_type.dart';
import 'package:bego_ui/src/widgets/text/be_text_variant.dart';
import 'package:flutter/material.dart';

class BeText extends StatelessWidget {
  const BeText(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.style,
    this.textType,
    this.overflow,
  });

  const BeText.displayLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.displayLarge,
        style = null;

  const BeText.displayMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.displayMedium,
        style = null;

  const BeText.displaySmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.displaySmall,
        style = null;

  const BeText.headlineLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.headlineLarge,
        style = null;

  const BeText.headlineMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.headlineMedium,
        style = null;

  const BeText.headlineSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.headlineSmall,
        style = null;

  const BeText.titleLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.titleLarge,
        style = null;

  const BeText.titleMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.titleMedium,
        style = null;

  const BeText.titleSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.titleSmall,
        style = null;

  const BeText.bodyLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.bodyLarge,
        style = null;

  const BeText.bodyMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.bodyMedium,
        style = null;

  const BeText.bodySmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.bodySmall,
        style = null;

  const BeText.labelLarge(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.labelLarge,
        style = null;

  const BeText.labelMedium(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.labelMedium,
        style = null;

  const BeText.labelSmall(
    this.text, {
    super.key,
    this.color,
    this.maxLine,
    this.align,
    this.padding,
    this.variant,
    this.overflow,
  })  : textType = BeTextType.labelSmall,
        style = null;

  final String? text;
  final Color? color;
  final int? maxLine;
  final TextAlign? align;
  final EdgeInsets? padding;
  final BeTextVariant? variant;
  final TextStyle? style;
  final BeTextType? textType;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final textInset = padding ?? BeTheme.of(context).beinsets.textInset;
    final textColor = color ?? variant?.textColor;
    return text == null
        ? zeroWidget
        : BeTextResponsive(
            resolveStyle: (breakPoint) =>
                style ??
                BeTheme.of(context).bestyle.textStyle(textType, breakPoint),
            color: textColor,
            maxLines: maxLine,
            overflow: overflow,
            align: align,
            child: Padding(
              padding: textInset,
              child: Text(text!),
            ),
          );
  }
}
