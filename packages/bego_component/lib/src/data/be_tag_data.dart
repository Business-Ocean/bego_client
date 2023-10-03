import 'package:flutter/material.dart';

class BeTagData {
  BeTagData({
    required this.label,
    this.badgeText,
    this.leading,
    this.trailing,
    this.showIcon,
    this.selected,
  });

  String label;
  String? badgeText;
  Widget? leading;
  Widget? trailing;
  bool? showIcon;
  bool? selected;
}
