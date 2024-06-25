import 'dart:io' show Platform;

import 'package:bego_ui/bego_icon.dart';
import 'package:bego_ui/bego_ui.dart';
import 'package:bego_ui/src/animations/be_shared_axis_transition.dart';
import 'package:bego_ui/src/themes/style/material_state_property.dart';
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
        borderRadius: betheme.style.xsRadius,
      ),
    );

SwitchThemeData switchTheme(BeThemeData betheme) => SwitchThemeData(
      trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
      trackOutlineWidth: const WidgetStatePropertyAll(0),
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
      activeTrackColor: betheme.colors.primary,
      inactiveTrackColor: betheme.colors.disabled,
      disabledInactiveTrackColor: betheme.colors.disabled,
      disabledActiveTrackColor: betheme.colors.disabled,
      disabledThumbColor: betheme.colors.disabled,
      overlayColor: betheme.colors.intraction,
      trackHeight: 2,
      minThumbSeparation: 3,

      // overlayShape: SliderComponentShape.noOverlay,
    );

// bool applyElevationOverlayColor(BeThemeData betheme) => false;

PageTransitionsTheme pageTransitionsTheme(BeThemeData betheme) =>
    const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
        TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
          transitionType: SharedAxisTransitionType.horizontal,
        ),
      },
    );

