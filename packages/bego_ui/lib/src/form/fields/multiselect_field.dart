import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

/// Field to display several selected values.
class MultiSelectInputField extends StatefulWidget {
  const MultiSelectInputField({
    super.key,
    this.isEnabled = true,
    this.focusNode,
    this.label,
    this.caption,
    this.captionIcon = Icons.closed_caption,
    this.helperMessage,
    this.error,
    this.errorVariant = BeInputErrorVariant.bottomHint,
    this.isRequired = false,
    this.isFocused,
    this.suffix,
    this.prefix,
    this.leading,
    this.trailing,
    this.fieldBoxKey,
    this.showLoader = false,
    required this.values,
  });

  final bool isEnabled;
  final FocusNode? focusNode;
  final String? label;
  final Widget? caption;
  final IconData? captionIcon;
  final Widget? helperMessage;
  final String? error;
  final BeInputErrorVariant errorVariant;
  final bool? isFocused;
  final bool isRequired;
  final Widget? leading;
  final Widget? prefix;
  final Key? fieldBoxKey;
  final Widget? suffix;
  final Widget? trailing;
  final bool showLoader;
  final List<Widget> values;

  bool get hasError {
    final error = this.error;

    return error != null && error.isNotEmpty;
  }

  @override
  State<MultiSelectInputField> createState() => _BeMultiSelectInputFieldState();
}

class _BeMultiSelectInputFieldState extends State<MultiSelectInputField> {
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleStateUpdate);
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleStateUpdate);
    _focusNode?.dispose();
    super.dispose();
  }

  bool get _isUsingInlineError =>
      widget.errorVariant == BeInputErrorVariant.inlineTooltip;

  void _handleStateUpdate() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final error = widget.error;
    final inlineError = _isUsingInlineError && error != null && error.isNotEmpty
        ? InlineErrorTooltip(error: error)
        : null;
    final suffix = widget.suffix != null ||
            widget.trailing != null ||
            widget.showLoader ||
            inlineError != null
        ? Suffix(
            suffix: widget.suffix,
            trailing: widget.trailing,
            showLoader: widget.showLoader,
            inlineError: inlineError,
          )
        : null;
    final prefix = widget.leading != null || widget.prefix != null
        ? Prefix(prefix: widget.prefix, leading: widget.leading)
        : null;

    return IgnorePointer(
      ignoring: !widget.isEnabled,
      child: GestureDetector(
        onTap: _effectiveFocusNode.requestFocus,
        child: FormFieldWrapper(
          focusNode: _effectiveFocusNode,
          isFocused: widget.isFocused,
          isEnabled: widget.isEnabled,
          label: widget.label,
          caption: widget.caption,
          captionIcon: widget.captionIcon,
          helperMessage: widget.helperMessage,
          error: widget.error,
          errorVariant: widget.errorVariant,
          isRequired: widget.isRequired,
          prefix: prefix,
          suffix: suffix,
          fieldBoxKey: widget.fieldBoxKey,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Focus(
                  focusNode: _effectiveFocusNode,
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 48),
                    width: double.infinity,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      spacing: 4,
                      runSpacing: 4,
                      clipBehavior: Clip.antiAlias,
                      children: widget.values,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
