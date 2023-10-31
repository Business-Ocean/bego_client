// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:uibook/widgets/buttons/button.dart' as _i7;
import 'package:uibook/widgets/colors/colors.dart' as _i9;
import 'package:uibook/widgets/dialog/backdropblur.dart' as _i5;
import 'package:uibook/widgets/elevation/elevations.dart' as _i10;
import 'package:uibook/widgets/helper/after_layout.dart' as _i2;
import 'package:uibook/widgets/helper/color_utils.dart' as _i3;
import 'package:uibook/widgets/icons/icons.dart' as _i4;
import 'package:uibook/widgets/notification/badge.dart' as _i8;
import 'package:uibook/widgets/notification/notification.dart' as _i6;
import 'package:uibook/widgets/texts/typography.dart' as _i11;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'helper',
    children: [
      _i1.WidgetbookComponent(
        name: 'AfterLayout',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'After Layout State Helper',
            builder: _i2.afterLayoutMixin,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ColorUtils',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Color Utils',
            builder: _i3.colorUtils,
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'icon',
    children: [
      _i1.WidgetbookComponent(
        name: 'BeIcons',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Icons',
            builder: _i4.displayIconsUseCase,
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'material',
    children: [
      _i1.WidgetbookComponent(
        name: 'Dialog',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Backdrop Blur',
            builder: _i5.displayBackdropUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Notification',
            builder: _i6.displayNotificationUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ElevatedButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Buttons',
            builder: _i7.authButtonsDefaultUseCase,
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'notice',
    children: [
      _i1.WidgetbookComponent(
        name: 'BeBadge',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'BeBadge',
            builder: _i8.displayBeBadgeUseCase,
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'text',
    children: [
      _i1.WidgetbookComponent(
        name: 'BeText',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Colors & Utils',
            builder: _i9.displayColorsUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Elevation',
            builder: _i10.displayElevationUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Typography',
            builder: _i11.displayTypographyUseCase,
          ),
        ],
      )
    ],
  ),
];
