import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class BeLabelIcon extends StatelessWidget {
  const BeLabelIcon({
    super.key,
    required this.text,
    this.color,
    this.leading,
    this.label,
    this.trailing,
    this.isMandatory = false,
    this.onTrailingTap,
    this.onleadingTap,
    this.textStyle,
    this.hintStyle,
    this.hintPosition = BeBadgePosition.centerRight,
  });
  final Color? color;
  final String text;
  final String? label;
  final Widget? leading;
  final Widget? trailing;
  final bool isMandatory;
  final VoidCallback? onleadingTap;
  final VoidCallback? onTrailingTap;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final BeBadgePosition hintPosition;

  @override
  Widget build(BuildContext context) => BeTextTagged(
        label: label,
        position: hintPosition,
        tagColor: BegoColors.gray300,
        tagBackground: BegoColors.transparent,
        tagStyle: hintStyle ?? const TextStyle(fontSize: 14),
        child: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(),
            children: [
              if (leading != null) ...[
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    onTap: onleadingTap,
                    splashFactory: const NoSplashFactory(),
                    child: leading!,
                  ),
                ),
                const WidgetSpan(child: space2),
              ],
              TextSpan(
                text: text,
                style: TextStyle(color: color),
              ),
              if (isMandatory)
                TextSpan(
                  text: '*',
                  style: TextStyle(color: becolors(context).primary),
                ),
              if (trailing != null) ...[
                const WidgetSpan(child: space2),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: InkWell(
                    onTap: onTrailingTap,
                    splashFactory: const NoSplashFactory(),
                    child: trailing!,
                  ),
                ),
              ],
            ],
          ),
        ),
      );
}
