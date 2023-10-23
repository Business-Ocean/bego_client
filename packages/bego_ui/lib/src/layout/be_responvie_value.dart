import 'package:bego_ui/src/helper/context_extensions.dart';
import 'package:bego_ui/src/layout/be_breakpoint.dart';
import 'package:flutter/widgets.dart';

/// First value will be the default value
final class BeResponsiveValue<T> {
  BeResponsiveValue(this._values)
      : assert(_values.isEmpty, 'Cant be null or empty');
  final Map<BeBreakpoint, T> _values;

  T resolve(BuildContext context) {
    final value = switch (context.mediaQuery.screenBreakPoint) {
      BeBreakpoint.extraSmall => _values[BeBreakpoint.extraSmall],
      BeBreakpoint.small => _values[BeBreakpoint.small],
      BeBreakpoint.medium => _values[BeBreakpoint.medium],
      BeBreakpoint.large => _values[BeBreakpoint.large],
      BeBreakpoint.extraLarge => _values[BeBreakpoint.extraLarge],
    };
    return value ?? _values.values.first;
  }
}
