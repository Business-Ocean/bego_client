import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:flutter/material.dart';

bool applyElevationOverlayColor(BeThemeData betheme) => false;

PageTransitionsTheme pageTransitionsTheme(BeThemeData betheme) =>
    const PageTransitionsTheme();

// TO-DO(sourav): change platform
TargetPlatform platform(BeThemeData betheme) => TargetPlatform.android;

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

CheckboxThemeData checkboxTheme(BeThemeData betheme) =>
    const CheckboxThemeData();

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
    const ProgressIndicatorThemeData();

RadioThemeData radioTheme(BeThemeData betheme) => const RadioThemeData();

SearchBarThemeData searchBarTheme(BeThemeData betheme) =>
    const SearchBarThemeData();

SearchViewThemeData searchViewTheme(BeThemeData betheme) =>
    const SearchViewThemeData();

SegmentedButtonThemeData segmentedButtonTheme(BeThemeData betheme) =>
    const SegmentedButtonThemeData();

SliderThemeData sliderTheme(BeThemeData betheme) => const SliderThemeData();

SnackBarThemeData snackBarTheme(BeThemeData betheme) =>
    const SnackBarThemeData();

SwitchThemeData switchTheme(BeThemeData betheme) => const SwitchThemeData();

TabBarTheme tabBarTheme(BeThemeData betheme) => const TabBarTheme();

TextButtonThemeData textButtonTheme(BeThemeData betheme) =>
    const TextButtonThemeData();

TextSelectionThemeData textSelectionTheme(BeThemeData betheme) =>
    const TextSelectionThemeData();

TimePickerThemeData timePickerTheme(BeThemeData betheme) =>
    const TimePickerThemeData();

ToggleButtonsThemeData toggleButtonsTheme(BeThemeData betheme) =>
    const ToggleButtonsThemeData();

TooltipThemeData tooltipTheme(BeThemeData betheme) => const TooltipThemeData();
