import 'package:bego_ui/src/themes/_be_cupertino_theme.dart';
import 'package:bego_ui/src/themes/_bego_default.dart';
import 'package:bego_ui/src/themes/_input_forms_theme.dart';
import 'package:bego_ui/src/themes/_text_themes.dart';
import 'package:bego_ui/src/themes/_theme_extention.dart';
import 'package:bego_ui/src/themes/be_theme_data.dart';
import 'package:bego_ui/src/ui_const/bego_colors.dart';
import 'package:flutter/material.dart';

const package = 'bego_ui';

ThemeData createBegoTheme(BeThemeData betheme) {
  // Build theme from bego theme data
  debugPrint('Creating ThemeData from Bego Theme Data');
  const useMaterial3 = true;

  return ThemeData(
    // fontFamily: BegoTextStyle.fontFamily,
    // brightness: betheme.isDark ? Brightness.dark : Brightness.light,
    // colorSchemeSeed: betheme.becolors.primary,
    // package: BegoTextStyle.packageName,
    // fontFamilyFallback: ,
    // primarySwatch:  MaterialColor(primary, swatch),
    // androidOverscrollIndicator: ,
    // backgroundColor: ,
    // bottomAppBarColor: ,
    // errorColor: ,
    // selectedRowColor: ,
    // toggleableActiveColor: ,

    brightness: betheme.isDark ? Brightness.dark : Brightness.light,
    extensions: themeExtention(betheme),
    fontFamily: '',
    // primarySwatch: getPrimarySwatch(betheme),
    // colorSchemeSeed: BegoColors.pink,
    colorScheme: betheme.becolors.colorScheme,
    fontFamilyFallback: const [],
    package: package,
    platform: platform(betheme),
    applyElevationOverlayColor: applyElevationOverlayColor(betheme),
    cupertinoOverrideTheme: cupertinoOverrideTheme(betheme),
    inputDecorationTheme: inputDecorationTheme(betheme),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    pageTransitionsTheme: pageTransitionsTheme(betheme),
    scrollbarTheme: scrollbarTheme(betheme),
    splashFactory: splashFactory(betheme),
    useMaterial3: useMaterial3,
    visualDensity: VisualDensity.compact,
    canvasColor: betheme.isDark ? BegoColors.slate900 : BegoColors.blue50,
    cardColor: betheme.becolors.card,
    dialogBackgroundColor: betheme.becolors.dialogBackground,
    disabledColor: betheme.becolors.disabled,
    dividerColor: betheme.becolors.divider,
    focusColor: betheme.becolors.focus,
    highlightColor: betheme.becolors.highlight,
    hintColor: betheme.becolors.hint,
    hoverColor: betheme.becolors.hover,
    indicatorColor: betheme.becolors.indicator,
    primaryColor: betheme.becolors.primary,
    primaryColorDark: betheme.becolors.primaryColorDark,
    primaryColorLight: betheme.becolors.primaryColorLight,
    scaffoldBackgroundColor: betheme.becolors.scaffoldBackground,
    secondaryHeaderColor: betheme.becolors.secondaryHeader,
    shadowColor: betheme.becolors.shadow,
    splashColor: betheme.becolors.splash,
    unselectedWidgetColor: betheme.becolors.unselectedWidget,
    iconTheme: iconTheme(betheme),
    primaryIconTheme: primaryIconTheme(betheme),
    primaryTextTheme: primaryTextTheme(betheme),
    textTheme: textTheme(betheme),
    actionIconTheme: actionIconTheme(betheme),
    appBarTheme: appBarTheme(betheme),
    badgeTheme: badgeTheme(betheme),
    bannerTheme: bannerTheme(betheme),
    bottomAppBarTheme: bottomAppBarTheme(betheme),
    bottomNavigationBarTheme: bottomNavigationBarTheme(betheme),
    bottomSheetTheme: bottomSheetTheme(betheme),
    buttonBarTheme: buttonBarTheme(betheme),
    buttonTheme: buttonTheme(betheme),
    cardTheme: cardTheme(betheme),
    chipTheme: chipTheme(betheme),
    dataTableTheme: dataTableTheme(betheme),
    datePickerTheme: datePickerTheme(betheme),
    dialogTheme: dialogTheme(betheme),
    dividerTheme: dividerTheme(betheme),
    drawerTheme: drawerTheme(betheme),
    dropdownMenuTheme: dropdownMenuTheme(betheme),
    elevatedButtonTheme: elevatedButtonTheme(betheme),
    expansionTileTheme: expansionTileTheme(betheme),
    filledButtonTheme: filledButtonTheme(betheme),
    floatingActionButtonTheme: floatingActionButtonTheme(betheme),
    iconButtonTheme: iconButtonTheme(betheme),
    listTileTheme: listTileTheme(betheme),
    menuBarTheme: menuBarTheme(betheme),
    menuButtonTheme: menuButtonTheme(betheme),
    menuTheme: menuTheme(betheme),
    navigationBarTheme: navigationBarTheme(betheme),
    navigationDrawerTheme: navigationDrawerTheme(betheme),
    navigationRailTheme: navigationRailTheme(betheme),
    outlinedButtonTheme: outlinedButtonTheme(betheme),
    popupMenuTheme: popupMenuTheme(betheme),
    radioTheme: radioTheme(betheme),
    searchBarTheme: searchBarTheme(betheme),
    searchViewTheme: searchViewTheme(betheme),
    segmentedButtonTheme: segmentedButtonTheme(betheme), //done
    snackBarTheme: snackBarTheme(betheme), //done
    tabBarTheme: tabBarTheme(betheme), //done
    textButtonTheme: textButtonTheme(betheme), //done
    textSelectionTheme: textSelectionTheme(betheme), // done
    timePickerTheme: timePickerTheme(betheme), //done
    toggleButtonsTheme: toggleButtonsTheme(betheme), //done
    tooltipTheme: tooltipTheme(betheme), // done
    sliderTheme: sliderTheme(betheme), // done
    progressIndicatorTheme: progressIndicatorTheme(betheme), //done
    switchTheme: switchTheme(betheme), //done
    checkboxTheme: checkboxTheme(betheme), // done
    typography: typography, //done
  );
}

   // @Depricated  androidOverscrollIndicator: ,
   // @Depricated  backgroundColor: ,
   // @Depricated  bottomAppBarColor: ,
   // @Depricated  errorColor: ,
   // @Depricated  fixTextFieldOutlineLabel: ,
   // @Depricated  primaryColorBrightness: ,
   // @Depricated  selectedRowColor: ,
   // @Depricated  toggleableActiveColor: ,