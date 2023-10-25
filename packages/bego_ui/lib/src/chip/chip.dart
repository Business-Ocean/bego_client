import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

/// Chips are a visual representation of a keyword or phrase that the user has
/// used for purposes of filtering the scope of content displayed in the
/// application interface at any given time.
class BeChip extends StatefulWidget {
  const BeChip({
    super.key,
    required this.child,
    required this.onRemoved,
    this.onTap,
    this.hasError = false,
    this.isEnabled = true,
  });

  /// The child of the chip. Typically a [Text] widget.
  final Widget child;

  /// Whether the chip has an error.
  final bool hasError;

  /// Defines if the chip is enabled for the interaction.
  final bool isEnabled;

  /// Callback to be called on the chip remove.
  final VoidCallback? onRemoved;

  /// Callback to be called on the chip body tap.
  final VoidCallback? onTap;

  @override
  State<BeChip> createState() => _BeChipState();
}

class _BeChipState extends State<BeChip> {
  bool _isHovered = false;
  bool _isTapped = false;

  Color get _backgroundColor => !widget.isEnabled
      ? becolors.disabled
      : widget.hasError
          ? becolors.error
          : _isTapped
              ? becolors.primary
              : _isHovered
                  ? becolors.highlight
                  : becolors.scaffoldBackground;

  Color get _foregroundColor => !widget.isEnabled
      ? BegoColors.gray300
      : widget.hasError
          ? becolors.error
          : becolors.secandory;

  @override
  Widget build(BuildContext context) => IgnorePointer(
        ignoring: !widget.isEnabled,
        child: MouseRegion(
          onEnter: (event) => setState(() => _isHovered = true),
          onExit: (event) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTapDown: (_) => setState(() => _isTapped = true),
            onTapUp: (_) => setState(() => _isTapped = false),
            onTapCancel: () => setState(() => _isTapped = false),
            onTap: widget.onTap,
            child: SizedBox(
              height: _height,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  color: _backgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DefaultTextStyle.merge(
                          style: bestyles.labelSmall
                              .copyWith(color: _foregroundColor),
                          child: widget.child,
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onRemoved,
                        child: Icon(
                          BeIcons.icon_close,
                          size: 16,
                          color: _foregroundColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

const _height = 24.0;
