import 'dart:io' show Platform;

import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/themes/style/material_state_property.dart';
import 'package:flutter/material.dart';

// TO-DO(sourav): change platform
TargetPlatform platform(BeThemeData betheme) {
  if (Platform.isAndroid) return TargetPlatform.android;
  if (Platform.isIOS) return TargetPlatform.iOS;
  if (Platform.isMacOS) return TargetPlatform.macOS;
  if (Platform.isLinux) return TargetPlatform.linux;
  if (Platform.isWindows) return TargetPlatform.windows;
  if (Platform.isFuchsia) return TargetPlatform.fuchsia;
  return TargetPlatform.android;
}

CheckboxThemeData checkboxTheme(BeThemeData betheme) => CheckboxThemeData(
      // fillColor: betheme.becolors.formStateColor,
      // checkColor: betheme.becolors.formStateColor,
      // overlayColor: betheme.becolors.formStateColor,
      // mouseCursor:
      //     MaterialStateProperty.all(MaterialStateMouseCursor.clickable),

      // splashRadius: 20,
      fillColor: fillColorState(betheme),
      side: sideMaterialState(betheme),

      visualDensity: VisualDensity.compact,
      shape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.xsRadius,
      ),
    );

SwitchThemeData switchTheme(BeThemeData betheme) => SwitchThemeData(
      trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const MaterialStatePropertyAll(0),
      thumbColor: switchThumbColor(betheme),
      thumbIcon: iconInvisibleMaterialStateAll(),
      trackColor: trackColorMaterialState(betheme),

      // thumbIcon: MaterialStateProperty.resolveWith((states) {
      //   if (states.contains(MaterialState.selected)) {
      //     return const Icon(BegoIcons.ok);
      //   }
      //   return const Icon(BegoIcons.minus_circle);
      // }),
      // trackColor: MaterialStateProperty.resolveWith((states) {
      //   if (states.contains(MaterialState.selected)) {
      //     return betheme.becolors.primary;
      //   }
      //   return betheme.becolors.textColor;
      // }),
    );

RadioThemeData radioTheme(BeThemeData betheme) => RadioThemeData(
      fillColor: fillColorRadioState(betheme),
    );

SliderThemeData sliderTheme(BeThemeData betheme) => SliderThemeData(
      activeTrackColor: betheme.becolors.primary,
      inactiveTrackColor: betheme.becolors.disabled,
      disabledInactiveTrackColor: betheme.becolors.disabled,
      disabledActiveTrackColor: betheme.becolors.disabled,
      disabledThumbColor: betheme.becolors.disabled,
      overlayColor: betheme.becolors.intraction,
      trackHeight: 2,
      minThumbSeparation: 3,

      // overlayShape: SliderComponentShape.noOverlay,
    );

bool applyElevationOverlayColor(BeThemeData betheme) => false;

PageTransitionsTheme pageTransitionsTheme(BeThemeData betheme) =>
    const PageTransitionsTheme();

ScrollbarThemeData scrollbarTheme(BeThemeData betheme) =>
    const ScrollbarThemeData();

InteractiveInkFeatureFactory splashFactory(BeThemeData betheme) =>
    InkSparkle.constantTurbulenceSeedSplashFactory;

//static VisualDensity defaultDensityForPlatform(TargetPlatform platform) {
//  switch (platform) {
//    case TargetPlatform.android:
//    case TargetPlatform.iOS:
//    case TargetPlatform.fuchsia:
//      break;
//    case TargetPlatform.linux:
//    case TargetPlatform.macOS:
//    case TargetPlatform.windows:
//      return compact;
//  }
//  return VisualDensity.standard;
//}

IconThemeData iconTheme(BeThemeData betheme) => const IconThemeData();

IconThemeData primaryIconTheme(BeThemeData betheme) => const IconThemeData();

ActionIconThemeData actionIconTheme(BeThemeData betheme) =>
    const ActionIconThemeData();

