// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'package:uibook/widgets/buttons/button.dart';
import 'package:uibook/widgets/colors/colors.dart';
import 'package:uibook/widgets/dialog/backdropblur.dart';
import 'package:uibook/widgets/elevation/elevations.dart';
import 'package:uibook/widgets/icons/icons.dart';
import 'package:uibook/widgets/notification/badge.dart';
import 'package:uibook/widgets/notification/notification.dart';
import 'package:uibook/widgets/texts/typography.dart';
import 'package:widgetbook/widgetbook.dart';

final directories = <WidgetbookNode>[
  WidgetbookFolder(
    name: 'icon',
    children: [
      WidgetbookComponent(
        name: 'BegoIcons',
        useCases: [
          WidgetbookUseCase(
            name: 'Icons',
            builder: (context) => displayIconsUseCase(context),
          ),
        ],
      ),
    ],
  ),
  WidgetbookFolder(
    name: 'widgets',
    children: [
      WidgetbookFolder(
        name: 'notice',
        children: [
          WidgetbookComponent(
            name: 'BeBadge',
            useCases: [
              WidgetbookUseCase(
                name: 'BeBadge',
                builder: (context) => displayBeBadgeUseCase(context),
              ),
            ],
          ),
        ],
      ),
      WidgetbookFolder(
        name: 'text',
        children: [
          WidgetbookComponent(
            name: 'BeText',
            useCases: [
              WidgetbookUseCase(
                name: 'Elevation',
                builder: (context) => displayElevationUseCase(context),
              ),
              WidgetbookUseCase(
                name: 'Typography',
                builder: (context) => displayTypographyUseCase(context),
              ),
              WidgetbookUseCase(
                name: 'Colors & Utils',
                builder: (context) => displayColorsUseCase(context),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  WidgetbookFolder(
    name: 'material',
    children: [
      WidgetbookComponent(
        name: 'ElevatedButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Buttons',
            builder: (context) => authButtonsDefaultUseCase(context),
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'Dialog',
        useCases: [
          WidgetbookUseCase(
            name: 'Notification',
            builder: (context) => displayNotificationUseCase(context),
          ),
          WidgetbookUseCase(
            name: 'Backdrop Blur',
            builder: (context) => displayBackdropUseCase(context),
          ),
        ],
      ),
    ],
  ),
];
