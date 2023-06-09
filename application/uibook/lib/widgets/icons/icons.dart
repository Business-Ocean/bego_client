import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Icons', type: BeIcons)
Widget displayIconsUseCase(BuildContext context) => const DisplayIcons();

class DisplayIcons extends StatelessWidget {
  static const List<IconData> _iconList = [
    BeIcons.icon_add,
    BeIcons.icon_apple,
    BeIcons.icon_align_top,
    BeIcons.icon_arrow_long_up_e,
    BeIcons.icon_ranching,
    BeIcons.icon_fi_rr_lock_alt,
    BeIcons.icon_lastfm_logo,
    BeIcons.icon_eject,
    BeIcons.icon_album,
    BeIcons.icon_zoom_in,
    BeIcons.icon_display_flex,
    BeIcons.icon_readme,
  ];

  const DisplayIcons({super.key});

  Widget _buildItem(BuildContext context, IconData icon) => Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.all(16),
        child: Icon(icon),
      );

  @override
  Widget build(BuildContext context) => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: getCrossCount(context)),
      itemCount: _iconList.length,
      itemBuilder: (context, index) => _buildItem(
            context,
            _iconList[index],
          ));

  int getCrossCount(BuildContext context) {
    final value = switch (context.mediaQuery.screenBreakPoint) {
      Breakpoint.extraSmall => 2,
      Breakpoint.small => 4,
      Breakpoint.medium => 6,
      Breakpoint.large => 10,
      Breakpoint.extraLarge => 12,
    };
    return value;
  }
}