ScrollbarThemeData scrollbarTheme(BeThemeData betheme) => ScrollbarThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.colors.accent;
        }
        return betheme.colors.accent.withAlpha(150);
      }),
      // interactive: false,
      thickness: WidgetStateProperty.resolveWith((states) {
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

IconThemeData iconTheme(BeThemeData betheme) => IconThemeData(
      size: 20,
      color: betheme.colors.icon,
    );

IconThemeData primaryIconTheme(BeThemeData betheme) => const IconThemeData();

ActionIconThemeData actionIconTheme(BeThemeData betheme) => ActionIconThemeData(
      backButtonIconBuilder: (context) => const Icon(
        Icons.arrow_back_ios_new_outlined,
        // BegoIcons.icon_close,
        size: 20,
      ),
      closeButtonIconBuilder: (context) => const Icon(BeIcons.icon_close),
    );

// https://flutter.github.io/assets-for-api-docs/assets/material/app_bar.png
AppBarTheme appBarTheme(BeThemeData betheme) => AppBarTheme(
      surfaceTintColor: BegoColors.transparent,
      backgroundColor: betheme.colors.scaffoldBackground,
      shadowColor: BegoColors.gray100,
      scrolledUnderElevation: 0.5,
      titleSpacing: 16,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: betheme.style.titleMedium.copyWith(
        fontWeight: FontWeight.bold,
        // leadingDistribution: TextLeadingDistribution.even,
        overflow: TextOverflow.ellipsis,
      ),
      toolbarTextStyle: betheme.style.bodySmall,
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
      backgroundColor: betheme.colors.accent,
      // largeSize: 1,
      // smallSize: 2,
      alignment: Alignment.topRight,
      // offset: const Offset(-10, 0),
      textStyle: TextStyle(
        color: betheme.colors.lightInverse,
        fontSize: 10,
        letterSpacing: 1,
      ),
      padding: EdgeInsets.zero,
    );

MaterialBannerThemeData bannerTheme(BeThemeData betheme) =>
    MaterialBannerThemeData(
      backgroundColor: betheme.colors.accent,
      contentTextStyle: betheme.style.bodySmall.copyWith(
        color: betheme.colors.lightInverse,
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
      //     borderRadius: betheme.style.borderRadius,
      //     side: const BorderSide(color: Colors.green),
      //   ),
      //   RoundedRectangleBorder(
      //     borderRadius: betheme.style.borderRadius,
      //     side: const BorderSide(color: Colors.green),
      //   ),
      // ),
      elevation: 1,
      padding: p16,
      shadowColor: betheme.colors.accent,
      surfaceTintColor: BegoColors.transparent,
    );

BottomNavigationBarThemeData bottomNavigationBarTheme(BeThemeData betheme) =>
    BottomNavigationBarThemeData(
      elevation: 1,
      selectedLabelStyle: betheme.style.titleSmall.copyWith(
        color: betheme.colors.primary,
        fontSize: 14,
      ),
      unselectedLabelStyle: betheme.style.titleSmall.copyWith(
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
      backgroundColor: betheme.colors.card,
      // elevation: 50,
      // modalElevation: 50,
      // constraints: const BoxConstraints(maxWidth: widthInfinity),
      dragHandleColor: betheme.colors.accent,
      modalBackgroundColor: betheme.colors.card,
      modalBarrierColor: betheme.colors.accent.withAlpha(50),
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
      color: betheme.colors.lightInverse,
      surfaceTintColor: BegoColors.transparent,
      margin: EdgeInsets.zero,
      shadowColor: betheme.colors.primary.withAlpha(150),
      shape: RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
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

      labelStyle: betheme.style.bodySmall.copyWith(color: betheme.colors.text),
      labelPadding: EdgeInsets.zero,
      disabledColor: betheme.colors.disabled,
      color: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return betheme.colors.disabled;
        }
        return betheme.colors.primary.withAlpha(20);
      }),
      // showCheckmark: true,
      selectedColor: betheme.colors.primary,
      iconTheme: IconThemeData(color: betheme.colors.text),
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
          betheme.style.titleSmall.copyWith(fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        color: betheme.colors.lightInverse,
        borderRadius: BegoStyle.borderRadius16,
      ),
    );

DatePickerThemeData datePickerTheme(BeThemeData betheme) => DatePickerThemeData(
      backgroundColor: betheme.colors.lightInverse,
      surfaceTintColor: BegoColors.transparent,
    );

DialogTheme dialogTheme(BeThemeData betheme) => DialogTheme(
      backgroundColor: betheme.colors.card,
      surfaceTintColor: BegoColors.transparent,
      elevation: 0,
      // alignment: Alignment.topCenter,
      actionsPadding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
      contentTextStyle: betheme.style.bodyMedium,
      titleTextStyle: betheme.style.headlineSmall,
      shape:
          const RoundedRectangleBorder(borderRadius: BegoStyle.borderRadius28),
    );

DividerThemeData dividerTheme(BeThemeData betheme) => DividerThemeData(
      color: betheme.colors.accent.withAlpha(30),
      indent: 12,
      endIndent: 12,
      space: 1,
      thickness: 1,
    );

DrawerThemeData drawerTheme(BeThemeData betheme) => DrawerThemeData(
      elevation: 0,
      backgroundColor: betheme.colors.lightInverse,
      endShape: const RoundedRectangleBorder(),
      scrimColor: betheme.colors.accent.withAlpha(50),
      surfaceTintColor: BegoColors.transparent,
      shape: const RoundedRectangleBorder(),
      shadowColor: BegoColors.black,
    );

DropdownMenuThemeData dropdownMenuTheme(BeThemeData betheme) {
  final primary = betheme.colors.primary;
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
        borderSide: BorderSide(color: betheme.colors.error),
      ),
      outlineBorder: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return BorderSide(color: betheme.colors.disabled);
        }
        return BorderSide(color: primary);
      }),
      errorStyle: betheme.style.bodySmall.copyWith(color: betheme.colors.error),
      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(color: betheme.colors.error),
      ),
      focusColor: primary.withAlpha(20),
      fillColor: primary.withAlpha(10),
      suffixIconColor: betheme.colors.accent,
      filled: true,
      // contentPadding: EdgeInsets.zero,
      errorMaxLines: 1,
      hintStyle: betheme.style.titleMedium,
      hoverColor: primary.withAlpha(30),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      isCollapsed: true,
      activeIndicatorBorder: BorderSide(color: primary, width: 2),
      // contentPadding: EdgeInsets.zero,
    ),
    menuStyle: MenuStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      // elevation: MaterialStatePropertyAll(0),
      shape: const WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BegoStyle.borderRadius8,
        ),
      ),
      side: WidgetStatePropertyAll(
        BorderSide(color: betheme.colors.disabled),
      ),
    ),
    textStyle: betheme.style.titleSmall.copyWith(
      color: betheme.colors.accent,
    ),
  );
}

ExpansionTileThemeData expansionTileTheme(BeThemeData betheme) =>
    ExpansionTileThemeData(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      // expandedAlignment: Alignment.topCenter,
      collapsedIconColor: betheme.colors.primary,
      backgroundColor: betheme.colors.primary.withAlpha(5),
      textColor: betheme.colors.text,
      clipBehavior: Clip.hardEdge,

      collapsedBackgroundColor: betheme.colors.lightInverse,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
      collapsedShape:
          RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
      iconColor: betheme.colors.accent,
    );

