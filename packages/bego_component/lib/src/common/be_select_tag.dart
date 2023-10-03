// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:bego_component/src/data/be_tag_data.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

/// Tag combination for selection mode
/// Supports fluid and horizontal layout
/// Supports fixed width and non-fixed width
/// The width and height spacing can be set
/// Supports single selection and multiple selection
// ignore: must_be_immutable
class BeSelectTag extends StatefulWidget {
  BeSelectTag({
    super.key,
    required this.tags,
    required this.onSelect,
    this.spacing = 12,
    this.verticalSpacing = 10,
    this.tagTextStyle,
    this.selectedTagTextStyle,
    this.tagBackgroundColor,
    this.selectedTagBackgroundColor,
    this.tagWidth = 75,
    this.isSingleSelect = true,
    this.initTagState,
    this.softWrap = true,
    this.alignment = Alignment.centerLeft,
    this.fixWidthMode = false,
    this.tagPadding =
        const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
  }) {
    if (isSingleSelect == true) {
      assert(
        initTagState == null || (initTagState!.length <= 1),
        '(initTagState == null || (initTagState!.length <= 1)',
      );
    }
  }

  /// List of displayed tags
  final List<BeTagData> tags;

  /// Select tag callback and return the position of the selected tag
  final void Function(List<BeTagData>) onSelect;

  /// Horizontal spacing, default 12
  final double spacing;

  /// Vertical spacing, default 10
  final double verticalSpacing;

  /// Style of ordinary tags
  final TextStyle? tagTextStyle;

  /// Selected label style
  final TextStyle? selectedTagTextStyle;

  /// Common label background color, default F0Color
  final Color? tagBackgroundColor;

  /// Background color of the selected label, default B0Color
  final Color? selectedTagBackgroundColor;

  /// Label width. Default global configuration width 75
  final double? tagWidth;

  /// true for streaming display, false for horizontal sliding display, default true
  final bool softWrap;

  /// Alignment mode, default is Alignment.centerLeft, left
  final Alignment alignment;

  ///Whether a fixed width is required, the default is true, specify false for fluid layout
  final bool fixWidthMode;

  /// Whether it is a radio selection, the default is true
  final bool isSingleSelect;

  /// Initial state array for multi-selection
  final List<bool>? initTagState;

  final EdgeInsets tagPadding;

  @override
  _BeSelectTagState createState() => _BeSelectTagState();
}

class _BeSelectTagState extends State<BeSelectTag> {
  List<bool> _tagState = [];

  @override
  void initState() {
    super.initState();
    _tagState = widget.tags.map((name) => false).toList();
    if (widget.initTagState != null) {
      for (var index = 0;
          index < min(widget.initTagState!.length, widget.tags.length);
          index++) {
        _tagState[index] = widget.initTagState![index];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (widget.softWrap) {
      content = Wrap(
        runSpacing: widget.verticalSpacing,
        spacing: widget.spacing,
        children: _tagWidgetList(context),
      );
    } else {
      content = _scrollTagListWidget(context);
    }

    return Align(
      alignment: widget.alignment,
      child: content,
    );
  }

  Widget _scrollTagListWidget(BuildContext context) {
    final tagList = _tagWidgetList(context);
    var tagIdx = 0;
    final finalTagList = tagList.map((tag) {
      final rightPadding =
          (tagIdx == tagList.length - 1) ? 0.0 : widget.spacing;
      final padding = Padding(
        padding: EdgeInsets.only(right: rightPadding),
        child: tag,
      );
      tagIdx++;
      return padding;
    }).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: finalTagList,
      ),
    );
  }

  List<Widget> _tagWidgetList(context) {
    final list = <Widget>[];
    for (var nameIndex = 0; nameIndex < widget.tags.length; nameIndex++) {
      final tagWidget = _tagWidgetAtIndex(nameIndex);
      final gdt = GestureDetector(
        child: tagWidget,
        onTap: () {
          if (widget.isSingleSelect) {
            final selected = _tagState[nameIndex];
            if (selected) {
              return;
            }
            _tagState = _tagState.map((value) => false).toList();
            setState(() {
              _tagState[nameIndex] = true;
            });
          } else {
            setState(() {
              _tagState[nameIndex] = !_tagState[nameIndex];
            });
          }

          final selectedTags = <BeTagData>[];
          for (var index = 0; index < _tagState.length; index++) {
            if (_tagState[index]) selectedTags.add(widget.tags[index]);
          }
          widget.onSelect(selectedTags);
        },
      );
      list.add(gdt);
    }
    return list;
  }

  Widget _tagWidgetAtIndex(int nameIndex) {
    final selected = _tagState[nameIndex];
    final tx = Text(
      widget.tags[nameIndex].label,
      style: selected ? _selectedTextStyle() : _tagTextStyle(),
      overflow: TextOverflow.ellipsis,
    );
    final container = Container(
      decoration: BoxDecoration(
        color: selected
            ? (becolors.primary.withAlpha(50))
            : (becolors.accent.withAlpha(10)),
        borderRadius: bestyles.borderRadius,
      ),
      width: widget.fixWidthMode ? widget.tagWidth : null,
      padding: widget.tagPadding,
      child: Center(widthFactor: 1, child: tx),
    );
    return container;
  }

  TextStyle _tagTextStyle() => bestyles.labelMedium;

  TextStyle _selectedTextStyle() =>
      bestyles.labelMedium.copyWith(color: becolors.primary);

  @override
  void didUpdateWidget(BeSelectTag oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the two arrays are not equal, reset the selected state
    if (!_sameList(oldWidget.tags, widget.tags)) {
      _tagState = List.filled(widget.tags.length, false);
    }
  }

  /// Compare the contents of the two arrays to see if they are consistent. If they are consistent, return true, otherwise false
  bool _sameList(List<BeTagData> first, List<BeTagData> second) {
    if (first.length != second.length) return false;
    var index = 0;
    return first.firstWhere(
          (item) => item != second[index++],
          orElse: () => BeTagData(label: ''),
        ) ==
        BeTagData(label: '');
  }
}
