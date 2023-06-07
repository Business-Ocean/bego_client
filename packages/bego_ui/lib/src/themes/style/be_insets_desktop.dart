import 'package:bego_ui/src/themes/be_edge_insets.dart';
import 'package:flutter/material.dart';

class BeInsetsDesktop implements BeEdgeInsets {
  const BeInsetsDesktop();

  @override
  EdgeInsets get gutter => const EdgeInsets.symmetric(horizontal: 32);
}
