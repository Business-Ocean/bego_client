import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';
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
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: Colors.orange),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            child: Text("0"),
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
                        position: e,
                        // rounded: true,
                        label: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: Colors.orange),
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
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: BeMultiBadge(
          labels: BeMultiBadgePosition.values
              .map((e) => BeBadgeChild(
                  position: e,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.orange),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text("0"),
                    ),
                  )))
              .toList(),
          child: Container(color: Colors.pink, width: 400, height: 300)),
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
              .map((e) => BeLabelChild(
                  position: e,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: Colors.orange),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text("0"),
                    ),
                  )))
              .toList(),
          child: Container(color: Colors.pink, width: 400, height: 300)),
    ),
  );
}
