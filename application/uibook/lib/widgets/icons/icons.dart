import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_ui_utils.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgets/icons/icons_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icons', type: BeIcons)
Widget displayIconsUseCase(BuildContext context) => const DisplayIcons();

class DisplayIcons extends StatelessWidget {
  const DisplayIcons({super.key});

  Widget _buildItem(BuildContext context, IconDetails iconDetails) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconDetails.data,
            size: 28,
            // color: becolors(context).lightInverse,
          ),
          BeText(
            '${iconDetails.name}\n',
            maxLine: 2,
            padding: const EdgeInsets.only(top: 4, left: 8, right: 8),
            overflow: TextOverflow.ellipsis,
            align: TextAlign.center,
          ),
        ],
      );
  @override
  Widget build(BuildContext context) => Container(
        color: becolors(context).scaffoldBackground,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: getCrossCount(context)),
          itemCount: begoIcons.length,
          itemBuilder: (context, index) => _buildItem(
            context,
            begoIcons[index],
          ),
        ),
      );

  int getCrossCount(BuildContext context) {
    final value = switch (context.mediaQuery.screenBreakPoint) {
      BeBreakpoint.extraSmall => 3,
      BeBreakpoint.small => 4,
      BeBreakpoint.medium => 5,
      BeBreakpoint.large => 6,
      BeBreakpoint.extraLarge => 8,
    };
    return value;
  }
}