FilledButtonThemeData filledButtonTheme(BeThemeData betheme) =>
    FilledButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonFilledForegroundColor(betheme),
        surfaceTintColor: const WidgetStatePropertyAll(BegoColors.transparent),
        backgroundColor: buttonFilledBackgroundColor(betheme),
        minimumSize: const WidgetStatePropertyAll(Size(100, 48)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: betheme.style.borderRadius,
          ),
        ),

        textStyle: WidgetStatePropertyAll(
          betheme.style.labelMedium.copyWith(color: betheme.colors.primary),
        ),
        // shadowColor: MaterialStatePropertyAll(betheme.colors.primary),
        elevation: const WidgetStatePropertyAll(0),
        // side: elvatedSideBorder(betheme),
      ),
    );

FloatingActionButtonThemeData floatingActionButtonTheme(BeThemeData betheme) =>
    FloatingActionButtonThemeData(
      backgroundColor: betheme.colors.accent,
      extendedTextStyle: WidgetStateTextStyle.resolveWith(
        (states) => betheme.style.labelMedium,
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
        borderRadius: betheme.style.borderRadius,
      ),
      foregroundColor: betheme.colors.lightInverse,
      extendedSizeConstraints: const BoxConstraints(),
    );

IconButtonThemeData iconButtonTheme(BeThemeData betheme) => IconButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
        ),
        foregroundColor: iconButtonForegroundColor(betheme),
        textStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.white)),
        iconColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return betheme.colors.disabled;
            }
            if (states.any(interactiveSelectionStates.contains)) {
              return betheme.colors.accent;
            }
            return betheme.colors.primary;
          },
        ),
        iconSize: WidgetStateProperty.resolveWith((states) {
          if (states.any(interactiveSelectionStates.contains)) {
            return 20;
          }
          return 20;
        }),
      ),
    );

ListTileThemeData listTileTheme(BeThemeData betheme) => ListTileThemeData(
      selectedColor: betheme.colors.primary,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      tileColor: BegoColors.transparent,
      // dense: true,
      selectedTileColor: betheme.colors.primary.withAlpha(20),
      // tileColor: Colors.green,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      horizontalTitleGap: 4,
      leadingAndTrailingTextStyle: WidgetStateTextStyle.resolveWith(
        (states) => betheme.style.bodySmall,
      ),
      // shape: RoundedRectangleBorder(
      //   borderRadius: betheme.style.borderRadius,
      // ),
      // style: ListTileStyle.drawer
      // textColor: betheme.becolors.text,
      subtitleTextStyle: WidgetStateTextStyle.resolveWith(
        (states) => betheme.style.bodySmall,
      ),
      titleTextStyle: WidgetStateTextStyle.resolveWith(
        (states) => betheme.style.titleSmall,
      ),

      // dense: true,

      textColor: betheme.colors.text,
      visualDensity: VisualDensity.comfortable,
    );

MenuBarThemeData menuBarTheme(BeThemeData betheme) => const MenuBarThemeData(
      style: MenuStyle(
        // backgroundColor: MaterialStatePropertyAll(BegoColors.transparent),
        surfaceTintColor: WidgetStatePropertyAll(BegoColors.transparent),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
    );

MenuButtonThemeData menuButtonTheme(BeThemeData betheme) => MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.any(interactiveSelectionStates.contains)) {
            return betheme.colors.primary.withAlpha(10);
          }
        }),
        shape: WidgetStateProperty.resolveWith(
          (states) => RoundedRectangleBorder(
            borderRadius: betheme.style.xsRadius,
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
      ),
    );

MenuThemeData menuTheme(BeThemeData betheme) => MenuThemeData(
      style: MenuStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        // elevation: MaterialStatePropertyAll(0),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BegoStyle.borderRadius8,
          ),
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: betheme.colors.disabled),
        ),
      ),
    );

NavigationBarThemeData navigationBarTheme(BeThemeData betheme) =>
    NavigationBarThemeData(
      backgroundColor: betheme.colors.primary.withAlpha(10),
      elevation: 0,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(size: 20, color: betheme.colors.primary);
          }
          return IconThemeData(size: 20, color: betheme.colors.accent);
        },
      ),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
        side: BorderSide(color: betheme.colors.primary.withAlpha(10)),
      ),
      surfaceTintColor: BegoColors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return betheme.style.labelSmall.copyWith(
            color: betheme.colors.primary,
          );
        }
        return betheme.style.labelSmall;
      }),
      shadowColor: BegoColors.transparent,
    );

