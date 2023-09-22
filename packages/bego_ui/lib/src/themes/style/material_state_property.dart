import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

const Set<MaterialState> interactiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};
const Set<MaterialState> interactiveSelectionStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
  MaterialState.selected,
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

MaterialStateProperty<BorderSide?> inputSideBorder(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return null;
      }
      return BorderSide(
        width: 1,
        color: betheme.becolors.primary.withAlpha(20),
      );
    });

MaterialStateBorderSide elvatedSideBorder(BeThemeData betheme) =>
    MaterialStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.becolors.primary, width: 2);
      }
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: betheme.becolors.disabled.withAlpha(40),
          width: 1.5,
        );
      }
      // return BorderSide(color: betheme.becolors.primary);
      return BorderSide(
        color: betheme.becolors.primary,
        width: 1.5,
      );
    });

MaterialStateBorderSide outlineSideBorder(BeThemeData betheme) =>
    MaterialStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.becolors.primary, width: 2);
      }
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: betheme.becolors.disabled,
          width: 1.5,
        );
      }
      // return BorderSide(color: betheme.becolors.primary);
      return BorderSide(
        color: betheme.becolors.primary,
        width: 1.5,
      );
    });

MaterialStateProperty<OutlinedBorder?> roundRectShape(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return RoundedRectangleBorder(
          borderRadius: betheme.bestyle.borderRadius,
        );
      }
      return RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
      );
    });

MaterialStateProperty<Color?> primaryOrDisableColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.becolors.disabled;
        }
        return betheme.becolors.primary;
      },
    );

MaterialStateTextStyle buttonTextStyle(BeThemeData betheme) =>
    MaterialStateTextStyle.resolveWith(
      (states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.bestyle.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          );
        }
        return betheme.bestyle.labelMedium.copyWith(
          letterSpacing: 1.2,
        );
      },
    );

MaterialStateProperty<Color?> buttonForegroundColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.becolors.disabled;
        }
        return betheme.becolors.lightInverse;
      },
    );
MaterialStateProperty<Color?> buttonFilledForegroundColor(
  BeThemeData betheme,
) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.becolors.disabled;
        }
        return betheme.becolors.primary;
      },
    );

MaterialStateProperty<Color?> buttonBackgroundColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.becolors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.becolors.disabled.withAlpha(80);
      }
      return betheme.becolors.primary;
    });

MaterialStateProperty<Color?> buttonFilledBackgroundColor(
  BeThemeData betheme,
) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.becolors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.becolors.disabled.withAlpha(80);
      }
      return ColorUtils.getShade(betheme.becolors.primary, value: 0.45);
    });

MaterialStateProperty<double?> elevationInteraction() =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return 2;
      }
      return 0;
    });
