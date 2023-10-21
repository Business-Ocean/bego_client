import 'package:flutter/material.dart';

class BaseDropdownTile extends StatelessWidget {
  const BaseDropdownTile({
    super.key,
    required this.title,
    this.subtitle,
    this.isSelected,
  });

  final Widget title;
  final Widget? subtitle;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    final tile = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title,
        if (subtitle case final subtitle?) subtitle,
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: isSelected != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Checkbox(
                    onChanged: (_) {},
                    value: isSelected,
                  ),
                ),
                Flexible(fit: FlexFit.loose, child: tile),
              ],
            )
          : tile,
    );
  }
}
