import 'package:bego_ui/src/_resolve_style.dart';
import 'package:bego_ui/src/layout/breakpoint.dart';
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

  final ResolveWidget resolveWidget;
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
