import 'package:bego_ui/bego_ui.dart';
import 'package:flutter/material.dart';

const Set<WidgetState> interactiveStates = <WidgetState>{
  WidgetState.pressed,
  WidgetState.hovered,
  WidgetState.focused,
};
const Set<WidgetState> interactiveSelectionStates = <WidgetState>{
  WidgetState.pressed,
  WidgetState.hovered,
  WidgetState.focused,
  WidgetState.selected,
};

const Set<WidgetState> hoverOrFocus = <WidgetState>{
  WidgetState.hovered,
  WidgetState.focused,
};

WidgetStateBorderSide sideMaterialState(BeThemeData betheme) =>
    WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
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

WidgetStateColor fillColorState(BeThemeData betheme) =>
    WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        if (states.contains(WidgetState.selected)) {
          return betheme.colors.disabled;
        }
      }
      if (states.contains(WidgetState.selected)) {
        return betheme.colors.primary;
      }
      return Colors.transparent;
    });

WidgetStateColor fillColorRadioState(BeThemeData betheme) =>
    WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return betheme.colors.disabled;
      }
      return betheme.colors.primary;
    });

WidgetStateProperty<Color?> trackColorMaterialState(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return betheme.colors.disabled;
      }
      if (states.contains(WidgetState.selected)) {
        return betheme.colors.primary;
      }
      return betheme.colors.hint;
    });

WidgetStatePropertyAll<Icon?> iconInvisibleMaterialStateAll() =>
    const WidgetStatePropertyAll(
      Icon(
        IconData(45),
        color: Colors.transparent,
      ),
    );

WidgetStateProperty<Color?> switchThumbColor(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return ColorUtils.getShade(
          betheme.colors.disabled,
          darker: true,
        );
      }
      return betheme.colors.colorScheme.surface;
    });

WidgetStateProperty<BorderSide?> inputSideBorder(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.focused)) {
        return null;
      }
      return BorderSide(
        width: 1,
        color: betheme.colors.primary.withAlpha(20),
      );
    });

WidgetStateBorderSide elvatedSideBorder(BeThemeData betheme) =>
    WidgetStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.colors.primary, width: 2);
      }
      if (states.contains(WidgetState.disabled)) {
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

WidgetStateBorderSide outlineSideBorder(BeThemeData betheme) =>
    WidgetStateBorderSide.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return BorderSide(color: betheme.colors.primary, width: 2);
      }
      if (states.contains(WidgetState.disabled)) {
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

WidgetStateProperty<OutlinedBorder?> roundRectShape(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.any(interactiveStates.contains)) {
        return RoundedRectangleBorder(
          borderRadius: betheme.style.borderRadius,
        );
      }
      return RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
      );
    });

WidgetStateProperty<Color?> primaryOrDisableColor(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.primary;
      },
    );

WidgetStateTextStyle buttonTextStyle(BeThemeData betheme) =>
    WidgetStateTextStyle.resolveWith(
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

WidgetStateProperty<Color?> buttonForegroundColor(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.lightInverse;
      },
    );
WidgetStateProperty<Color?> iconButtonForegroundColor(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.icon;
      },
    );
WidgetStateProperty<Color?> buttonFilledForegroundColor(
  BeThemeData betheme,
) =>
    WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.disabled)) {
          return betheme.colors.disabled;
        }
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.colors.lightInverse;
        }
        return betheme.colors.primary;
      },
    );

WidgetStateProperty<Color?> buttonBackgroundColor(BeThemeData betheme) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.colors.primary;
      }
      if (states.contains(WidgetState.disabled)) {
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

WidgetStateProperty<Color?> buttonFilledBackgroundColor(
  BeThemeData betheme,
) =>
    WidgetStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return betheme.colors.primary;
      }
      if (states.contains(WidgetState.disabled)) {
        return betheme.colors.disabled.withAlpha(80);
      }
      return betheme.colors.primary.withAlpha(50);
    });

WidgetStateProperty<double?> elevationInteraction() =>
    WidgetStateProperty.resolveWith((states) {
      if (states.any(interactiveSelectionStates.contains)) {
        return 2;
      }
      return 0;
    });

WidgetStateTextStyle inputLabelStyle(BeThemeData betheme) =>
    WidgetStateTextStyle.resolveWith((states) {
      if (states.contains(WidgetState.error)) {
        return betheme.style.bodyMedium.copyWith(color: betheme.colors.error);
      }
      if (states.contains(WidgetState.disabled)) {
        return betheme.style.bodyMedium
            .copyWith(color: betheme.colors.disabled);
      }
      return betheme.style.bodyMedium;
    });
