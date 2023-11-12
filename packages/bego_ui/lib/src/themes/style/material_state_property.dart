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
          color: betheme.colors.disabled,
          width: 2,
          strokeAlign: 0,
          style: BorderStyle.solid,
        );
      }
      return BorderSide(
        color: betheme.colors.primary,
        width: 2,
        strokeAlign: 0,
        style: BorderStyle.solid,
      );
    });

MaterialStateColor fillColorState(BeThemeData betheme) =>
    MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        if (states.contains(MaterialState.selected)) {
          return betheme.colors.disabled;
        }
      }
      if (states.contains(MaterialState.selected)) {
        return betheme.colors.primary;
      }
      return Colors.transparent;
    });

MaterialStateColor fillColorRadioState(BeThemeData betheme) =>
    MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return betheme.colors.disabled;
      }
      return betheme.colors.primary;
    });

MaterialStateProperty<Color?> trackColorMaterialState(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return betheme.colors.disabled;
      }
      if (states.contains(MaterialState.selected)) {
        return betheme.colors.primary;
      }
      return betheme.colors.hint;
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
          betheme.colors.disabled,
          darker: true,
        );
      }
      return betheme.colors.colorScheme.background;
    });

MaterialStateProperty<BorderSide?> inputSideBorder(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return null;
      }
      return BorderSide(
        width: 1,
        color: betheme.colors.primary.withAlpha(20),
      );
    });

MaterialStateBorderSide elvatedSideBorder(BeThemeData betheme) =>
    MaterialStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.colors.primary, width: 2);
      }
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: betheme.colors.disabled.withAlpha(40),
          width: 1.5,
        );
      }
      // return BorderSide(color: betheme.becolors.primary);
      return BorderSide(
        color: betheme.colors.primary,
        width: 1.5,
      );
    });

MaterialStateBorderSide outlineSideBorder(BeThemeData betheme) =>
    MaterialStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.colors.primary, width: 2);
      }
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: betheme.colors.disabled,
          width: 1.5,
        );
      }
      // return BorderSide(color: betheme.becolors.primary);
      return BorderSide(
        color: betheme.colors.primary,
        width: 1.5,
      );
    });

MaterialStateProperty<OutlinedBorder?> roundRectShape(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return RoundedRectangleBorder(
          borderRadius: betheme.style.borderRadius,
        );
      }
      return RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
      );
    });

MaterialStateProperty<Color?> primaryOrDisableColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.primary;
      },
    );

MaterialStateTextStyle buttonTextStyle(BeThemeData betheme) =>
    MaterialStateTextStyle.resolveWith(
      (states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.style.labelMedium.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          );
        }
        return betheme.style.labelMedium.copyWith(
          letterSpacing: 1.2,
        );
      },
    );

MaterialStateProperty<Color?> buttonForegroundColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.lightInverse;
      },
    );
MaterialStateProperty<Color?> iconButtonForegroundColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.icon;
      },
    );
MaterialStateProperty<Color?> buttonFilledForegroundColor(
  BeThemeData betheme,
) =>
    MaterialStateProperty.resolveWith(
      (states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.colors.disabled;
        }
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.colors.lightInverse;
        }
        return betheme.colors.primary;
      },
    );

MaterialStateProperty<Color?> buttonBackgroundColor(BeThemeData betheme) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.colors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.colors.disabled.withAlpha(80);
      }
      return betheme.colors.primary;
    });

// MaterialStateProperty<Color?> iconButtonBackgroundColor(BeThemeData betheme) =>
//     MaterialStateProperty.resolveWith((states) {
//       if (states.any(interactiveSelectionStates.contains)) {
//         return betheme.colors.primary.withAlpha(80);
//       }
//       if (states.contains(MaterialState.disabled)) {
//         return betheme.colors.disabled.withAlpha(80);
//       }
//       return betheme.colors.primary.withAlpha(60);
//     });

MaterialStateProperty<Color?> buttonFilledBackgroundColor(
  BeThemeData betheme,
) =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.colors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.colors.disabled.withAlpha(80);
      }
      return betheme.colors.primary.withAlpha(50);
    });

MaterialStateProperty<double?> elevationInteraction() =>
    MaterialStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return 2;
      }
      return 0;
    });

MaterialStateTextStyle inputLabelStyle(BeThemeData betheme) =>
    MaterialStateTextStyle.resolveWith((states) {
      if (states.contains(MaterialState.error)) {
        return betheme.style.bodyMedium.copyWith(color: betheme.colors.error);
      }
      if (states.contains(MaterialState.disabled)) {
        return betheme.style.bodyMedium
            .copyWith(color: betheme.colors.disabled);
      }
      return betheme.style.bodyMedium;
    });
