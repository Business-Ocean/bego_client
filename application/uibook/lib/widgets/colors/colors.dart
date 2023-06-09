import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Colors & Utils', type: BeText)
Widget displayColorsUseCase(BuildContext context) => const DisplayColors();

class DisplayColors extends StatelessWidget {
  static const List<List<Color>> _colorList = [
    //Black
    [
      BegoColors.black100,
      BegoColors.black200,
      BegoColors.black300,
      BegoColors.black400,
      BegoColors.black500,
      BegoColors.black600,
      BegoColors.black700,
      BegoColors.black800,
      BegoColors.black900,
      BegoColors.black,
    ],
    //Blue Gray
    [
      BegoColors.blueGray50,
      BegoColors.blueGray100,
      BegoColors.blueGray200,
      BegoColors.blueGray300,
      BegoColors.blueGray400,
      BegoColors.blueGray500,
      BegoColors.blueGray600,
      BegoColors.blueGray700,
      BegoColors.blueGray800,
      BegoColors.blueGray900,
    ], //Gray
    [
      BegoColors.gray50,
      BegoColors.gray100,
      BegoColors.gray200,
      BegoColors.gray300,
      BegoColors.gray400,
      BegoColors.gray500,
      BegoColors.gray600,
      BegoColors.gray700,
      BegoColors.gray800,
      BegoColors.gray900,
    ], //Red
    [
      BegoColors.red50,
      BegoColors.red100,
      BegoColors.red200,
      BegoColors.red300,
      BegoColors.red400,
      BegoColors.red500,
      BegoColors.red600,
      BegoColors.red700,
      BegoColors.red800,
      BegoColors.red900,
    ], //Orange
    [
      BegoColors.orange50,
      BegoColors.orange100,
      BegoColors.orange200,
      BegoColors.orange300,
      BegoColors.orange400,
      BegoColors.orange500,
      BegoColors.orange600,
      BegoColors.orange700,
      BegoColors.orange800,
      BegoColors.orange900,
    ],
    //Amber
    [
      BegoColors.amber50,
      BegoColors.amber100,
      BegoColors.amber200,
      BegoColors.amber300,
      BegoColors.amber400,
      BegoColors.amber500,
      BegoColors.amber600,
      BegoColors.amber700,
      BegoColors.amber800,
      BegoColors.amber900,
    ]
    //Yello
    ,
    [
      BegoColors.yellow50,
      BegoColors.yellow100,
      BegoColors.yellow200,
      BegoColors.yellow300,
      BegoColors.yellow400,
      BegoColors.yellow500,
      BegoColors.yellow600,
      BegoColors.yellow700,
      BegoColors.yellow800,
      BegoColors.yellow900,
    ]

    //Lime
    ,
    [
      BegoColors.lime50,
      BegoColors.lime100,
      BegoColors.lime200,
      BegoColors.lime300,
      BegoColors.lime400,
      BegoColors.lime500,
      BegoColors.lime600,
      BegoColors.lime700,
      BegoColors.lime800,
      BegoColors.lime900,
    ]
    //Green
    ,
    [
      BegoColors.green50,
      BegoColors.green100,
      BegoColors.green200,
      BegoColors.green300,
      BegoColors.green400,
      BegoColors.green500,
      BegoColors.green600,
      BegoColors.green700,
      BegoColors.green800,
      BegoColors.green900,
    ]
    //Emerald
    ,
    [
      BegoColors.emerald50,
      BegoColors.emerald100,
      BegoColors.emerald200,
      BegoColors.emerald300,
      BegoColors.emerald400,
      BegoColors.emerald500,
      BegoColors.emerald600,
      BegoColors.emerald700,
      BegoColors.emerald800,
      BegoColors.emerald900,
    ]

    //Teal
    ,
    [
      BegoColors.teal50,
      BegoColors.teal100,
      BegoColors.teal200,
      BegoColors.teal300,
      BegoColors.teal400,
      BegoColors.teal500,
      BegoColors.teal600,
      BegoColors.teal700,
      BegoColors.teal800,
      BegoColors.teal900,
    ]
    //Cyan
    ,
    [
      BegoColors.cyan50,
      BegoColors.cyan100,
      BegoColors.cyan200,
      BegoColors.cyan300,
      BegoColors.cyan400,
      BegoColors.cyan500,
      BegoColors.cyan600,
      BegoColors.cyan700,
      BegoColors.cyan800,
      BegoColors.cyan900,
    ]
    //Light Blue
    ,
    [
      BegoColors.lightBlue50,
      BegoColors.lightBlue100,
      BegoColors.lightBlue200,
      BegoColors.lightBlue300,
      BegoColors.lightBlue400,
      BegoColors.lightBlue500,
      BegoColors.lightBlue600,
      BegoColors.lightBlue700,
      BegoColors.lightBlue800,
      BegoColors.lightBlue900,
    ]
    //Blue
    ,
    [
      BegoColors.blue50,
      BegoColors.blue100,
      BegoColors.blue200,
      BegoColors.blue300,
      BegoColors.blue400,
      BegoColors.blue500,
      BegoColors.blue600,
      BegoColors.blue700,
      BegoColors.blue800,
      BegoColors.blue900,
    ]
    //Indigo
    ,
    [
      BegoColors.indigo50,
      BegoColors.indigo100,
      BegoColors.indigo200,
      BegoColors.indigo300,
      BegoColors.indigo400,
      BegoColors.indigo500,
      BegoColors.indigo600,
      BegoColors.indigo700,
      BegoColors.indigo800,
      BegoColors.indigo900,
    ]

    //Voilet
    ,
    [
      BegoColors.voilet50,
      BegoColors.voilet100,
      BegoColors.voilet200,
      BegoColors.voilet300,
      BegoColors.voilet400,
      BegoColors.voilet500,
      BegoColors.voilet600,
      BegoColors.voilet700,
      BegoColors.voilet800,
      BegoColors.voilet900,
    ]

    //Purple
    ,
    [
      BegoColors.purple50,
      BegoColors.purple100,
      BegoColors.purple200,
      BegoColors.purple300,
      BegoColors.purple400,
      BegoColors.purple500,
      BegoColors.purple600,
      BegoColors.purple700,
      BegoColors.purple800,
      BegoColors.purple900,
    ]

    //Fuchsia
    ,
    [
      BegoColors.fuchsia50,
      BegoColors.fuchsia100,
      BegoColors.fuchsia200,
      BegoColors.fuchsia300,
      BegoColors.fuchsia400,
      BegoColors.fuchsia500,
      BegoColors.fuchsia600,
      BegoColors.fuchsia700,
      BegoColors.fuchsia800,
      BegoColors.fuchsia900,
    ]

    // Pink

    ,
    [
      BegoColors.pink50,
      BegoColors.pink100,
      BegoColors.pink200,
      BegoColors.pink300,
      BegoColors.pink400,
      BegoColors.pink500,
      BegoColors.pink600,
      BegoColors.pink700,
      BegoColors.pink800,
      BegoColors.pink900,
    ]
    // Rose
    ,
    [
      BegoColors.rose50,
      BegoColors.rose100,
      BegoColors.rose200,
      BegoColors.rose300,
      BegoColors.rose400,
      BegoColors.rose500,
      BegoColors.rose600,
      BegoColors.rose700,
      BegoColors.rose800,
      BegoColors.rose900,
    ]
  ];

