import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class BeTinyLoader extends StatelessWidget {
  const BeTinyLoader({this.show = false, this.color, super.key});
  final bool show;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return show
        ? SizedBox.square(
            dimension: 20,
            child: CircularProgressIndicator(
              color: color,
              strokeWidth: 3,
              // backgroundColor: becolors(context).lightInverse,
            ),
          )
        : emptyWidget;
  }
}
