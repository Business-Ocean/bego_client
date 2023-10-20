import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

class BeSwitchTile extends StatefulWidget {
  const BeSwitchTile({
    super.key,
    required this.title,
    this.leading,
    this.description,
    this.enable,
    this.interim = false,
    this.onChange,
  });
  final bool? enable;
  final bool interim;
  final String title;
  final String? description;
  final Widget? leading;
  final ValueChanged<bool?>? onChange;

  @override
  State<BeSwitchTile> createState() => _BeSwitchTileState();
}

class _BeSwitchTileState extends State<BeSwitchTile> {
  bool? _enabled;

  @override
  void initState() {
    super.initState();
    if (!widget.interim) {
      _enabled = widget.enable ?? false;
    }
  }

  @override
  void didUpdateWidget(BeSwitchTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enable != widget.enable) {
      _enabled = widget.enable;
    }
  }

  @override
  Widget build(BuildContext context) => SwitchListTile(
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
        value: _enabled ?? false,
        onChanged: (v) {
          setState(() => _enabled = v);
          widget.onChange?.call(v);
        },
      );
}
