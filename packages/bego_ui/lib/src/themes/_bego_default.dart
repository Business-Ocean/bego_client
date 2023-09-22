import 'dart:io' show Platform;

import 'package:bego_core/bego_get.dart';
import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/themes/style/material_state_property.dart';
import 'package:bego_ui/src/ui_const/bego_edge_insets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

// bool applyElevationOverlayColor(BeThemeData betheme) => false;

PageTransitionsTheme pageTransitionsTheme(BeThemeData betheme) =>
    const PageTransitionsTheme(
        // builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        //   TargetPlatform.values,
        //   value: (dynamic _) => const FadeUpwardsPageTransitionsBuilder(),
        // ),

        );

ScrollbarThemeData scrollbarTheme(BeThemeData betheme) => ScrollbarThemeData(
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.becolors.accent;
        }
        return betheme.becolors.accent.withAlpha(150);
      }),
      // interactive: false,
      thickness: MaterialStateProperty.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return 4;
        }
        return 2;
      }),
      // thumbVisibility: const MaterialStatePropertyAll(false),
      // trackVisibility: const MaterialStatePropertyAll(false),
      radius: const Radius.circular(8),
    );

InteractiveInkFeatureFactory splashFactory(BeThemeData betheme) =>
    InkRipple.splashFactory;

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

IconThemeData iconTheme(BeThemeData betheme) => const IconThemeData(
      size: 20,
    );

IconThemeData primaryIconTheme(BeThemeData betheme) => const IconThemeData();

ActionIconThemeData actionIconTheme(BeThemeData betheme) => ActionIconThemeData(
      backButtonIconBuilder: (context) => const Icon(
        Icons.arrow_back_ios_new_outlined,
        // BegoIcons.icon_close,
        size: 20,
      ),
      closeButtonIconBuilder: (context) => const Icon(BegoIcons.icon_close),
    );

// https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png
AppBarTheme appBarTheme(BeThemeData betheme) => AppBarTheme(
      surfaceTintColor: BegoColors.transparent,
      backgroundColor: betheme.becolors.scaffoldBackground,
      shadowColor: BegoColors.gray100,
      scrolledUnderElevation: 0.5,
      titleSpacing: 16,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: betheme.bestyle.titleMedium.copyWith(
        fontWeight: FontWeight.bold,
        // leadingDistribution: TextLeadingDistribution.even,
        overflow: TextOverflow.ellipsis,
      ),
      toolbarTextStyle: betheme.bestyle.bodySmall,
      // toolbarHeight: 10,
      // actionsIconTheme: const IconThemeData(weight: 1),
      // shape: ContinuousRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     bottomLeft: Radius.circular(80),
      //     bottomRight: Radius.circular(80),
      //   ),
      // ),
      shape: const RoundedRectangleBorder(),

      // foregroundColor: betheme.becolors.scaffoldBackground,
    );

BadgeThemeData badgeTheme(BeThemeData betheme) => BadgeThemeData(
      backgroundColor: betheme.becolors.accent,
      // largeSize: 1,
      // smallSize: 2,
      alignment: Alignment.topRight,
      // offset: const Offset(-10, 0),
      textStyle: TextStyle(
        color: betheme.becolors.lightInverse,
        fontSize: 10,
        letterSpacing: 1,
      ),
      padding: EdgeInsets.zero,
    );

MaterialBannerThemeData bannerTheme(BeThemeData betheme) =>
    MaterialBannerThemeData(
      backgroundColor: betheme.becolors.accent,
      contentTextStyle: betheme.bestyle.bodySmall.copyWith(
        color: betheme.becolors.lightInverse,
      ),
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      leadingPadding: EdgeInsets.zero,
      surfaceTintColor: BegoColors.transparent,
      dividerColor: BegoColors.gray300,
      shadowColor: BegoColors.gray100,
    );

BottomAppBarTheme bottomAppBarTheme(BeThemeData betheme) => BottomAppBarTheme(
      // surfaceTintColor: BegoColors.transparent,
      // shape: AutomaticNotchedShape(
      //   RoundedRectangleBorder(
      //     borderRadius: betheme.bestyle.borderRadius,
      //     side: const BorderSide(color: Colors.green),
      //   ),
      //   RoundedRectangleBorder(
      //     borderRadius: betheme.bestyle.borderRadius,
      //     side: const BorderSide(color: Colors.green),
      //   ),
      // ),
      elevation: 1,
      padding: p16,
      shadowColor: betheme.becolors.accent,
      surfaceTintColor: BegoColors.transparent,
    );