  const DisplayColors({super.key});

  Widget _buildItem(_ColorsName colorName, List<Color> colors) => _ColorLayout(
        colorGroup: colorName,
        colors: colors,
      );

  @override
  Widget build(BuildContext context) => ListView(
        children: List.generate(
          _colorList.length,
          (i) => _buildItem(_ColorsName.values[i], _colorList[i]),
        ),
      );
}

class _ColorLayout extends StatelessWidget {
  const _ColorLayout({required this.colors, required this.colorGroup});
  final List<Color> colors;
  final _ColorsName colorGroup;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: SizedBox(
              width: 150,
              child: BeText.headlineSmall(
                colorGroup.colorName,
                maxLine: 1,
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 4),
              ),
            ),
          ),
          ...List.generate(
            colors.length,
            (index) => Expanded(
              child: SizedBox(
                height: 100,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors[index],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

enum _ColorsName {
  black('Black'),
  blueGray('Blue Gray'),
  gray('Gray'),
  red('Red'),
  orange('Orange'),
  amber('Amber'),
  yello('Yello'),
  lime('Lime'),
  green('Green'),
  emerald('Emerald'),
  teal('Teal'),
  cyan('Cyan'),
  lightBlue('Light Blue'),
  blue('Blue'),
  indigo('Indigo'),
  voilet('Voilet'),
  purple('Purple'),
  fuchsia('Fuchsia'),
  pink('Pink'),
  rose('Rose');

  const _ColorsName(this.colorName);
  final String colorName;
}
