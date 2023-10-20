import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

class BeOuterShadowed extends PhysicalModel {
  const BeOuterShadowed({
    super.key,
    super.shape,
    super.clipBehavior,
    super.borderRadius = const BorderRadius.all(Radius.circular(4)),
    super.elevation = 4.0,
    super.color = BegoColors.transparent,
    super.shadowColor = BegoColors.blueGray,
    super.child,
  });
}
