import 'package:bego_core/bego_dfunc.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:bego_ui/src/chip/chip.dart';
import 'package:bego_ui/src/form/dropdown/dropdown.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tap_interceptor.dart';
import 'package:bego_ui/src/form/fields/multiselect_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DropdownSelect<T> extends StatefulWidget {
  const DropdownSelect({
    super.key,
    this.label,
    this.placeholder = '',
    this.placeholderStyle,
    this.controller,
    this.onTextChanged,
    required this.items,
    this.isUpdating = false,
    this.isEnabled = true,
    this.isRequired = false,
    required this.onChanged,
    this.leading,
    this.trailing,
    this.trailingImplicit,
    this.caption,
    this.helperMessage,
    this.error,
    this.readOnly = false,
    this.showCursor,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.shouldCloseOnInputTap = false,
    this.showLoader = false,
    this.isClearEnabled = false,
    this.rootOverlay = false,
    this.emptyResultPlaceholder,
    this.embeddedSearch,
    this.onDropdownShow,
    this.onDropdownHide,
    this.groupBy,
    this.groupBuilder,
    this.multiselect = false,
    this.selectedValues,
    this.builder,
  });

  final String? label;
  final String placeholder;
  final TextStyle? placeholderStyle;
  final TextEditingController? controller;
  final ValueSetter<String>? onTextChanged;
  final List<BeDropdownTile<T>> items;
  final bool isUpdating;
  final bool isEnabled;
  final bool isRequired;
  final ValueSetter<T> onChanged;
  final Widget? caption;
  final Widget? helperMessage;
  final String? error;
  final Widget? leading;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? trailing;
  final Widget? trailingImplicit;
  final bool showLoader;
  final bool isClearEnabled;
  final FocusNode? focusNode;
  final bool shouldCloseOnInputTap;
  final bool rootOverlay;
  final BeDropdownEmbeddedSearch? embeddedSearch;
  final Widget? emptyResultPlaceholder;
  final VoidCallback? onDropdownShow;
  final VoidCallback? onDropdownHide;
  final Grouper<T>? groupBy;
  final GroupBuilder? groupBuilder;

  /// {@macro flutter.widgets.editableText.showCursor}
  final bool? showCursor;

  /// {@macro flutter.widgets.editableText.readOnly}
  final bool readOnly;

  final bool multiselect;
  final List<T>? selectedValues;
  final ValueBuilder<T>? builder;

  @override
  State<DropdownSelect<T>> createState() => _DropdownSelectState<T>();
}

class _DropdownSelectState<T> extends State<DropdownSelect<T>> {
  final _fieldBoxKey = GlobalKey();

  FocusNode? _focusNode;
  TextEditingController? _controller;

  FocusNode get _effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  TextEditingController get _effectiveController =>
      widget.controller ?? (_controller ??= TextEditingController());

