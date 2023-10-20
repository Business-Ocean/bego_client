import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/bego_widgets.dart';
import 'package:flutter/material.dart';

class FormFieldWrapper extends StatefulWidget {
  const FormFieldWrapper({
    super.key,
    this.isEnabled = true,
    required this.focusNode,
    this.isFocused,
    this.label,
    this.caption,
    this.captionIcon,
    this.helperMessage,
    this.error,
    this.errorVariant = BeInputErrorVariant.bottomHint,
    this.hasBorders = true,
    this.isRequired = false,
    this.suffix,
    this.prefix,
    this.fieldBoxKey,
    this.children = const <Widget>[],
  });

  final bool isEnabled;
  final FocusNode focusNode;
  final bool? isFocused;
  final String? label;
  final Widget? caption;
  final IconData? captionIcon;
  final Widget? helperMessage;
  final String? error;
  final BeInputErrorVariant errorVariant;
  final bool hasBorders;
  final bool isRequired;
  final Widget? suffix;
  final Widget? prefix;
  final List<Widget> children;
  final Key? fieldBoxKey;

  bool get hasError {
    final error = this.error;

    return error != null && error.isNotEmpty;
  }

  @override
  State<FormFieldWrapper> createState() => _FieldWrapper();
}

class _FieldWrapper extends State<FormFieldWrapper> {
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }

  bool get _isUsingBottomHint =>
      widget.errorVariant == BeInputErrorVariant.bottomHint;

  String get _normalizedError {
    final error = widget.error;

    if (error == null || error.isEmpty) return '';

    return error;
  }

  void _onFocusChanged() => setState(() {});

  bool get _isFocused => widget.isFocused ?? widget.focusNode.hasFocus;

  Color get _background =>
      widget.isEnabled ? BegoColors.gray100 : becolors.disabled;

  Color get _borderColor {
    if (!widget.isEnabled) return becolors.disabled;
    if (widget.hasError) return becolors.error;
    if (_isFocused) return becolors.text;
    if (_isHovered) return becolors.primary.withAlpha(50);

    return becolors.text;
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final helperMessage = widget.helperMessage;
    final caption = widget.caption;
    final prefix = widget.prefix;
    final suffix = widget.suffix;

    return BeBadge(
      offset: const Offset(0, 10),
      position: BeBadgePosition.topRight,
      // rounded: true,
      badge: widget.isRequired
          ? Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: becolors.secandory,
              ),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              if (label != null)
                BeText.labelMedium(
                  label,
                  padding: const EdgeInsets.only(bottom: 4),
                  color: becolors.text,
                ),
              // BeFieldLabel(label: label, isRequired: widget.isRequired),
              const Spacer(),
              if (caption != null)
                _InputCaption(
                  caption: caption,
                  captionIcon: widget.captionIcon,
                ),
            ],
          ),
          Opacity(
            opacity:
                widget.isEnabled ? OpacityValue.enabled : OpacityValue.disabled,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IgnorePointer(
                  ignoring: !widget.isEnabled,
                  child:
                      // Decoration is nullable, cannot use DecoratedBox
                      // ignore: use_decorated_box
                      Container(
                    key: widget.fieldBoxKey,
                    decoration: widget.hasBorders
                        ? BoxDecoration(
                            color: _background,
                            borderRadius: bestyles.borderRadius,
                            border: Border.all(
                              color: _borderColor,
                              width: 2,
                            ),
                          )
                        : null,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _isHovered = true),
                      onExit: (_) => setState(() => _isHovered = false),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (prefix != null)
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: _Styled(
                                    isEnabled: widget.isEnabled,
                                    child: prefix,
                                  ),
                                ),
                              ...widget.children,
                              if (suffix != null)
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: _Styled(
                                    isEnabled: widget.isEnabled,
                                    child: suffix,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (helperMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: DefaultTextStyle.merge(
                      style: TextStyle(
                        color: becolors.hint,
                      ),
                      child: helperMessage,
                    ),
                  ),
                if (_isUsingBottomHint && _normalizedError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: BeLabelIcon(
                      color: becolors.error,
                      text: _normalizedError,
                      leading: Icon(
                        Icons.error,
                        color: becolors.error,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InputCaption extends StatelessWidget {
  const _InputCaption({
    required this.caption,
    this.captionIcon,
  });

  final Widget caption;
  final IconData? captionIcon;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: DefaultTextStyle.merge(
              style: BegoTextStyle.labelMedium
                  .copyWith(color: becolors(context).hint),
              child: caption,
            ),
          ),
          if (captionIcon != null)
            Icon(
              captionIcon,
              color: becolors(context).primary,
              size: _captionIconSize,
            ),
        ],
      );
}

class _Icon extends StatelessWidget {
  const _Icon({required this.child, required this.isEnabled});

  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final color =
        isEnabled ? becolors(context).primary : becolors(context).disabled;

    return IconTheme(data: IconThemeData(color: color, size: 24), child: child);
  }
}

class _Styled extends StatelessWidget {
  const _Styled({required this.child, required this.isEnabled});

  final Widget child;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final color =
        isEnabled ? becolors(context).text : becolors(context).disabled;

    return DefaultTextStyle.merge(
      style: BegoTextStyle.bodySmall.copyWith(color: color),
      child: _Icon(isEnabled: isEnabled, child: child),
    );
  }
}

const _captionIconSize = 16.0;