NavigationDrawerThemeData navigationDrawerTheme(BeThemeData betheme) =>
    NavigationDrawerThemeData(
      elevation: 0,
      backgroundColor: betheme.colors.primary,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: betheme.colors.primary, size: 20);
        }
        return const IconThemeData(size: 20);
      }),
      indicatorShape: RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
      ),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return betheme.style.labelMedium
              .copyWith(color: betheme.colors.primary);
        }
        return betheme.style.labelMedium;
      }),
      tileHeight: 48,
      surfaceTintColor: BegoColors.transparent,
    );

NavigationRailThemeData navigationRailTheme(BeThemeData betheme) =>
    NavigationRailThemeData(
      backgroundColor: ColorUtils.getShade(betheme.colors.primary, value: 0.5),
      elevation: 0,
      indicatorShape: const RoundedRectangleBorder(
        borderRadius: BegoStyle.borderRadius12,
      ),
      groupAlignment: 3,
      labelType: NavigationRailLabelType.selected,
      indicatorColor: betheme.colors.primary.withAlpha(80),
      selectedIconTheme: IconThemeData(
        color: betheme.colors.primary,
        grade: 10,
        size: 24,
      ),
      minWidth: 0,
      unselectedLabelTextStyle: betheme.style.labelSmall.copyWith(),
      selectedLabelTextStyle: betheme.style.labelSmall.copyWith(
        color: betheme.colors.primary,
        fontWeight: FontWeight.bold,
      ),
    );

ElevatedButtonThemeData elevatedButtonTheme(BeThemeData betheme) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: buttonForegroundColor(betheme),
        surfaceTintColor: const WidgetStatePropertyAll(BegoColors.transparent),
        backgroundColor: buttonBackgroundColor(betheme),
        minimumSize: const WidgetStatePropertyAll(Size(100, 48)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: betheme.style.borderRadius,
          ),
        ),
        textStyle: buttonTextStyle(betheme),
        shadowColor: WidgetStatePropertyAll(betheme.colors.primary),
        elevation: elevationInteraction(),
        side: elvatedSideBorder(betheme),
      ),
    );

ButtonThemeData buttonTheme(BeThemeData betheme) => ButtonThemeData(
      buttonColor: betheme.colors.primary,
      shape: RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
      height: 48,
      // textTheme: ButtonTextTheme.accent,
      layoutBehavior: ButtonBarLayoutBehavior.constrained,
    );

OutlinedButtonThemeData outlinedButtonTheme(BeThemeData betheme) =>
    OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: primaryOrDisableColor(betheme),
        minimumSize: const WidgetStatePropertyAll(Size(100, 48)),
        shape: roundRectShape(betheme),
        elevation: const WidgetStatePropertyAll(0),
        side: outlineSideBorder(betheme),
        overlayColor: const WidgetStatePropertyAll(BegoColors.transparent),
        textStyle: buttonTextStyle(betheme),
      ),
    );

PopupMenuThemeData popupMenuTheme(BeThemeData betheme) => PopupMenuThemeData(
      surfaceTintColor: BegoColors.transparent,
      elevation: 10,
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
        side: BorderSide(color: betheme.colors.overlayOutline),
      ),
      enableFeedback: false,
      textStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.style.titleSmall
              .copyWith(color: betheme.colors.primary);
        }
        //   //
        return betheme.style.titleSmall;
      }),
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.any(interactiveSelectionStates.contains)) {
          return betheme.style.titleSmall
              .copyWith(color: betheme.colors.primary);
        }
        //   //
        return betheme.style.titleSmall;
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
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      overlayColor:
          WidgetStatePropertyAll(betheme.colors.primary.withAlpha(20)),
      elevation: const WidgetStatePropertyAll(0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: betheme.style.borderRadius),
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.only(left: 8, right: 8),
      ),
      surfaceTintColor: const WidgetStatePropertyAll(BegoColors.transparent),
      textStyle: WidgetStatePropertyAll(betheme.style.labelMedium),
      hintStyle: WidgetStatePropertyAll(betheme.style.labelMedium),
      backgroundColor:
          WidgetStatePropertyAll(betheme.colors.formInputBackground),
      side: inputSideBorder(betheme),
    );

