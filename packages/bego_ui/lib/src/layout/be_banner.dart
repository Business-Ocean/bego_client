import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

/// Contextual banners display a notification relevant to a specific
/// part of the system.
///
/// They appear at the top of the page or section they apply to, but always
/// below the page header or navigation. They don't cover content, but push it
/// down.
///
/// At its most basic, the component is comprised of a background
/// layer (colored according to the meaning of the message) and text;
/// other elements (left icon, description, link, close icon) are optional.
///
/// A banner always takes the full width of the component it is within.
class OptimusBanner extends StatelessWidget {
  const OptimusBanner({
    super.key,
    required this.title,
    this.description,
    this.actions,
    this.hasIcon = false,
    this.hasBorder = false,
    this.isDismissible = false,
    this.onDismiss,
    this.type = BeStyleVariant.success,
  });

  /// The title of the banner.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Variant of the banner which determines background color and icon
  /// (if [hasIcon] == true).

  /// If `true` the icon will be displayed. Which icon is used depends on
  final bool hasIcon;
  final bool hasBorder;

  /// Banner's description rendered as a second line.
  ///
  /// Typically a [Text] widget.
  final Widget? description;
  final List<Widget>? actions;
  final BeStyleVariant type;

  /// If `true` close button will be rendered as well.
  ///
  /// It's your responsibility to process the button press with
  /// [onDismiss] callback parameter.
  final bool isDismissible;

  /// Called when close button is pressed (if [isDismissible] == true).
  final VoidCallback? onDismiss;

  // Color _getDescriptionColor(OptimusThemeData theme) =>
  // theme.isDark ? theme.colors.neutral0 : theme.colors.neutral1000t64;
  @override
  Widget build(BuildContext context) {
    final borderColor =
        type == BeStyleVariant.none ? becolors(context).disabled : type.color;
    final border = Border(
      left: BorderSide(color: borderColor, width: 4),
      bottom: BorderSide(color: borderColor, width: 0.5),
      top: BorderSide(color: borderColor, width: 0.5),
      right: BorderSide(color: borderColor, width: 0.5),
    );
    return DecoratedBox(
      decoration: BoxDecoration(
        color: type != BeStyleVariant.none
            ? type.color.withOpacity(.10)
            : BegoColors.transparent,
        border: hasBorder ? border : null,
        borderRadius: bestyles(context).borderRadius,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: description != null
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                if (hasIcon && type != BeStyleVariant.none)
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: type.color,
                      shape: BoxShape.circle,
                      border: const Border(
                        left: BorderSide(color: Colors.white, width: 1),
                        bottom: BorderSide(color: Colors.white, width: 1),
                        top: BorderSide(color: Colors.white, width: 1),
                        right: BorderSide(color: Colors.white, width: 1),
                      ),
                    ),
                    child: Icon(
                      type.iconData,
                      color: becolors(context).lightInverse,
                      size: 24,
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: isDismissible
                            ? const EdgeInsets.only(right: 24)
                            : EdgeInsets.zero,
                        child: title,
                      ),
                      if (description case final description?)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: description,
                        ),
                      if (actions case final actions?)
                        OverflowBar(
                          alignment: MainAxisAlignment.end,
                          overflowAlignment: OverflowBarAlignment.center,
                          overflowSpacing: 16,
                          spacing: 16,
                          children: actions,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isDismissible)
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: onDismiss,
                icon: Icon(Icons.cancel, color: becolors(context).darkInverse),
              ),
            ),
        ],
      ),
    );
  }
}
