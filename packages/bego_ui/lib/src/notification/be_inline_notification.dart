import 'dart:math';

import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

abstract class BeInlineNotification extends StatelessWidget {
  const BeInlineNotification({super.key});

  double get height;

  Widget buildLeading(BuildContext context);
  Widget buildContent(BuildContext context);
  Widget buildTrailing(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final theme = betheme(context);

    final width = context.mediaQuery.size.width * 0.3;
    final maxWidth = max(width, 400.0);

    return Container(
      constraints:
          BoxConstraints.tightForFinite(width: maxWidth, height: height),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: BegoShadows.colorBoxShadow(Colors.grey.withAlpha(50)),
        color: theme.becolors.cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildLeading(context),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: buildContent(context),
          ),
          buildTrailing(context)
        ],
      ),
    );
  }
}