BottomNavigationBarThemeData bottomNavigationBarTheme(BeThemeData betheme) =>
    BottomNavigationBarThemeData(
      elevation: 1,
      selectedLabelStyle: betheme.bestyle.titleSmall.copyWith(
        color: betheme.becolors.primary,
        fontSize: 14,
      ),
      unselectedLabelStyle: betheme.bestyle.titleSmall.copyWith(
        fontSize: 14,
      ),

      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
      // type: BottomNavigationBarType.shifting,
    );

BottomSheetThemeData bottomSheetTheme(BeThemeData betheme) =>
    BottomSheetThemeData(
      surfaceTintColor: BegoColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      backgroundColor: betheme.becolors.card,
      // elevation: 50,
      // modalElevation: 50,
      // constraints: const BoxConstraints(maxWidth: widthInfinity),
      dragHandleColor: betheme.becolors.accent,
      modalBackgroundColor: betheme.becolors.card,
      modalBarrierColor: betheme.becolors.accent.withAlpha(50),
      // showDragHandle: true,
    );

ButtonBarThemeData buttonBarTheme(BeThemeData betheme) =>
    const ButtonBarThemeData(
      buttonPadding: EdgeInsets.all(8),
      overflowDirection: VerticalDirection.down,
      buttonAlignedDropdown: true,
      mainAxisSize: MainAxisSize.min,

      // layoutBehavior: ButtonBarLayoutBehavior.padded,
    );

CardTheme cardTheme(BeThemeData betheme) => CardTheme(
      elevation: 0.5,
      color: betheme.becolors.lightInverse,
      surfaceTintColor: BegoColors.transparent,
      margin: EdgeInsets.zero,
      shadowColor: betheme.becolors.primary.withAlpha(150),
      shape: RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
      clipBehavior: Clip.antiAlias,
    );

ChipThemeData chipTheme(BeThemeData betheme) => ChipThemeData(
      shape:
          const RoundedRectangleBorder(borderRadius: BegoStyle.borderRadius8),
      side: BorderSide.none,
      // backgroundColor: betheme.becolors.primary.withAlpha(30),
      // brightness: Brightness.dark,
      surfaceTintColor: BegoColors.transparent,
      elevation: 0,
      pressElevation: 2,
      // padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

      labelStyle:
          betheme.bestyle.bodySmall.copyWith(color: betheme.becolors.text),
      labelPadding: EdgeInsets.zero,
      disabledColor: betheme.becolors.disabled,
      color: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return betheme.becolors.disabled;
        }
        return betheme.becolors.primary.withAlpha(20);
      }),
      // showCheckmark: true,
      selectedColor: betheme.becolors.primary,
      iconTheme: IconThemeData(color: betheme.becolors.text),
      padding: const EdgeInsets.only(
        top: 4,
        bottom: 4,
        left: 4,
        right: 4,
      ),

      // showCheckmark: true,
    );

DataTableThemeData dataTableTheme(BeThemeData betheme) => DataTableThemeData(
      dividerThickness: 1,
      // headingRowColor: MaterialStatePropertyAll(
      //   betheme.becolors.primary.withAlpha(30),
      // ),
      headingTextStyle:
          betheme.bestyle.titleSmall.copyWith(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: betheme.becolors.lightInverse,
        borderRadius: BegoStyle.borderRadius16,
      ),
    );

DatePickerThemeData datePickerTheme(BeThemeData betheme) => DatePickerThemeData(
      backgroundColor: betheme.becolors.lightInverse,
      surfaceTintColor: BegoColors.transparent,
    );

DialogTheme dialogTheme(BeThemeData betheme) => DialogTheme(
      backgroundColor: betheme.becolors.card,
      surfaceTintColor: BegoColors.transparent,
      elevation: 0,
      // alignment: Alignment.topCenter,
      actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      contentTextStyle: betheme.bestyle.bodyMedium,
      titleTextStyle: betheme.bestyle.headlineSmall,
      shape:
          const RoundedRectangleBorder(borderRadius: BegoStyle.borderRadius28),
    );

DividerThemeData dividerTheme(BeThemeData betheme) => DividerThemeData(
      color: betheme.becolors.accent.withAlpha(30),
      indent: 16,
      endIndent: 16,
      space: 1,
      thickness: 1,
    );

