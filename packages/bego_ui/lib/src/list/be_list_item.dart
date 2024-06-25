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
    this.onPressed,
  });
  final T modal;
  final ValueChanged<T>? onPressed;

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
      onTap: onPressed == null ? null : () => onPressed?.call(modal),
      leading: leading,
      trailing: leading,
      dense: modal.enabled,
      horizontalTitleGap: 10,
      visualDensity: VisualDensity.compact,
      contentPadding: padding,
      // style: ListTileStyle.list,
      shape: RoundedRectangleBorder(borderRadius: bestyles(context).tileRadius),
      enabled: modal.enabled ?? true,
      hoverColor: becolors(context).accent.withAlpha(50),
      selected: modal.selected ?? false,
      title: Row(
        children: [
          Expanded(
            flex: 5,
            child: BeText(
              modal.title,
              textType: BeTextType.titleSmall,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(flex: 1),
          if (modal.captions != null || modal.captions!.isEmpty)
            ...modal.captions!
                .map(
                  (e) => Expanded(
                    flex: 2,
                    child: BeText(
                      e,
                      textType: BeTextType.titleSmall,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
                ,
        ],
      ),
      subtitle: BeText.bodySmall(
        modal.subtitle,
      ),
      // dense: true,

      // selected: true,
      // enabled: false,
    );
  }
}
