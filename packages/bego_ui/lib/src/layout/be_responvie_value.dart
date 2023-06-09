import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/src/layout/breakpoint.dart';
import 'package:flutter/widgets.dart';

/// First value will be the default value
final class BeResponsiveValue<T> {
  BeResponsiveValue(this._values)
      : assert(_values.isEmpty, 'Cant be null or empty');
  final Map<Breakpoint, T> _values;

  T resolve(BuildContext context) {
    final value = switch (context.mediaQuery.screenBreakPoint) {
      Breakpoint.extraSmall => _values[Breakpoint.extraSmall],
      Breakpoint.small => _values[Breakpoint.small],
      Breakpoint.medium => _values[Breakpoint.medium],
      Breakpoint.large => _values[Breakpoint.large],
      Breakpoint.extraLarge => _values[Breakpoint.extraLarge],
    };
    return value ?? _values.values.first;
  }
}
