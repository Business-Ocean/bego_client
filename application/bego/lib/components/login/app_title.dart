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
        mainAxisSize: MainAxisSize.min,
        children: [
          BeText(
            'BEGO',
            padding: EdgeInsets.zero,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 76,
              height: 1,
            ),
          ),
          BeText(
            'Discover Nearby Seamlessly',
            padding: EdgeInsets.only(left: 4),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.55,
              fontSize: 14,
              // height: 0.01,
            ),
          ),
        ],
      );
}
