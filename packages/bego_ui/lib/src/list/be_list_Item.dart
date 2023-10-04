import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/data/be_item_list.dart';
import 'package:flutter/material.dart';

class BeListItem<T extends BeListItemModal> extends StatelessWidget {
  const BeListItem({
    super.key,
    required this.modal,
    this.borderRadius,
    this.padding,
  });
  final T modal;

  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final leading = modal.leading != null
        ? ClipRRect(
            borderRadius: borderRadius ?? bestyles(context).tileRadius,
            child: modal.leading,
          )
        : null;
    //
    return ListTile(
      onTap: () {},
      leading: leading,
      trailing: leading,
      title: Row(
        children: [
          Expanded(
            flex: 4,
            child: BeText(
              modal.title,
              textType: BeTextType.titleSmall,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ...ifTrueWidgets(
            modal.captions != null,
            modal.captions!
                .map(
                  (e) => Expanded(
                    flex: 1,
                    child: BeText(
                      e,
                      textType: BeTextType.titleSmall,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      subtitle: BeText.bodySmall(
        modal.subtitle,
      ),
      // dense: true,
      horizontalTitleGap: 10,
      visualDensity: VisualDensity.compact,
      contentPadding: padding,
      // style: ListTileStyle.list,
      shape: RoundedRectangleBorder(borderRadius: bestyles(context).tileRadius),

      hoverColor: becolors(context).accent.withAlpha(50),
      // selected: true,
      // enabled: false,
    );
  }
}
