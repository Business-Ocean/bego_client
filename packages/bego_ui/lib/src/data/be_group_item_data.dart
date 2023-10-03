import 'package:flutter/widgets.dart';

/// Card information
class BeGroupItemData {
  BeGroupItemData({
    required this.groupId,
    required this.groupName,
    this.desc = '',
    this.isExpand = false,
    this.navigatorPage,
    this.children,
  });

  /// Unique ID
  String groupId;

  /// Group name
  String groupName;

  /// describe
  String desc;

  /// Whether to expand
  bool isExpand;

  /// Child Widget
  List<BeGroupItemData>? children;

  /// Jump to the next page
  void Function(BuildContext context)? navigatorPage;
}
