import 'package:bego_ui/src/common/resolve_style.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:bego_ui/src/themes/be_theme.dart';
import 'package:flutter/widgets.dart';

class BeWidgetResponsive extends StatelessWidget {
  const BeWidgetResponsive({
    super.key,
    required this.resolveWidget,
    this.color,
    required this.child,
    this.maxLines,
    this.align,
  });

  final ResolveThemeWidget resolveWidget;
  final Widget child;
  final Color? color;
  final int? maxLines;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).screenBreakPoint;
    final theme = BeTheme.of(context);
    //TO-DO(sourav pandit): change inset data;
    return resolveWidget(screenSize, theme);
  }
}
