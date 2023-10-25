import 'package:flutter/material.dart';

const buttonAnimationDuration = Duration(milliseconds: 100);
const buttonAnimationCurve = Curves.fastOutSlowIn;

typedef ContentWrapperBuilder = Widget Function(
  BuildContext context,
  Widget child,
);
