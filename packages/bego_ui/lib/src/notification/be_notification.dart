import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/helper/theme_getter.dart';
import 'package:bego_ui/src/notification/be_inline_notification.dart';
import 'package:flutter/material.dart';

final class BeNotification extends BeInlineNotification {
  const BeNotification({
    super.key,
    this.height = 60,
    required this.title,
    required this.description,
    this.action = 'close',
    this.icon,
    this.onActionPressed,
  });

  @override
  final double height;

  final String title;
  final String description;
  final String action;
  final IconData? icon;
  final VoidCallback? onActionPressed;
  @override
  Widget buildContent(BuildContext context) => Material(
        color: becolors(context).scaffoldBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeText(
              title,
              maxLine: 1,
              textType: BeTextType.titleSmall,
            ),
            Flexible(
              child: BeText(
                description,
                maxLine: 2,
                textType: BeTextType.bodySmall,
              ),
            ),
          ],
        ),
      );

  @override
  Widget buildLeading(BuildContext context) => icon == null
      ? emptyWidget
      : Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: betheme(context).colors.primary.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: betheme(context).colors.primary,
          ),
        );

  @override
  Widget buildTrailing(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [TextButton(onPressed: onActionPressed, child: Text(action))],
      );
}
