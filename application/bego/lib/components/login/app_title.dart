import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BeText(
            'BEGO',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 80,
              shadows: BegoShadows.boxShadow1,
            ),
          ),
          BeText(
            'Discover Nearby Seamlessly',
            padding: EdgeInsets.only(left: 6),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 0.1,
            ),
          ),
        ],
      );
}
