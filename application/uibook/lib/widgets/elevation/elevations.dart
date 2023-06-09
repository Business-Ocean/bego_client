import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Elevation', type: BeText)
Widget displayElevationUseCase(BuildContext context) => const DisplayColors();

class DisplayColors extends StatelessWidget {
  static const List<List<BoxShadow>> _shadowList = [
    BegoShadows.boxShadow1,
    BegoShadows.boxShadow2,
    BegoShadows.boxShadow3,
    BegoShadows.boxShadow4,
    BegoShadows.boxShadow5,
  ];

  const DisplayColors({super.key});

  Widget _buildItem(BuildContext context, _BackgrounVariation group,
          List<BoxShadow> shadows) =>
      Container(
        width: double.infinity,
        height: 150,
        color: group.color,
        padding: const EdgeInsets.all(16),
        child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: bestyles(context).cardRadius,
              boxShadow: shadows,
              color: group == _BackgrounVariation.dark
                  ? BegoColors.slate900
                  : BegoColors.white),
        ),
      );

  @override
  Widget build(BuildContext context) =>
      ListView(padding: const EdgeInsets.only(top: 16), children: [
        BeText.titleLarge(
          _BackgrounVariation.light.colorName,
          color: _BackgrounVariation.dark.color,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        ...List.generate(
          _shadowList.length,
          (i) => _buildItem(context, _BackgrounVariation.light, _shadowList[i]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: _BackgrounVariation.dark.color,
          child: BeText.titleLarge(
            _BackgrounVariation.dark.colorName,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: _BackgrounVariation.light.color,
          ),
        ),
        ...List.generate(
          _shadowList.length,
          (i) => _buildItem(context, _BackgrounVariation.dark, _shadowList[i]),
        ),
      ]);
}

enum _BackgrounVariation {
  light('Light', BegoColors.white),
  dark('Dark', BegoColors.slate900);

  const _BackgrounVariation(this.colorName, this.color);
  final String colorName;
  final Color color;
}