SearchViewThemeData searchViewTheme(BeThemeData betheme) => SearchViewThemeData(
      // backgroundColor: betheme.becolors.lightInverse,
      elevation: 1,
      dividerColor: BegoColors.transparent,
      headerHintStyle: betheme.style.labelMedium,
      headerTextStyle: betheme.style.labelMedium,
      surfaceTintColor: BegoColors.transparent,
      backgroundColor: BegoColors.pink50,
      shape: RoundedRectangleBorder(
        borderRadius: betheme.style.borderRadius,
        side: BorderSide(color: betheme.colors.overlayOutline),
      ),
      side: BorderSide(
        width: 1,
        color: betheme.colors.primary.withAlpha(20),
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
        iconSize: const WidgetStatePropertyAll(16),

        textStyle: WidgetStatePropertyAll(betheme.style.labelMedium),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) => betheme.colors.primary,
        ),
        shape: WidgetStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BegoStyle.borderRadius28,
          ),
        ),
        side: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.focused)) {
              return BorderSide(color: betheme.colors.accent);
            }
            return BorderSide(
              color: betheme.colors.primary.withAlpha(50),
              width: 1,
            );
          },
        ),
        // overlayColor: MaterialStateProperty.all(Colors.green),
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return betheme.colors.primary.withAlpha(50);
          }
          return null;
        }),
      ),
    );

SnackBarThemeData snackBarTheme(BeThemeData betheme) => SnackBarThemeData(
      backgroundColor: betheme.colors.accent,
      contentTextStyle:
          betheme.style.bodySmall.copyWith(color: betheme.colors.lightInverse),
    );

TabBarTheme tabBarTheme(BeThemeData betheme) => TabBarTheme(
      unselectedLabelColor: betheme.colors.accent,
      // indicatorSize: TabBarIndicatorSize.tab,
      tabAlignment: TabAlignment.fill,
      // labelPadding: EdgeInsets.zero,
    );

TextButtonThemeData textButtonTheme(BeThemeData betheme) => TextButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: betheme.style.borderRadius,
        ),
        minimumSize: const Size(100, 48),
      ),
    );

TextSelectionThemeData textSelectionTheme(BeThemeData betheme) =>
    TextSelectionThemeData(
      // cursorColor: betheme.becolors.accent,
      selectionColor: betheme.colors.highlight.withAlpha(50),
      // selectionHandleColor: Colors.blue,
    );

TimePickerThemeData timePickerTheme(BeThemeData betheme) => TimePickerThemeData(
      // backgroundColor: Colors.white,
      dialBackgroundColor: betheme.colors.lightInverse,
      elevation: 0,
      backgroundColor: betheme.colors.card,
      helpTextStyle: betheme.style.titleMedium,
      dialHandColor: betheme.colors.primary,
      hourMinuteTextColor: betheme.colors.primary,
      hourMinuteShape: const RoundedRectangleBorder(
        // side: BorderSide.,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );

ToggleButtonsThemeData toggleButtonsTheme(BeThemeData betheme) {
  final color = betheme.colors.primary.withAlpha(50);
  return ToggleButtonsThemeData(
    hoverColor: BegoColors.black.withAlpha(20),
    borderRadius: betheme.style.radius40,
    fillColor: color,
    borderColor: color,
    color: betheme.colors.text,
    constraints: const BoxConstraints(minHeight: 40, minWidth: 0),
    borderWidth: 1,
    selectedBorderColor: color,
    disabledBorderColor: betheme.colors.disabled,
    selectedColor: betheme.colors.primary,
    textStyle: betheme.style.labelMedium,
    disabledColor: betheme.colors.disabled,
    splashColor: betheme.colors.accent.withAlpha(20),
    // focusColor: betheme.becolors.primary.withAlpha(10),
  );
}

TooltipThemeData tooltipTheme(BeThemeData betheme) => TooltipThemeData(
      decoration: BoxDecoration(
        color: betheme.colors.accent,
        borderRadius: betheme.style.xsRadius,
        boxShadow: BegoShadows.boxShadow5,
      ),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 0,
      textStyle: betheme.style.bodySmall.copyWith(
        color: betheme.colors.colorScheme.onPrimary,
      ),
      excludeFromSemantics: true,
      preferBelow: false,
    );
