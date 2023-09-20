import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};

const Set<MaterialState> hoverOrFocus = <MaterialState>{
  MaterialState.hovered,
  MaterialState.focused,
};

MaterialStateBorderSide sideMaterialState(BeThemeData betheme) =>
    MaterialStateBorderSide.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: betheme.becolors.disabled,
          width: 2,
          strokeAlign: 0,
          style: BorderStyle.solid,
        );
      }
      return BorderSide(
        color: betheme.becolors.primary,
        width: 2,
        strokeAlign: 0,
        style: BorderStyle.solid,
      );
    });

MaterialStateColor fillColorState(BeThemeData betheme) =>
    MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        if (states.contains(MaterialState.selected)) {
          return betheme.becolors.disabled;
        }
        return Colors.transparent;
      }
      return betheme.becolors.primary;
    });

MaterialStateColor fillColorRadioState(BeThemeData betheme) =>
    MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return betheme.becolors.disabled;
      }
      return betheme.becolors.primary;
    });

MaterialStateProperty<Color?> trackColorMaterialState(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return betheme.becolors.disabled;
      }
      if (states.contains(MaterialState.selected)) {
        return betheme.becolors.primary;
      }
      return betheme.becolors.hint;
    });

MaterialStatePropertyAll<Icon?> iconInvisibleMaterialStateAll() =>
    const MaterialStatePropertyAll(
      Icon(
        IconData(45),
        color: Colors.transparent,
      ),
    );

MaterialStateProperty<Color?> switchThumbColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return ColorUtils.getShade(
          betheme.becolors.disabled,
          darker: true,
        );
      }
      return betheme.becolors.colorScheme.background;
    });