DrawerThemeData drawerTheme(BeThemeData betheme) => DrawerThemeData(
      elevation: 0,
      backgroundColor: betheme.becolors.lightInverse,
      endShape: const RoundedRectangleBorder(),
      scrimColor: betheme.becolors.accent.withAlpha(50),
      surfaceTintColor: BegoColors.transparent,
      shape: const RoundedRectangleBorder(),
      shadowColor: BegoColors.black,
    );

DropdownMenuThemeData dropdownMenuTheme(BeThemeData betheme) {
  final primary = betheme.becolors.primary;
  const radius = BorderRadius.all(Radius.circular(12.0));
  return DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: radius,
      ),
      alignLabelWithHint: true,
      enabledBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide.none,
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: betheme.becolors.error),
      ),
      outlineBorder: MaterialStateBorderSide.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(color: betheme.becolors.disabled);
        }
        return BorderSide(color: primary);
      }),
      errorStyle:
          betheme.bestyle.bodySmall.copyWith(color: betheme.becolors.error),
      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: betheme.becolors.error),
      ),
      focusColor: primary.withAlpha(20),
      fillColor: primary.withAlpha(10),
      suffixIconColor: betheme.becolors.accent,
      filled: true,
      // contentPadding: EdgeInsets.zero,
      errorMaxLines: 1,
      hintStyle: betheme.bestyle.titleMedium,
      hoverColor: primary.withAlpha(30),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      isCollapsed: true,
      activeIndicatorBorder: BorderSide(color: primary, width: 2),
      // contentPadding: EdgeInsets.zero,
    ),
    menuStyle: MenuStyle(
      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      // elevation: MaterialStatePropertyAll(0),
      shape: const MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BegoStyle.borderRadius8,
        ),
      ),
      side: MaterialStatePropertyAll(
        BorderSide(color: betheme.becolors.disabled),
      ),
    ),
    textStyle: betheme.bestyle.titleSmall.copyWith(
      color: betheme.becolors.accent,
    ),
  );
}

ExpansionTileThemeData expansionTileTheme(BeThemeData betheme) =>
    ExpansionTileThemeData(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      // expandedAlignment: Alignment.topCenter,
      collapsedIconColor: betheme.becolors.primary,
      backgroundColor: betheme.becolors.primary.withAlpha(5),
      textColor: betheme.becolors.text,
      clipBehavior: Clip.hardEdge,

      collapsedBackgroundColor: betheme.becolors.lightInverse,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
      iconColor: betheme.becolors.accent,
    );

FilledButtonThemeData filledButtonTheme(BeThemeData betheme) =>
    FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonFilledForegroundColor(betheme),
        surfaceTintColor:
            const MaterialStatePropertyAll(BegoColors.transparent),
        backgroundColor: buttonFilledBackgroundColor(betheme),
        minimumSize: const MaterialStatePropertyAll(Size(100, 48)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: betheme.bestyle.borderRadius,
          ),
        ),

        textStyle: MaterialStatePropertyAll(
          betheme.bestyle.labelMedium.copyWith(color: betheme.becolors.primary),
        ),
        shadowColor: MaterialStatePropertyAll(betheme.becolors.primary),
        elevation: const MaterialStatePropertyAll(0),
        // side: elvatedSideBorder(betheme),
      ),
    );

FloatingActionButtonThemeData floatingActionButtonTheme(BeThemeData betheme) =>
    FloatingActionButtonThemeData(
      backgroundColor: betheme.becolors.accent,
      extendedTextStyle: MaterialStateTextStyle.resolveWith(
        (states) => betheme.bestyle.labelMedium,
      ),
      extendedPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      disabledElevation: 0,
      focusElevation: 8,
      extendedIconLabelSpacing: 8,
      hoverElevation: 6,
      iconSize: 20,
      largeSizeConstraints: const BoxConstraints(
        maxWidth: 72,
        maxHeight: 72,
        minHeight: 64,
        minWidth: 64,
      ),
      sizeConstraints: const BoxConstraints(
        maxWidth: 64,
        maxHeight: 64,
        minHeight: 46,
        minWidth: 46,
      ),
      smallSizeConstraints: const BoxConstraints(
        maxWidth: 46,
        maxHeight: 46,
        minHeight: 32,
        minWidth: 32,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
      ),
      foregroundColor: betheme.becolors.lightInverse,
      extendedSizeConstraints: const BoxConstraints(),
    );

