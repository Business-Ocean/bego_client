import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgets/icons/icons_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icons', type: BeIcons)
Widget displayIconsUseCase(BuildContext context) => const DisplayIcons();

class DisplayIcons extends StatelessWidget {
  const DisplayIcons({super.key});

  Widget _buildItem(BuildContext context, IconDetails iconDetails) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(iconDetails.data),
            BeText(
              iconDetails.name,
              maxLine: 2,
              overflow: TextOverflow.ellipsis,
              align: TextAlign.center,
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossCount(context)),
      itemCount: begoIcons.length,
      itemBuilder: (context, index) => _buildItem(
            context,
            begoIcons[index],
          ));

  int getCrossCount(BuildContext context) {
    final value = switch (context.mediaQuery.screenBreakPoint) {
      Breakpoint.extraSmall => 3,
      Breakpoint.small => 4,
      Breakpoint.medium => 5,
      Breakpoint.large => 6,
      Breakpoint.extraLarge => 8,
    };
    return value;
  }
}
