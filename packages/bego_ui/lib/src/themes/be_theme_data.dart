import 'package:bego_ui/src/themes/be_colors.dart';
import 'package:bego_ui/src/themes/be_style.dart';
import 'package:bego_ui/src/themes/style/be_colors_dark.dart';
import 'package:bego_ui/src/themes/style/be_colors_light.dart';
import 'package:bego_ui/src/themes/style/be_style_dark.dart';
import 'package:bego_ui/src/themes/style/be_style_light.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'be_theme_data.freezed.dart';

/// [BeThemeData] used for maintaining theme for ui components
///
@freezed
sealed class BeThemeData with _$BeThemeData {
  const BeThemeData._();

  const factory BeThemeData.light({
    @Default(BeStyleLight()) BeStyle style,
    @Default(BeColorsLight()) BeColors colors,
  }) = _BeLightTheme;

  const factory BeThemeData.dark({
    @Default(BeStyleDark()) BeStyle style,
    @Default(BeColorsDark()) BeColors colors,
  }) = _BeDarkTheme;

  bool get isDark => colors.isDark;

  @override
  BeStyle get style;

  @override
  BeColors get colors;

  // @override
  // BeEdgeInsets get beinsets;
}