AppBarTheme appBarTheme(BeThemeData betheme) => const AppBarTheme();

BadgeThemeData badgeTheme(BeThemeData betheme) => const BadgeThemeData();

MaterialBannerThemeData bannerTheme(BeThemeData betheme) =>
    const MaterialBannerThemeData();

BottomAppBarTheme bottomAppBarTheme(BeThemeData betheme) =>
    const BottomAppBarTheme();

BottomNavigationBarThemeData bottomNavigationBarTheme(BeThemeData betheme) =>
    const BottomNavigationBarThemeData();

BottomSheetThemeData bottomSheetTheme(BeThemeData betheme) =>
    const BottomSheetThemeData();

ButtonBarThemeData buttonBarTheme(BeThemeData betheme) =>
    const ButtonBarThemeData();

ButtonThemeData buttonTheme(BeThemeData betheme) => const ButtonThemeData();

CardTheme cardTheme(BeThemeData betheme) => const CardTheme();

ChipThemeData chipTheme(BeThemeData betheme) => const ChipThemeData();

DataTableThemeData dataTableTheme(BeThemeData betheme) =>
    const DataTableThemeData();

DatePickerThemeData datePickerTheme(BeThemeData betheme) =>
    const DatePickerThemeData();

DialogTheme dialogTheme(BeThemeData betheme) => const DialogTheme();

DividerThemeData dividerTheme(BeThemeData betheme) => const DividerThemeData();

DrawerThemeData drawerTheme(BeThemeData betheme) => const DrawerThemeData();

DropdownMenuThemeData dropdownMenuTheme(BeThemeData betheme) =>
    const DropdownMenuThemeData();

ElevatedButtonThemeData elevatedButtonTheme(BeThemeData betheme) =>
    const ElevatedButtonThemeData();

ExpansionTileThemeData expansionTileTheme(BeThemeData betheme) =>
    const ExpansionTileThemeData();

FilledButtonThemeData filledButtonTheme(BeThemeData betheme) =>
    const FilledButtonThemeData();

FloatingActionButtonThemeData floatingActionButtonTheme(BeThemeData betheme) =>
    const FloatingActionButtonThemeData();

IconButtonThemeData iconButtonTheme(BeThemeData betheme) =>
    const IconButtonThemeData();

ListTileThemeData listTileTheme(BeThemeData betheme) =>
    const ListTileThemeData();

MenuBarThemeData menuBarTheme(BeThemeData betheme) => const MenuBarThemeData();

MenuButtonThemeData menuButtonTheme(BeThemeData betheme) =>
    const MenuButtonThemeData();

MenuThemeData menuTheme(BeThemeData betheme) => const MenuThemeData();

NavigationBarThemeData navigationBarTheme(BeThemeData betheme) =>
    const NavigationBarThemeData();

NavigationDrawerThemeData navigationDrawerTheme(BeThemeData betheme) =>
    const NavigationDrawerThemeData();

NavigationRailThemeData navigationRailTheme(BeThemeData betheme) =>
    const NavigationRailThemeData();

OutlinedButtonThemeData outlinedButtonTheme(BeThemeData betheme) =>
    const OutlinedButtonThemeData();

PopupMenuThemeData popupMenuTheme(BeThemeData betheme) =>
    const PopupMenuThemeData();

ProgressIndicatorThemeData progressIndicatorTheme(BeThemeData betheme) =>
    const ProgressIndicatorThemeData(
      linearMinHeight: 2,
      // circularTrackColor: withAlpha,
    );

SearchBarThemeData searchBarTheme(BeThemeData betheme) =>
    const SearchBarThemeData();

SearchViewThemeData searchViewTheme(BeThemeData betheme) =>
    const SearchViewThemeData();