IconButtonThemeData iconButtonTheme(BeThemeData betheme) => IconButtonThemeData(
      style: IconButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
        elevation: 0,
        // side: const BorderSide(),
        foregroundColor: betheme.becolors.accent,

        // visualDensity: VisualDensity.standard,
        // backgroundColor: betheme.becolors.primary.withAlpha(50),
      ),
    );

ListTileThemeData listTileTheme(BeThemeData betheme) => ListTileThemeData(
      selectedColor: betheme.becolors.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      tileColor: BegoColors.transparent,
      // dense: true,
      selectedTileColor: betheme.becolors.primary.withAlpha(20),
      // tileColor: Colors.green,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      horizontalTitleGap: 4,
      leadingAndTrailingTextStyle: MaterialStateTextStyle.resolveWith(
        (states) => betheme.bestyle.bodySmall,
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: betheme.bestyle.borderRadius,
      // ),
      // style: ListTileStyle.drawer
      // textColor: betheme.becolors.text,
      subtitleTextStyle: MaterialStateTextStyle.resolveWith(
        (states) => betheme.bestyle.bodySmall,
      ),
      titleTextStyle: MaterialStateTextStyle.resolveWith(
        (states) => betheme.bestyle.titleSmall,
      ),

      // dense: true,

      textColor: betheme.becolors.text,
      visualDensity: VisualDensity.comfortable,
    );

MenuBarThemeData menuBarTheme(BeThemeData betheme) => const MenuBarThemeData(
      style: MenuStyle(
        // backgroundColor: MaterialStatePropertyAll(BegoColors.transparent),
        surfaceTintColor: MaterialStatePropertyAll(BegoColors.transparent),
        padding: MaterialStatePropertyAll(EdgeInsets.zero),
      ),
    );

MenuButtonThemeData menuButtonTheme(BeThemeData betheme) => MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.any(interactiveSelectionStates.contains)) {
            return betheme.becolors.primary.withAlpha(10);
          }
        }),
        shape: MaterialStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: betheme.bestyle.xsRadius,
          ),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
      ),
    );

MenuThemeData menuTheme(BeThemeData betheme) => MenuThemeData(
      style: MenuStyle(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        // elevation: MaterialStatePropertyAll(0),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BegoStyle.borderRadius8,
          ),
        ),
        side: MaterialStatePropertyAll(
          BorderSide(color: betheme.becolors.disabled),
        ),
      ),
    );

NavigationBarThemeData navigationBarTheme(BeThemeData betheme) =>
    NavigationBarThemeData(
      backgroundColor: betheme.becolors.primary.withAlpha(10),
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(size: 20, color: betheme.becolors.primary);
          }
          return IconThemeData(size: 20, color: betheme.becolors.accent);
        },
      ),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
        side: BorderSide(color: betheme.becolors.primary.withAlpha(10)),
      ),
      surfaceTintColor: BegoColors.transparent,
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return betheme.bestyle.labelSmall.copyWith(
            color: betheme.becolors.primary,
          );
        }
        return betheme.bestyle.labelSmall;
      }),
      shadowColor: BegoColors.transparent,
    );

NavigationDrawerThemeData navigationDrawerTheme(BeThemeData betheme) =>
    NavigationDrawerThemeData(
      elevation: 0,
      backgroundColor: betheme.becolors.primary,
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: betheme.becolors.primary, size: 20);
        }
        return const IconThemeData(size: 20);
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
      ),
      labelTextStyle: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return betheme.bestyle.labelMedium
              .copyWith(color: betheme.becolors.primary);
        }
        return betheme.bestyle.labelMedium;
      }),
      tileHeight: 48,
      surfaceTintColor: BegoColors.transparent,
    );

NavigationRailThemeData navigationRailTheme(BeThemeData betheme) =>
    NavigationRailThemeData(
      backgroundColor:
          ColorUtils.getShade(betheme.becolors.primary, value: 0.5),
      elevation: 0,
      indicatorShape: const RoundedRectangleBorder(
        borderRadius: BegoStyle.borderRadius12,
      ),
      groupAlignment: 3,
      labelType: NavigationRailLabelType.selected,
      indicatorColor: betheme.becolors.primary.withAlpha(80),
      selectedIconTheme: IconThemeData(
        color: betheme.becolors.primary,
        grade: 10,
        size: 24,
      ),
      minWidth: 0,
      unselectedLabelTextStyle: betheme.bestyle.labelSmall.copyWith(),
      selectedLabelTextStyle: betheme.bestyle.labelSmall.copyWith(
        color: betheme.becolors.primary,
        fontWeight: FontWeight.bold,
      ),
    );

