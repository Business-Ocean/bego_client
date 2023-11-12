import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/themes/_be_cupertino_theme.dart';
import 'package:bego_ui/src/themes/_bego_default.dart';
import 'package:bego_ui/src/themes/_input_forms_theme.dart';
import 'package:bego_ui/src/themes/_text_themes.dart';
import 'package:bego_ui/src/themes/_theme_extention.dart';
import 'package:flutter/material.dart';

const package = 'bego_ui';

ThemeData createBegoTheme(BeThemeData betheme) {
  // Build theme from bego theme data
  // debugPrint('Creating ThemeData from Bego Theme Data ${betheme.runtimeType}');
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
    fontFamily: BegoTextStyle.fontFamily,
    // primarySwatch: getPrimarySwatch(betheme),
    // colorSchemeSeed: BegoColors.pink,
    // platform: platform(betheme), // throws exception for web
    colorScheme: betheme.colors.colorScheme,
    fontFamilyFallback: const [],
    package: package,
    useMaterial3: useMaterial3,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    canvasColor: betheme.isDark ? BegoColors.slate900 : BegoColors.pink50,

    //
    cardColor: betheme.colors.card,
    dialogBackgroundColor: betheme.colors.dialogBackground,
    disabledColor: betheme.colors.disabled,
    dividerColor: betheme.colors.divider,
    focusColor: betheme.colors.focus,
    highlightColor: betheme.colors.highlight,
    hintColor: betheme.colors.hint,
    hoverColor: betheme.colors.hover,
    indicatorColor: betheme.colors.indicator,
    primaryColor: betheme.colors.primary,
    primaryColorDark: betheme.colors.primaryColorDark,
    primaryColorLight: betheme.colors.primaryColorLight,
    secondaryHeaderColor: betheme.colors.secondaryHeader,
    scaffoldBackgroundColor: betheme.colors.scaffoldBackground,
    shadowColor: betheme.colors.shadow,
    splashColor: betheme.colors.splash,
    unselectedWidgetColor: betheme.colors.unselectedWidget,

    //
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    iconTheme: iconTheme(betheme),
    primaryIconTheme: primaryIconTheme(betheme),
    primaryTextTheme: primaryTextTheme(betheme),
    applyElevationOverlayColor: true,
    cupertinoOverrideTheme: cupertinoOverrideTheme(betheme), // done
    inputDecorationTheme: inputDecorationTheme(betheme), // done
    pageTransitionsTheme:
        pageTransitionsTheme(betheme), // done - > cutomize later
    scrollbarTheme: scrollbarTheme(betheme), // done
    splashFactory: splashFactory(betheme), // done
    textTheme: textTheme(betheme), // done
    actionIconTheme: actionIconTheme(betheme), //done
    appBarTheme: appBarTheme(betheme), // done
    badgeTheme: badgeTheme(betheme), //done
    bannerTheme: bannerTheme(betheme), // done
    bottomAppBarTheme: bottomAppBarTheme(betheme), // done
    bottomNavigationBarTheme: bottomNavigationBarTheme(betheme), // done
    bottomSheetTheme: bottomSheetTheme(betheme), // done
    buttonBarTheme: buttonBarTheme(betheme), // done
    cardTheme: cardTheme(betheme), // done
    chipTheme: chipTheme(betheme), // done
    dataTableTheme: dataTableTheme(betheme), // done
    datePickerTheme: datePickerTheme(betheme), // done
    dialogTheme: dialogTheme(betheme), // done
    dividerTheme: dividerTheme(betheme), // done
    drawerTheme: drawerTheme(betheme), // done
    dropdownMenuTheme: dropdownMenuTheme(betheme), //done (need enhancement)
    expansionTileTheme: expansionTileTheme(betheme), // done
    floatingActionButtonTheme: floatingActionButtonTheme(betheme), // done
    listTileTheme: listTileTheme(betheme), //done
    menuBarTheme: menuBarTheme(betheme), //done
    menuButtonTheme: menuButtonTheme(betheme), // done
    menuTheme: menuTheme(betheme), // done
    navigationBarTheme: navigationBarTheme(betheme), // done
    navigationDrawerTheme: navigationDrawerTheme(betheme), // done
    iconButtonTheme: iconButtonTheme(betheme), //done

    navigationRailTheme: navigationRailTheme(betheme), // done
    elevatedButtonTheme: elevatedButtonTheme(betheme), // done
    buttonTheme: buttonTheme(betheme), // theme
    filledButtonTheme: filledButtonTheme(betheme), // done
    outlinedButtonTheme: outlinedButtonTheme(betheme), // done
    textButtonTheme: textButtonTheme(betheme), //done
    popupMenuTheme: popupMenuTheme(betheme), // done
    radioTheme: radioTheme(betheme), //done
    searchViewTheme: searchViewTheme(betheme), // done
    searchBarTheme: searchBarTheme(betheme), // done
    segmentedButtonTheme: segmentedButtonTheme(betheme), //done
    snackBarTheme: snackBarTheme(betheme), //done
    tabBarTheme: tabBarTheme(betheme), //done
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
