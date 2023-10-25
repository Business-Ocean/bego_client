import 'package:bego_ui/src/form/input/be_text_input_field.dart';
import 'package:bego_ui/src/icon/be_icons.dart';
import 'package:flutter/material.dart';

/// An embedded search that is designed to be used inside the dropdown menu.
/// Is styled to be in line with the default dropdown list items. Will call for
/// the focus on display.
class BeDropdownEmbeddedSearch extends StatefulWidget {
  const BeDropdownEmbeddedSearch({
    super.key,
    this.placeholder,
    this.onTextChanged,
    this.initialValue = '',
    this.isClearEnabled = true,
  });

  /// The initial value of the search when the dropdown becomes visible.
  final String initialValue;

  /// The callback to be called when the search value changes.
  final ValueSetter<String>? onTextChanged;

  /// The placeholder of the input field.
  final String? placeholder;

  final bool isClearEnabled;

  @override
  State<BeDropdownEmbeddedSearch> createState() =>
      _BeDropdownEmbeddedSearchState();
}

class _BeDropdownEmbeddedSearchState extends State<BeDropdownEmbeddedSearch> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.onTextChanged?.call(widget.initialValue),
    );
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BeTextInputField(
        controller: _controller,
        onChanged: widget.onTextChanged,
        focusNode: _focusNode,
        placeholder: widget.placeholder,
        // contentPadding: const EdgeInsets.all(8),
        leading: const Icon(BeIcons.icon_search_1),
        isClearEnabled: widget.isClearEnabled,
        hasBorders: false,
      );
}