ElevatedButtonThemeData elevatedButtonTheme(BeThemeData betheme) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonForegroundColor(betheme),
        surfaceTintColor:
            const MaterialStatePropertyAll(BegoColors.transparent),
        backgroundColor: buttonBackgroundColor(betheme),
        minimumSize: const MaterialStatePropertyAll(Size(100, 48)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: betheme.bestyle.borderRadius,
          ),
        ),
        textStyle: buttonTextStyle(betheme),
        shadowColor: MaterialStatePropertyAll(betheme.becolors.primary),
        elevation: elevationInteraction(),
        side: elvatedSideBorder(betheme),
      ),
    );

ButtonThemeData buttonTheme(BeThemeData betheme) => ButtonThemeData(
      buttonColor: betheme.becolors.primary,
      shape: RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
      height: 48,
      // textTheme: ButtonTextTheme.accent,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
    );

OutlinedButtonThemeData outlinedButtonTheme(BeThemeData betheme) =>
    OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: primaryOrDisableColor(betheme),
        minimumSize: const MaterialStatePropertyAll(Size(100, 48)),
        shape: roundRectShape(betheme),
        elevation: const MaterialStatePropertyAll(0),
        side: outlineSideBorder(betheme),
        overlayColor: const MaterialStatePropertyAll(BegoColors.transparent),
        textStyle: buttonTextStyle(betheme),
      ),
    );

PopupMenuThemeData popupMenuTheme(BeThemeData betheme) => PopupMenuThemeData(
      surfaceTintColor: BegoColors.transparent,
      elevation: 10,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
        side: BorderSide(color: betheme.becolors.overlayOutline),
      ),
      enableFeedback: false,
      textStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.bestyle.titleSmall
              .copyWith(color: betheme.becolors.primary);
        }
        //   //
        return betheme.bestyle.titleSmall;
      }),
      labelTextStyle: MaterialStateTextStyle.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.bestyle.titleSmall
              .copyWith(color: betheme.becolors.primary);
        }
        //   //
        return betheme.bestyle.titleSmall;
      }),
      shadowColor: BegoColors.gray50,

      // color: Colors.amber,
    );

ProgressIndicatorThemeData progressIndicatorTheme(BeThemeData betheme) =>
    const ProgressIndicatorThemeData(
      linearMinHeight: 2,
      // circularTrackColor: withAlpha,
    );

SearchBarThemeData searchBarTheme(BeThemeData betheme) => SearchBarThemeData(
      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      overlayColor:
          MaterialStatePropertyAll(betheme.becolors.primary.withAlpha(20)),
      elevation: const MaterialStatePropertyAll(0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: betheme.bestyle.borderRadius),
      ),
      padding: const MaterialStatePropertyAll(
        EdgeInsets.only(left: 8, right: 8),
      ),
      surfaceTintColor: const MaterialStatePropertyAll(BegoColors.transparent),
      textStyle: MaterialStatePropertyAll(betheme.bestyle.labelMedium),
      hintStyle: MaterialStatePropertyAll(betheme.bestyle.labelMedium),
      backgroundColor:
          MaterialStatePropertyAll(betheme.becolors.formInputBackground),
      side: inputSideBorder(betheme),
    );

SearchViewThemeData searchViewTheme(BeThemeData betheme) => SearchViewThemeData(
      // backgroundColor: betheme.becolors.lightInverse,
      elevation: 1,
      dividerColor: BegoColors.transparent,
      headerHintStyle: betheme.bestyle.labelMedium,
      headerTextStyle: betheme.bestyle.labelMedium,
      surfaceTintColor: BegoColors.transparent,
      backgroundColor: BegoColors.pink50,
      shape: RoundedRectangleBorder(
        borderRadius: betheme.bestyle.borderRadius,
        side: BorderSide(color: betheme.becolors.overlayOutline),
      ),
      side: BorderSide(
        width: 1,
        color: betheme.becolors.primary.withAlpha(20),
      ),
    );

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
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) => betheme.becolors.primary,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BegoStyle.borderRadius28,
          ),
        ),
        side: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.focused)) {
              return BorderSide(color: betheme.becolors.accent);
            }
            return BorderSide(
              color: betheme.becolors.primary.withAlpha(50),
              width: 1,
            );
          },
        ),
        // overlayColor: MaterialStateProperty.all(Colors.green),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        ),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return betheme.becolors.primary.withAlpha(50);
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
