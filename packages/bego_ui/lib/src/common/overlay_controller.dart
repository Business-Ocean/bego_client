import 'package:bego_core/bego_dfunc.dart';
import 'package:bego_ui/src/form/dropdown/dropdown.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tap_interceptor.dart';
import 'package:bego_ui/src/form/dropdown/dropdown_tile.dart';
import 'package:flutter/material.dart';

class OverlayController<T> extends StatefulWidget {
  const OverlayController({
    super.key,
    required this.child,
    required this.items,
    required this.onItemSelected,
    required this.focusNode,
    required this.anchorKey,
    this.width,
    this.onShown,
    this.onHidden,
    this.rootOverlay = false,
  });

  final Widget child;

  final List<BeDropdownTile<T>> items;
  final ValueSetter<T> onItemSelected;
  final FocusNode focusNode;
  final double? width;
  final GlobalKey anchorKey;
  final VoidCallback? onShown;
  final VoidCallback? onHidden;
  final bool rootOverlay;

  @override
  State<OverlayController<T>> createState() => _OverlayControllerState<T>();
}

class _OverlayControllerState<T> extends State<OverlayController<T>> {
  // ignore: dispose-fields, disposed in _removeOverlay
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() => widget.focusNode.hasFocus
      ? setState(_showOverlay)
      : setState(_removeOverlay);

  @override
  void didUpdateWidget(OverlayController<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _overlayEntry?.markNeedsBuild();
    });
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;
    _overlayEntry = _createOverlayEntry().also((it) {
      Overlay.of(context, rootOverlay: widget.rootOverlay).insert(it);
    });

    widget.onShown?.call();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    widget.onHidden?.call();
  }

  OverlayEntry _createOverlayEntry() => OverlayEntry(
        builder: (context) => Stack(
          key: const Key('BeSelectOverlay'),
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTapDown: (_) => widget.focusNode.unfocus(),
            ),
            DropdownTapInterceptor(
              onTap: widget.focusNode.unfocus,
              child: BeDropdown<T>(
                items: widget.items,
                anchorKey: widget.anchorKey,
                onChanged: widget.onItemSelected,
                width: widget.width,
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    _removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canPop = widget.focusNode.hasFocus;
    return PopScope(
      canPop: !canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          widget.focusNode.unfocus();
        }
      },
      child: widget.child,
    );
  }
}
