import 'package:bego_ui/bego_ui.dart';
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
  Widget build(BuildContext context) {
    return BeEnabled(
      isEnabled: _isEnabled,
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          iconData,
          color: betheme(context).isDark
              ? becolors(context).primary
              : becolors(context).primary.withAlpha(100),
          size: 24,
        ),
      ),
    );
  }
}
