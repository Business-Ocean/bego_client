import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/decorations/be_icon_outline_border.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

class BeCheckTile extends StatefulWidget {
  const BeCheckTile({
    super.key,
    required this.title,
    this.leading,
    this.description,
    this.checked,
    this.interim = false,
    this.onChange,
  });
  final bool? checked;
  final bool interim;
  final String title;
  final String? description;
  final Widget? leading;
  final ValueChanged<bool?>? onChange;

  @override
  State<BeCheckTile> createState() => _BeCheckTileState();
}

class _BeCheckTileState extends State<BeCheckTile> {
  bool? _checked;

  @override
  void initState() {
    super.initState();
    if (!widget.interim) {
      _checked = widget.checked ?? false;
    }
  }

  @override
  void didUpdateWidget(BeCheckTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.checked != widget.checked) {
      _checked = widget.checked;
    }
  }

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        secondary: widget.leading,
        isThreeLine: false,
        title: BeText.titleMedium(
          widget.title,
          color: BegoColors.slate900,
        ),
        subtitle: widget.description != null
            ? BeText.bodySmall(
                widget.description,
                color: BegoColors.slate600,
              )
            : null,
        value: _checked ?? false,
        checkboxShape: _checked == null
            ? const BeIconOutlinedBorder(
                iconData: Icons.indeterminate_check_box_rounded,
                roundRadius: 4,
              )
            : null,
        onChanged: widget.onChange == null
            ? null
            : (v) {
                setState(() => _checked = v);
                widget.onChange?.call(v);
              },
      );
}
