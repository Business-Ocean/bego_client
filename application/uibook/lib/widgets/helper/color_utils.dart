import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Color Utils', type: ColorUtils)
Widget colorUtils(BuildContext context) {
  return Scaffold(
    body: ColumnSuper(
      outerDistance: 24,
      innerDistance: 10,
      alignment: Alignment.center,
      children: [
        const MyHoverableWidget(),
        Container(
          color: ColorUtils.getRandomColor(),
          child: const Text('ColorUtils.getRandomColor()'),
        ),
        Container(
          color:
              ColorUtils.getMaterialColorFromColor(BegoColors.green).shade300,
          child: const Text(
              '  ColorUtils.getMaterialColorFromColor(BegoColors.green).shade300,'),
        ),
        Container(
          color: ColorUtils.solidOpacity(Colors.red, opacity: 0.5),
          child:
              const Text('ColorUtils.solidOpacity(Colors.red, opacity: 0.5)'),
        ),
        Container(
          color: ColorUtils.createMaterialColor(BegoColors.amber).shade800,
          child: const Text(
              ' ColorUtils.createMaterialColor(BegoColors.amber).shade800,'),
        ),
        Container(height: 18, width: double.infinity, color: BegoColors.blue),
        ...[0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9].map((e) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: ColorUtils.getShade(BegoColors.blue,
                        darker: false, value: e),
                    child: Text(
                        '  ColorUtils.getShade(BegoColors.blue, darker: false, value: $e)'),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                      color: ColorUtils.getShade(BegoColors.blue,
                          value: e, darker: true),
                      child: Text(
                          'ColorUtils.getShade(BegoColors.blue,value: $e, darker: true)')),
                ),
              ],
            )),
        Container(
          color: ColorUtils.getMaterialColorFromColor(Colors.orange),
          child:
              const Text('ColorUtils.getMaterialColorFromColor(Colors.orange)'),
        ),
        Container(
          color: Colors.pink,
          child: Text(
              "Text Color: ColorUtils.textColorFromBackground(Colors.pink))",
              style: TextStyle(
                  color: ColorUtils.textColorFromBackground(Colors.pink))),
        ),
        Container(
          color: BegoColors.pink200,
          child: Text(
              "Text Color:  ColorUtils.textColorFromBackground(BegoColors.pink200))",
              style: TextStyle(
                  color:
                      ColorUtils.textColorFromBackground(BegoColors.pink200))),
        ),
        Container(
          color: ColorUtils.getBrightness(BegoColors.red200) == Brightness.light
              ? BegoColors.amber100
              : BegoColors.amber700,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Flexible(
                flex: 1,
                child: Text(
                    " ColorUtils.getBrightness(BegoColors.red200) == Brightness.light? BegoColors.amber100: BegoColors.amber700,"),
              ),
              Text(ColorUtils.getBrightness(BegoColors.red200) ==
                      Brightness.light
                  ? "Light"
                  : "Dark"),
            ],
          ),
        ),
      ],
    ),
  );
}

class MyHoverableWidget extends StatefulWidget {
  const MyHoverableWidget({super.key});

  @override
  State<MyHoverableWidget> createState() => _MyHoverableWidgetState();
}

class _MyHoverableWidgetState extends State<MyHoverableWidget> {
  // Our state
  bool amIHovering = false;
  Offset exitFrom = const Offset(0, 0);

  // @override
  // Widget build(BuildContext context) {return Ink(
  //     decoration: BoxDecoration(
  //       color: MaterialStateProperty.resolveWith((states) {
  //         if (states.contains(MaterialState.pressed)) {
  //           return Colors.red; // Change color when pressed
  //         } else if (states.contains(MaterialState.hovered)) {
  //           return Colors.green; // Change color when hovered
  //         } else {
  //           return Colors.blue; // Default color
  //         }
  //       }),
  //     ),
  //     child: InkWell(
  //       onTap: () {
  //         // Handle tap action if needed
  //       },
  //       child: Container( height: 50,width: 50,
  //         width: 200,
  //         height: 100,
  //         alignment: Alignment.center,
  //         child: Text(
  //           MaterialStateProperty.resolveWith((states) {
  //             if (states.contains(MaterialState.pressed)) {
  //               return 'Pressed';
  //             } else if (states.contains(MaterialState.hovered)) {
  //               return 'Hovered';
  //             } else {
  //               return 'Not Hovered';
  //             }
  //           }),
  //           style: const TextStyle(color: Colors.white),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // final state = ColorUtils.getColor(
    //   <MaterialState>{
    //     MaterialState.hovered,
    //     MaterialState.pressed,
    //   },
    //   [
    //     BegoColors.red,
    //     BegoColors.blue,
    //   ],
    // );
    final colorState = [
      BegoColors.green,
      BegoColors.pink,
      BegoColors.orange,
      BegoColors.black,
      BegoColors.blue,
    ];
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(side: BorderSide.none),
        ),
        side: const WidgetStatePropertyAll(BorderSide.none),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => ColorUtils.getColor(
            states,
            colorState,
          ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => ColorUtils.getColor(
            states,
            colorState,
          ),
        ),
      ),
      child: const Text(
        "Button",
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
    // return MouseRegion(
    //   onEnter: (details) => setState(() => amIHovering = true),
    //   onExit: (details) => setState(() {
    //     amIHovering = false;
    //     exitFrom = details
    //         .localPosition; // You can use details.position if you are interested in the global position of your pointer.
    //   }),
    //   child: SizedBox(
    //     width: 200,
    //     height: 200,
    //     child: Center(
    //       child: Text(amIHovering
    //           ? "Look mom, I'm hovering"
    //           : "I exited from: $exitFrom"),
    //     ),
    //   ),
    // );
  }
}
