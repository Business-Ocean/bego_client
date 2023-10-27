import 'package:flutter/material.dart';

class BeDropDownField extends StatefulWidget {
  const BeDropDownField({
    super.key,
    required this.items,
    this.selected,
    this.menuHeight,
  });
  final List<String> items;
  final String? selected;
  final double? menuHeight;

  @override
  State<BeDropDownField> createState() => _BeDropDownFieldState();
}

class _BeDropDownFieldState extends State<BeDropDownField> {
  String? _selectedFont;

  @override
  void initState() {
    _selectedFont = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DropdownMenu<String>(
        menuHeight: widget.menuHeight,
        initialSelection: _selectedFont,
        onSelected: (String? newValue) {
          setState(() {
            _selectedFont = newValue!;
          });
        },
        dropdownMenuEntries: widget.items
            .map(
              (String e) => DropdownMenuEntry<String>(
                label: e,
                value: e,
              ),
            )
            .toList(),
      );
}
