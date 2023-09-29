import 'package:bego_ui/src/themes/be_edge_insets.dart';
import 'package:flutter/material.dart';

class BeInsetsMobile implements BeEdgeInsets {
  const BeInsetsMobile();

  @override
  EdgeInsets get gutter => const EdgeInsets.symmetric(horizontal: 16);

  @override
  EdgeInsets get textInset => EdgeInsets.zero;
}
