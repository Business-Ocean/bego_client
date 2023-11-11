import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeBadge', type: BeBadge)
Widget displayBeBadgeUseCase(BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
          width: infinityWidth,
          child: Column(
              children: BeBadgePosition.values
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 48),
                      child: BeBadge(
                        position: e,
                        rounded: true,
                        badge: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              color: ColorUtils.getRandomColor()),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Text(e.name),
                          ),
                        ),
                        child: Container(
                          // margin: p42,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.blue,
                          ),
                          // width: 100,
                          // height: 100,
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'BeLabel', type: BeLabel)
Widget displayBeLabelUseCase(BuildContext context) {
  final inner =
      context.knobs.boolean(label: "Inner Label", initialValue: false);
  final fullWidth =
      context.knobs.boolean(label: "Label Full Width", initialValue: false);

  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
          width: infinityWidth,
          child: Column(
              children: BeLabelPosition.values
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 48),
                      child: BeLabel(
                        childSized: fullWidth,

                        innerLabel: inner,
                        position: e,
                        // rounded: true,
                        label: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.orange),
                          child: const SizedBox(
                            width: 20,
                            height: 20,
                          ),
                        ),
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Colors.blue,
                          ),
                          // width: 100,
                          // height: 100,
                        ),
                      ),
                    ),
                  )
                  .toList()),
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'BeMultiBadge', type: BeMultiBadge)
Widget displayBeMultiBadgeUseCase(BuildContext context) {
  final rounded = context.knobs.boolean(label: "Rounded", initialValue: false);

  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: BeMultiBadge(
          rounded: rounded,
          labels: BeMultiBadgePosition.values
              .map(
                (e) => BeBadgeChild(
                  position: e,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        color: ColorUtils.getRandomColor()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text(e.name),
                    ),
                  ),
                ),
              )
              .toList(),
          child: Container(
              color: Colors.black.withAlpha(50), width: 400, height: 300)),
    ),
  );
}

@widgetbook.UseCase(name: 'BeMultiLabel', type: BeMultiLabel)
Widget displayBeMultiLabelUseCase(BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: BeMultiLabel(
          labels: BeMultiLabelPosition.values
              .map(
                (e) => BeLabelChild(
                  position: e,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        color: ColorUtils.getRandomColor()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Text(e.name),
                    ),
                  ),
                ),
              )
              .toList(),
          child: Container(color: Colors.pink, width: 400, height: 300)),
    ),
  );
}
