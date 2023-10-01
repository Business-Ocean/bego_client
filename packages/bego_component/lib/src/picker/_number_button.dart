import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/widgets.dart';

class NumberPickerButton extends StatelessWidget {
  const NumberPickerButton({
    super.key,
    required this.iconData,
    this.onPressed,
  });

  final IconData iconData;
  final VoidCallback? onPressed;

  bool get _isEnabled => onPressed != null;

  @override
  Widget build(BuildContext context) => BeEnabled(
      isEnabled: _isEnabled,
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          iconData,
          color: becolors(context).accent,
          size: 24,
        ),
      ),
    );
}
