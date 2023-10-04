/// Used for model compatible callbacks
/// Mainly used for various click events

typedef OnBrnFormSelectAll = void Function(int index, bool isSelect);

/// Mainly used for various input value changes
typedef OnBrnFormRadioValueChanged = void Function(
  String? oldStr,
  String? newStr,
);

/// Switch change callback
typedef OnBrnFormSwitchChanged = void Function(bool oldValue, bool newValue);

/// Callback for changes in the number of stars
typedef OnBrnFormValueChanged = void Function(int oldValue, int newValue);

/// Option selected status change callback
typedef OnBrnFormMultiChoiceValueChanged = void Function(
  List<String> oldValue,
  List<String> newValue,
);

/// For model compatible callback, the definition is equivalent to form_interface
/// Mainly used for various click events
typedef OnBrnFormTitleSelected = void Function(String title, int index);
