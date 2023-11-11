import 'package:bego_ui/src/common/no_splash_factory.dart';
import 'package:flutter/material.dart';

class BeCommon {
  BeCommon._();
}

const emptyWidget = SizedBox.shrink();

const ignoreSplash = NoSplashFactory();

//
const buttonAnimationDuration = Duration(milliseconds: 100);
const buttonAnimationCurve = Curves.fastOutSlowIn;

typedef ContentWrapperBuilder = Widget Function(
  BuildContext context,
  Widget child,
);
