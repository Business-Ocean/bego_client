library;

import 'package:flutter/widgets.dart';

class BeInvertColors extends StatelessWidget {
  const BeInvertColors({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) => ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          -1, //RED
          0,
          0,
          0,
          255, //GREEN
          0,
          -1,
          0,
          0,
          255, //BLUE
          0,
          0,
          -1,
          0,
          255, //ALPHA
          0,
          0,
          0,
          1,
          0,
        ]),
        child: child,
      );
}
