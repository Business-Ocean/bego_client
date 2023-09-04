import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'BeBadge', type: BeBadge)
Widget displayNotificationUseCase(BuildContext context) {
  return Scaffold(
    body: Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
            children: BeBadgePosition.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: BeBadge(
                      position: e,
                      rounded: true,
                      badge: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Colors.orange),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          child: Text("0"),
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                )
                .toList()),
      ),
    ),
  );
}
