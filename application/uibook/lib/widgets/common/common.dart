import 'package:bego_ui/bego_responsive.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_ui_utils.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

// @widgetbook.UseCase(
//   name: 'Buttons',
//   type: BeText,
//   designLink:
//       'https://www.figma.com/file/FGjzyMrtehR5q1tMAgSPxn/Material-Me-v2?type=design&node-id=10295%3A260064&t=6VwryFXdXr7zhTBd-1',
// )

@widgetbook.UseCase(name: 'common widget cases', type: BeCommon)
Widget displayCommonWidgetCased(BuildContext context) {
  return const Common();
}

class Common extends StatelessWidget {
  const Common({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ColumnSuper(
      innerDistance: 16,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                child: const Text(
                  "Empty Const Widget (emptyWidget) : ",
                ),
              ),
            ),
            Text(
              ':',
              style: TextStyle(
                background: Paint()..color = Colors.red,
              ),
            ),
            emptyWidget
          ],
        ),
        Text(
          "Voluptate elit laborum veniam ut nisi deserunt adipisicing amet proident aute ut magna aliqua fugiat.",
          style: dynamicTextStyle(context.mediaQuery.screenBreakPoint),
        ),
        Container(
          color: BegoColors.amber,
          padding: dynamicInsets(context.mediaQuery.screenBreakPoint),
          child: Container(
            width: 100,
            height: 300,
            color: BegoColors.primary,
          ),
        ),
        DefaultTextStyle(
          style: const TextStyle(color: Colors.black),
          child: dynamicWidget(context.mediaQuery.screenBreakPoint),
        ),
        InkWell(
          onTap: () {},
          // splashFactory: const NoSplashFactory(),
          child: Container(
            padding: p32,
            child: const BeText("NoSplashFactory"),
          ),
        ),
        InkWell(
          onTap: () {},
          splashFactory: const NoSplashFactory(),
          child: Container(
            padding: p32,
            child: const BeText("NoSplashFactory"),
          ),
        ),
        //  OverlayController(),
        // OverlayController(
        //   focusNode: FocusNode(),
        //   items: const [],
        //   // onShown: () {},
        //   onItemSelected: (value) {},
        //   anchorKey: const GlobalObjectKey('value'),
        //   child: const Text("Hello"),
        // ),
        const Text("Be Enabled"),

        BeEnabled(
            isEnabled: true,
            child: ElevatedButton(
              child: const Text("Enable"),
              onPressed: () {},
            )),
        BeEnabled(
            isEnabled: false,
            child: ElevatedButton(
              child: const Text("Enable"),
              onPressed: () {},
            ))
      ],
    ));
  }
}

ResolveTextStyle dynamicTextStyle = (breakPoint) {
  switch (breakPoint) {
    case BeBreakpoint.extraSmall:
      return const TextStyle(fontSize: 18, color: Colors.red);
    case BeBreakpoint.small:
      return const TextStyle(fontSize: 22, color: BegoColors.blue800);
    case BeBreakpoint.medium:
      return const TextStyle(fontSize: 28, color: BegoColors.purple800);
    case BeBreakpoint.large:
      return const TextStyle(fontSize: 32, color: BegoColors.yellow);

    default:
      return const TextStyle(fontSize: 14, color: BegoColors.green);
  }
};

ResolveInsets dynamicInsets = (breakPoint) {
  switch (breakPoint) {
    case BeBreakpoint.extraSmall:
      return const EdgeInsets.all(4);
    case BeBreakpoint.small:
      return const EdgeInsets.all(8);
    case BeBreakpoint.medium:
      return const EdgeInsets.all(16);
    case BeBreakpoint.large:
      return const EdgeInsets.all(32);

    default:
      return const EdgeInsets.all(0);
  }
};

ResolveWidget dynamicWidget = (breakPoint) {
  switch (breakPoint) {
    case BeBreakpoint.extraSmall:
      return const Text('extraSmall');
    case BeBreakpoint.small:
      return const Text('small');
    case BeBreakpoint.medium:
      return const Text('medium');
    case BeBreakpoint.large:
      return const Text('large');
    case BeBreakpoint.extraLarge:
      return const Text('extraLarge');
  }
};
