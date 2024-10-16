// ignore_for_file: comment_references

import 'package:bego_core/bego_dfunc.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/form/dropdown/dropdown.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_select.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tile.dart';
import 'package:bego_ui/src/form/dropdown/embedded_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef ValueBuilder<T> = String Function(T value);

/// Select allows users to enter or select one or multiple options from
/// the list of available options.
///
/// The list opens as a dropdown menu, and it is available in many variations.
/// This select component is most commonly found in form patterns.
class BeSelectInput<T> extends StatefulWidget {
  const BeSelectInput({
    required this.items,
    required this.builder,
    required this.onChanged,
    super.key,
    this.label,
    this.placeholder = '',
    this.value,
    this.isEnabled = true,
    this.isRequired = false,
    this.leading,
    this.prefix,
    this.trailing,
    this.suffix,
    this.caption,
    this.secondaryCaption,
    this.error,
    this.controller,
    this.onTextChanged,
    this.focusNode,
    this.readOnly,
    this.showLoader = false,
    this.emptyResultPlaceholder,
    this.embeddedSearch,
    this.groupBy,
    this.groupBuilder,
    this.multiselect = false,
    this.selectedValues,
  });

  /// Describes the purpose of the select field.
  ///
  /// The input should always include this description (with exceptions).
  final String? label;
  final String placeholder;
  final T? value;
  final List<BeDropdownTile<T>> items;
  final bool isEnabled;
  final bool isRequired;
  final Widget? leading;
  final Widget? prefix;
  final Widget? trailing;
  final Widget? suffix;
  final bool showLoader;
  final FocusNode? focusNode;

  /// Serves as a helper text for informative or descriptive purposes.
  final Widget? caption;
  final Widget? secondaryCaption;
  final String? error;
  final ValueBuilder<T> builder;
  final ValueSetter<T> onChanged;
  final TextEditingController? controller;
  final ValueSetter<String>? onTextChanged;
  final bool? readOnly;

  /// An embedded search field that can be used to filter the list of items.
  /// Will be displayed as a part of the dropdown menu. If the [controller] or
  /// [onTextChanged] is provided, the embedded search will not be used. Instead
  /// the search will be a part of the input field.
  final BeDropdownEmbeddedSearch? embeddedSearch;

  /// A widget that is displayed when the list of items is empty. If not
  /// provided the dropdown will not be displayed.
  final Widget? emptyResultPlaceholder;

  /// {@template bego.select.groupBy}
  /// A function that would retrieve value for the grouping.
  /// {@endtemplate}
  final Grouper<T>? groupBy;

  /// {@template bego.select.groupBuilder}
  /// A builder that would create a group header. If not provided the
  /// [BeDropdownGroupSeparator] widget will be used.
  /// {@endtemplate}
  final GroupBuilder? groupBuilder;

  /// If enabled, you can select multiple items at the same time.
  /// State of the selected items is managed outside this widget and has to be
  /// set in [selectedValues].
  final bool multiselect;

  /// List of selected values. Would be omitted if the multiselect is disabled.
  final List<T>? selectedValues;

  @override
  State<BeSelectInput<T>> createState() => _BeSelectInput<T>();
}

class _BeSelectInput<T> extends State<BeSelectInput<T>>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0, end: 0.5);

  late final AnimationController _animationController;
  late final Animation<double> _iconTurns;

  TextEditingController? _controller;
  FocusNode? _focusNode;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  TextEditingController get _effectiveController =>
      widget.controller ?? (_controller ??= TextEditingController());

  void _handleFocusChange() {
    if (!_isUsingEmbeddedSearch) {
      if (_effectiveFocusNode.hasFocus) {
        _animationController.forward();
      } else {
        setState(() => _effectiveController.text = '');
        _animationController.reverse();
      }
    }
  }

  void _handleTextUpdate() =>
      widget.onTextChanged?.call(_effectiveController.text);

  @override
  void didUpdateWidget(BeSelectInput<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      _effectiveController
        ..removeListener(_handleTextUpdate)
        ..addListener(_handleTextUpdate);
    }
  }

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_handleFocusChange);
    _effectiveController.addListener(_handleTextUpdate);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 350),
      vsync: this,
    );
    _iconTurns = _animationController.drive(_halfTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_handleFocusChange);
    _focusNode?.dispose();
    _effectiveController.removeListener(_handleTextUpdate);
    _controller?.dispose();
    _animationController.dispose();
    super.dispose();
  }

  bool get _isUsingInlineSearch =>
      widget.controller != null || widget.onTextChanged != null;

  bool get _isUsingEmbeddedSearch =>
      widget.embeddedSearch != null && !_isUsingInlineSearch;

  Color get _textColor => _value == null ? becolors.hint : _defaultTextColor;

  // Color get _placeholderColor =>
  // theme.isDark ? theme.colors.neutral0t64 : theme.colors.neutral1000t64;

  Color get _defaultTextColor => becolors.text;

  T? get _value => widget.multiselect ? null : widget.value;

  @override
  Widget build(BuildContext context) => DropdownSelect<T>(
        label: widget.label,
        placeholder: _value?.let(widget.builder) ?? widget.placeholder,
        items: widget.items,
        isEnabled: widget.isEnabled,
        isRequired: widget.isRequired,
        caption: widget.caption,
        helperMessage: widget.secondaryCaption,
        error: widget.error,
        onChanged: widget.onChanged,
        prefix: widget.prefix,
        leading: widget.leading,
        suffix: widget.suffix,
        trailing: widget.trailing,
        trailingImplicit:
            RotationTransition(turns: _iconTurns, child: const _Chevron()),
        focusNode: _effectiveFocusNode,
        placeholderStyle: bestyles.bodyMedium.copyWith(color: _textColor),
        // rootOverlay: true,
        controller: _effectiveController,
        readOnly: widget.readOnly ?? !_isUsingInlineSearch,
        showCursor: _isUsingInlineSearch,
        showLoader: widget.showLoader,
        shouldCloseOnInputTap: !widget.multiselect || !_isUsingInlineSearch,
        emptyResultPlaceholder: widget.emptyResultPlaceholder,
        embeddedSearch: _isUsingEmbeddedSearch ? widget.embeddedSearch : null,
        onDropdownShow:
            _isUsingEmbeddedSearch ? _animationController.forward : null,
        onDropdownHide:
            _isUsingEmbeddedSearch ? _animationController.reverse : null,
        groupBy: widget.groupBy,
        groupBuilder: widget.groupBuilder,
        multiselect: widget.multiselect,
        selectedValues: widget.selectedValues,
        builder: widget.builder,
      );
}

class _Chevron extends StatelessWidget {
  const _Chevron();

  @override
  Widget build(BuildContext context) => Icon(
        BeIcons.icon_chevron_down,
        size: 24,
        color: becolors(context).text,
      );
}