SegmentedButtonThemeData segmentedButtonTheme(BeThemeData betheme) =>
    SegmentedButtonThemeData(
      // selectedIcon: const Icon(BegoIcons.ok),
      style: ButtonStyle(
        // elevation: MaterialStateProperty.resolveWith((states) {
        //   if (states.any(interactiveStates.contains)) return 4;
        //   return 0;
        // }),
        // minimumSize: MaterialStateProperty.resolveWith((states) {
        //   if (states.any(interactiveStates.contains)) return const Size(53, 48);
        //   return null;
        // }),
        iconSize: const MaterialStatePropertyAll(16),
        textStyle: MaterialStatePropertyAll(betheme.bestyle.labelMedium),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          // if (states.any(interactiveStates.contains)) {}
          if (states.contains(MaterialState.selected)) {
            return betheme.becolors.lightInverse;
          }
          return betheme.becolors.primary;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: betheme.bestyle.borderRadius,
            side: BorderSide(color: betheme.becolors.primary),
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: betheme.becolors.primary),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          // if (states.any(interactiveStates.contains)) {
          //   return betheme.becolors.accent.withAlpha(20);
          // }
          if (states.contains(MaterialState.selected)) {
            return betheme.becolors.primary;
          }
          return null;
        }),
      ),
    );

SnackBarThemeData snackBarTheme(BeThemeData betheme) => SnackBarThemeData(
      backgroundColor: betheme.becolors.accent,
      contentTextStyle: betheme.bestyle.bodySmall
          .copyWith(color: betheme.becolors.lightInverse),
    );

TabBarTheme tabBarTheme(BeThemeData betheme) => TabBarTheme(
      unselectedLabelColor: betheme.becolors.accent,
      // indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.fill,
      // labelPadding: EdgeInsets.zero,
    );

TextButtonThemeData textButtonTheme(BeThemeData betheme) => TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: betheme.bestyle.borderRadius,
        ),
        minimumSize: const Size(100, 48),
      ),
    );

TextSelectionThemeData textSelectionTheme(BeThemeData betheme) =>
    TextSelectionThemeData(
      // cursorColor: betheme.becolors.accent,
      selectionColor: betheme.becolors.highlight.withAlpha(50),
      // selectionHandleColor: Colors.blue,
    );

TimePickerThemeData timePickerTheme(BeThemeData betheme) => TimePickerThemeData(
      // backgroundColor: Colors.white,
      dialBackgroundColor: betheme.becolors.lightInverse,
      elevation: 0,
      backgroundColor: betheme.becolors.card,
      helpTextStyle: betheme.bestyle.titleMedium,
      dialHandColor: betheme.becolors.primary,
      hourMinuteTextColor: betheme.becolors.primary,
      hourMinuteShape: const RoundedRectangleBorder(
        // side: BorderSide.,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );

ToggleButtonsThemeData toggleButtonsTheme(BeThemeData betheme) {
  final color = betheme.becolors.primary.withAlpha(50);
  return ToggleButtonsThemeData(
    hoverColor: BegoColors.black.withAlpha(20),
    borderRadius: betheme.bestyle.radius40,
    fillColor: color,
    borderColor: color,
    color: betheme.becolors.text,
    constraints: const BoxConstraints(minHeight: 40, minWidth: 0),
    borderWidth: 1,
    selectedBorderColor: color,
    disabledBorderColor: betheme.becolors.disabled,
    selectedColor: betheme.becolors.primary,
    textStyle: betheme.bestyle.labelMedium,
    disabledColor: betheme.becolors.disabled,
    splashColor: betheme.becolors.accent.withAlpha(20),
    // focusColor: betheme.becolors.primary.withAlpha(10),
  );
}

TooltipThemeData tooltipTheme(BeThemeData betheme) => TooltipThemeData(
      decoration: BoxDecoration(
        color: betheme.becolors.accent,
        borderRadius: betheme.bestyle.xsRadius,
        boxShadow: BegoShadows.boxShadow5,
      ),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 0,
      textStyle: betheme.bestyle.bodySmall.copyWith(
        color: betheme.becolors.colorScheme.onPrimary,
      ),
      excludeFromSemantics: true,
      preferBelow: false,
    );
