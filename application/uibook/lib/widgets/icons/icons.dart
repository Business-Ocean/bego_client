import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:uibook/widgets/icons/icons_list.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icons', type: BeIcons)
Widget displayIconsUseCase(BuildContext context) => const DisplayIcons();

class DisplayIcons extends StatelessWidget {
  const DisplayIcons({super.key});

  Widget _buildItem(BuildContext context, IconDetails iconDetails) =>
      Builder(builder: (context) {
        double scaleFactor = 1;
        return Container(
          color: becolors(context).scaffoldBackground,
          child: StatefulBuilder(builder: (context, setState) {
            return MouseRegion(
              onEnter: (_) {
                scaleFactor = 1.1;
                setState(() {});
              },
              onExit: (_) {
                scaleFactor = 1;
                setState(() {});
              },
              child: Transform.scale(
                scale: scaleFactor,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  decoration: scaleFactor == 1
                      ? null
                      : BoxDecoration(
                          color: becolors(context).primary.withAlpha(50),
                        ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconDetails.data,
                        // color: becolors(context).lightInverse,
                      ),
                      BeText(
                        iconDetails.name,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                        align: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      });
  @override
  Widget build(BuildContext context) => GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossCount(context)),
        itemCount: begoIcons.length,
        itemBuilder: (context, index) => _buildItem(
          context,
          begoIcons[index],
        ),
      );

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
