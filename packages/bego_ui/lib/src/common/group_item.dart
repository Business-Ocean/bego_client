import 'package:flutter/widgets.dart';

/// Used with grouped items such as `BeRadioGroup`, `BeCheckboxGroup`
/// and `BeSegmentedControl`.
class BeGroupItem<T> {
  const BeGroupItem({
    required this.label,
    required this.value,
  });

  final Widget label;
  final T value;
}
