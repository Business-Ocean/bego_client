// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:uibook/widgets/buttons/button.dart' as _i8;
import 'package:uibook/widgets/colors/colors.dart' as _i13;
import 'package:uibook/widgets/common/common.dart' as _i2;
import 'package:uibook/widgets/default/default.dart' as _i9;
import 'package:uibook/widgets/dialog/backdropblur.dart' as _i6;
import 'package:uibook/widgets/elevation/elevations.dart' as _i14;
import 'package:uibook/widgets/helper/after_layout.dart' as _i3;
import 'package:uibook/widgets/helper/color_utils.dart' as _i4;
import 'package:uibook/widgets/icons/icons.dart' as _i5;
import 'package:uibook/widgets/notification/badge.dart' as _i11;
import 'package:uibook/widgets/notification/notification.dart' as _i7;
import 'package:uibook/widgets/popup/popbutton.dart' as _i10;
import 'package:uibook/widgets/texts/text.dart' as _i12;
import 'package:uibook/widgets/texts/typography.dart' as _i15;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'common',
    children: [
      _i1.WidgetbookComponent(
        name: 'BeCommon',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'common widget cases',
            builder: _i2.displayCommonWidgetCased,
          )
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'helper',
    children: [
      _i1.WidgetbookComponent(
        name: 'AfterLayout',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'After Layout State Helper',
            builder: _i3.afterLayoutMixin,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ColorUtils',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Color Utils',
            builder: _i4.colorUtils,
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
            builder: _i5.displayIconsUseCase,
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
            builder: _i6.displayBackdropUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Notification',
            builder: _i7.displayNotificationUseCase,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'ElevatedButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Buttons',
            builder: _i8.authButtonsDefaultUseCase,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'Material',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Material Default Widget',
            builder: _i9.defaultWidgets,
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'menu',
    children: [
      _i1.WidgetbookComponent(
        name: 'BePopupMenuButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'BePopupMenuButton',
            builder: _i10.displayBePopupMenuButtonUseCase,
          )
        ],
      )
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
            builder: _i11.displayBeBadgeUseCase,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'BeLabel',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'BeLabel',
            builder: _i11.displayBeLabelUseCase,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'BeMultiBadge',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'BeMultiBadge',
            builder: _i11.displayBeMultiBadgeUseCase,
          )
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'BeMultiLabel',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'BeMultiLabel',
            builder: _i11.displayBeMultiLabelUseCase,
          )
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'text',
    children: [
      _i1.WidgetbookComponent(
        name: 'BeText',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Be Animated Text',
            builder: _i12.displayAnimatedTextUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Colors & Utils',
            builder: _i13.displayColorsUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Elevation',
            builder: _i14.displayElevationUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Typography',
            builder: _i15.displayTypographyUseCase,
          ),
        ],
      )
    ],
  ),
];
