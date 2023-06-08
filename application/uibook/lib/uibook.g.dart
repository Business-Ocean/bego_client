// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

import 'dart:core';
import 'dart:math';
import 'dart:ui';
import 'package:bego_ui/src/common_widget.dart';
import 'package:bego_ui/src/themes/be_theme.dart';
import 'package:bego_ui/src/widgets/text/be_text_responsive.dart';
import 'package:bego_ui/src/widgets/text/be_text_type.dart';
import 'package:bego_ui/src/widgets/text/be_text_variant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/button_style.dart';
import 'package:flutter/src/material/button_style_button.dart';
import 'package:flutter/src/material/color_scheme.dart';
import 'package:flutter/src/material/constants.dart';
import 'package:flutter/src/material/elevated_button_theme.dart';
import 'package:flutter/src/material/ink_ripple.dart';
import 'package:flutter/src/material/ink_well.dart';
import 'package:flutter/src/material/material_state.dart';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter/widgets.dart';
import 'package:uibook/widgets/buttons/button.dart';
import 'package:uibook/widgets/colors/colors.dart';
import 'package:uibook/widgets/texts/typography.dart';
import 'package:widgetbook/widgetbook.dart';

final directories = [
  WidgetbookFolder(
    name: 'widgets',
    children: [
      WidgetbookFolder(
        name: 'text',
        children: [
          WidgetbookComponent(
            name: 'BeText',
            useCases: [
              WidgetbookUseCase(
                name: 'Typography',
                builder: (context) => displayTypographyUseCase(context),
              ),
              WidgetbookUseCase(
                name: 'Colors & Utils',
                builder: (context) => displayColorsUseCase(context),
              ),
            ],
            isInitiallyExpanded: true,
          ),
        ],
        isInitiallyExpanded: true,
      ),
    ],
    isInitiallyExpanded: true,
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
        isInitiallyExpanded: true,
      ),
    ],
    isInitiallyExpanded: true,
  ),
];
