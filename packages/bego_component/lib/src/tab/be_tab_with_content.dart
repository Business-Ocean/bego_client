/// Display configuration of BrnTabBar tab
class BeTabWithContent<T> {
  BeTabWithContent({
    required this.tabTitle,
    this.label,
    this.badgeText,
    this.showRedBadge = false,
    this.isAutoDismiss = true,
    this.data,
  });

  ///Tab text
  final String tabTitle;

  ///Text information at the top of the tab
  String? label;

  /// The text displayed by the red dot
  String? badgeText;

  /// Whether to display the little red dot. The default badgeNum is not set and is not displayed.
  bool showRedBadge;

  /// Whether the little red dot disappears automatically
  bool isAutoDismiss;

  T? data;
}