  // ignore: dispose-fields, disposed in _removeOverlay
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (widget.embeddedSearch == null && _effectiveFocusNode.hasFocus) {
      _showOverlay();
    }
  }

  @override
  void dispose() {
    _effectiveFocusNode.removeListener(_onFocusChanged);
    _focusNode?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(DropdownSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.focusNode != widget.focusNode) {
      _effectiveFocusNode
        ..removeListener(_onFocusChanged)
        ..addListener(_onFocusChanged);
    }

    if (oldWidget.isEnabled != widget.isEnabled) {
      _overlayEntry?.remove();
      _overlayEntry?.dispose();
      _overlayEntry = null;
      _effectiveFocusNode.unfocus();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _overlayEntry?.markNeedsBuild();
    });
  }

  bool _handleOnBackPressed() {
    if (_effectiveFocusNode.hasFocus) {
      _effectiveFocusNode.unfocus();

      return false;
    } else if (widget.embeddedSearch != null) {
      final overlay = _overlayEntry;
      if (overlay != null) {
        _removeOverlay();

        return false;
      }
    }

    return true;
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlayEntry().also((it) {
      Overlay.of(context, rootOverlay: widget.rootOverlay).insert(it);
      widget.onDropdownShow?.call();
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    widget.onDropdownHide?.call();
    _effectiveFocusNode.unfocus();
    setState(() {});
  }

  VoidCallback? get _onTap =>
      widget.embeddedSearch != null ? _showOverlay : null;

  void _onClearAllTap() {
    _effectiveController.clear();
    widget.onTextChanged?.call('');
  }

  void _handleChipTap() {
    if (_effectiveFocusNode.hasFocus) {
      _removeOverlay();
    } else {
      _effectiveFocusNode.requestFocus();
    }
  }

  List<Widget>? get _values {
    if (widget.builder case final builder?) {
      return widget.selectedValues
          ?.map(
            (e) => BeChip(
              onRemoved: () => widget.onChanged(e),
              onTap: _handleChipTap,
              isEnabled: widget.isEnabled,
              child: Text(builder(e)),
            ),
          )
          .toList();
    }
  }

  bool? get _isFocused =>
      widget.embeddedSearch != null ? _overlayEntry != null : null;

  bool get _isClearAllButtonVisible =>
      widget.isClearEnabled && _effectiveController.text.isNotEmpty;

  bool get _hasValues {
    if (widget.selectedValues case final values?) {
      return values.isNotEmpty;
    }

    return false;
  }

  OverlayEntry _createOverlayEntry() => OverlayEntry(
        builder: (context) {
          void onTapDown(TapDownDetails details) {
            bool hitTest(RenderBox box) => box.hitTest(
                  BoxHitTestResult(),
                  position: box.globalToLocal(details.globalPosition),
                );

            final inputFieldRenderObject =
                _fieldBoxKey.currentContext?.findRenderObject();
            final dropdownRenderObject = context.findRenderObject();
            if (dropdownRenderObject is RenderBox &&
                hitTest(dropdownRenderObject)) {
              // Touch on dropdown shouldn't close overlay
            } else if (inputFieldRenderObject is RenderBox &&
                hitTest(inputFieldRenderObject)) {
              if (widget.shouldCloseOnInputTap) _removeOverlay();
            } else {
              _removeOverlay();
            }
          }

          return GestureDetector(
            key: const Key('BeDropdownOverlay'),
            behavior: HitTestBehavior.translucent,
            onTapDown: onTapDown,
            child: DropdownTapInterceptor(
              onTap: widget.multiselect ? () {} : _removeOverlay,
              child: BeDropdown(
                items: widget.items,
                anchorKey: _fieldBoxKey,
                onChanged: widget.onChanged,
                embeddedSearch: widget.embeddedSearch,
                emptyResultPlaceholder: widget.emptyResultPlaceholder,
                groupBy: widget.groupBy,
                groupBuilder: widget.groupBuilder,
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    final clearAll = _isClearAllButtonVisible
        ? _ClearAllButton(onTap: _onClearAllTap)
        : null;
    final trailing = clearAll == null &&
            widget.trailing == null &&
            widget.trailingImplicit == null
        ? null
        : _Trailing(
            focusNode: _effectiveFocusNode,
            clearAllButton: clearAll,
            trailing: widget.trailing,
            trailingImplicit: widget.trailingImplicit,
            isUpdating: widget.isUpdating,
          );

    return PopScope(
      canPop: _handleOnBackPressed(),
      child: widget.multiselect && _hasValues
          ? MultiSelectInputField(
              values: _values ?? [],
              leading: widget.leading,
              prefix: widget.prefix,
              isRequired: widget.isRequired,
              label: widget.label,
              focusNode: _effectiveFocusNode,
              isFocused: _isFocused,
              fieldBoxKey: _fieldBoxKey,
              suffix: widget.suffix,
              trailing: trailing,
              isEnabled: widget.isEnabled,
              caption: widget.caption,
              helperMessage: widget.helperMessage,
              error: widget.error,
              showLoader: widget.showLoader,
            )
          : BeTextInputField(
              leading: widget.leading,
              prefix: widget.prefix,
              controller: _effectiveController,
              onChanged: widget.onTextChanged,
              isRequired: widget.isRequired,
              label: widget.label,
              placeholder: widget.placeholder,
              placeholderStyle: widget.placeholderStyle,
              focusNode: _effectiveFocusNode,
              isFocused: _isFocused,
              onTap: _onTap,
              fieldBoxKey: _fieldBoxKey,
              suffix: widget.suffix,
              trailing: trailing,
              isEnabled: widget.isEnabled,
              caption: widget.caption,
              helperMessage: widget.helperMessage,
              error: widget.error,
              readOnly: widget.readOnly,
              showCursor: widget.showCursor,
              showLoader: widget.showLoader,
            ),
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing({
    required this.focusNode,
    this.clearAllButton,
    this.trailing,
    this.trailingImplicit,
    required this.isUpdating,
  });

  final FocusNode focusNode;
  final Widget? clearAllButton;
  final Widget? trailing;
  final Widget? trailingImplicit;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    final trailing = this.trailing;
    final trailingImplicit = this.trailingImplicit;
    final clearAllButton = this.clearAllButton;

    return GestureDetector(
      onTapDown: (_) => focusNode.requestFocus(),
      child: BeStack(
        direction: Axis.horizontal,
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (clearAllButton != null) clearAllButton,
          if (isUpdating)
            const BeLoading(
              dimension: 18,
              color: BegoColors.blue,
              // size: BeCircleLoaderSize.small,
              // variant: BeCircleLoaderVariant.indeterminate(),
            ),
          if (trailing != null && !isUpdating) trailing,
          if (trailingImplicit != null && !isUpdating) trailingImplicit,
        ],
      ),
    );
  }
}

class _ClearAllButton extends StatelessWidget {
  const _ClearAllButton({required this.onTap});

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => _CustomRawGestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.cancel,
          size: 24,
          color: BegoColors.gray200,
        ),
      );
}

class _CustomRawGestureDetector extends RawGestureDetector {
  _CustomRawGestureDetector({
    GestureTapCallback? onTap,
    super.child,
  }) : super(
          behavior: HitTestBehavior.opaque,
          gestures: <Type, GestureRecognizerFactory>{
            _AllowMultipleGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                    _AllowMultipleGestureRecognizer>(
              _AllowMultipleGestureRecognizer.new,
              (_AllowMultipleGestureRecognizer instance) =>
                  instance.onTap = onTap,
            ),
          },
        );
}

class _AllowMultipleGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
