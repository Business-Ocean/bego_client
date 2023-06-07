// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'be_theme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeThemeData {
  BeStyle get slStyles => throw _privateConstructorUsedError;
  BeColors get slColors => throw _privateConstructorUsedError;
  BeEdgeInsets get slInsets => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        light,
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BeLightTheme value) light,
    required TResult Function(_BeDarkTheme value) dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BeLightTheme value)? light,
    TResult? Function(_BeDarkTheme value)? dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BeLightTheme value)? light,
    TResult Function(_BeDarkTheme value)? dark,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeThemeDataCopyWith<BeThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeThemeDataCopyWith<$Res> {
  factory $BeThemeDataCopyWith(
          BeThemeData value, $Res Function(BeThemeData) then) =
      _$BeThemeDataCopyWithImpl<$Res, BeThemeData>;
  @useResult
  $Res call({BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets});
}

/// @nodoc
class _$BeThemeDataCopyWithImpl<$Res, $Val extends BeThemeData>
    implements $BeThemeDataCopyWith<$Res> {
  _$BeThemeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slStyles = null,
    Object? slColors = null,
    Object? slInsets = null,
  }) {
    return _then(_value.copyWith(
      slStyles: null == slStyles
          ? _value.slStyles
          : slStyles // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      slColors: null == slColors
          ? _value.slColors
          : slColors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      slInsets: null == slInsets
          ? _value.slInsets
          : slInsets // ignore: cast_nullable_to_non_nullable
              as BeEdgeInsets,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeLightThemeCopyWith<$Res>
    implements $BeThemeDataCopyWith<$Res> {
  factory _$$_BeLightThemeCopyWith(
          _$_BeLightTheme value, $Res Function(_$_BeLightTheme) then) =
      __$$_BeLightThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets});
}

/// @nodoc
class __$$_BeLightThemeCopyWithImpl<$Res>
    extends _$BeThemeDataCopyWithImpl<$Res, _$_BeLightTheme>
    implements _$$_BeLightThemeCopyWith<$Res> {
  __$$_BeLightThemeCopyWithImpl(
      _$_BeLightTheme _value, $Res Function(_$_BeLightTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slStyles = null,
    Object? slColors = null,
    Object? slInsets = null,
  }) {
    return _then(_$_BeLightTheme(
      slStyles: null == slStyles
          ? _value.slStyles
          : slStyles // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      slColors: null == slColors
          ? _value.slColors
          : slColors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      slInsets: null == slInsets
          ? _value.slInsets
          : slInsets // ignore: cast_nullable_to_non_nullable
              as BeEdgeInsets,
    ));
  }
}

/// @nodoc

class _$_BeLightTheme extends _BeLightTheme {
  const _$_BeLightTheme(
      {this.slStyles = const BeStyleLight(),
      this.slColors = const BeColorsLight(),
      this.slInsets = const BeInsetsMobile()})
      : super._();

  @override
  @JsonKey()
  final BeStyle slStyles;
  @override
  @JsonKey()
  final BeColors slColors;
  @override
  @JsonKey()
  final BeEdgeInsets slInsets;

  @override
  String toString() {
    return 'BeThemeData.light(slStyles: $slStyles, slColors: $slColors, slInsets: $slInsets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeLightTheme &&
            (identical(other.slStyles, slStyles) ||
                other.slStyles == slStyles) &&
            (identical(other.slColors, slColors) ||
                other.slColors == slColors) &&
            (identical(other.slInsets, slInsets) ||
                other.slInsets == slInsets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slStyles, slColors, slInsets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeLightThemeCopyWith<_$_BeLightTheme> get copyWith =>
      __$$_BeLightThemeCopyWithImpl<_$_BeLightTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        light,
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        dark,
  }) {
    return light(slStyles, slColors, slInsets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
  }) {
    return light?.call(slStyles, slColors, slInsets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(slStyles, slColors, slInsets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BeLightTheme value) light,
    required TResult Function(_BeDarkTheme value) dark,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BeLightTheme value)? light,
    TResult? Function(_BeDarkTheme value)? dark,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BeLightTheme value)? light,
    TResult Function(_BeDarkTheme value)? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class _BeLightTheme extends BeThemeData {
  const factory _BeLightTheme(
      {final BeStyle slStyles,
      final BeColors slColors,
      final BeEdgeInsets slInsets}) = _$_BeLightTheme;
  const _BeLightTheme._() : super._();

  @override
  BeStyle get slStyles;
  @override
  BeColors get slColors;
  @override
  BeEdgeInsets get slInsets;
  @override
  @JsonKey(ignore: true)
  _$$_BeLightThemeCopyWith<_$_BeLightTheme> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BeDarkThemeCopyWith<$Res>
    implements $BeThemeDataCopyWith<$Res> {
  factory _$$_BeDarkThemeCopyWith(
          _$_BeDarkTheme value, $Res Function(_$_BeDarkTheme) then) =
      __$$_BeDarkThemeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets});
}

/// @nodoc
class __$$_BeDarkThemeCopyWithImpl<$Res>
    extends _$BeThemeDataCopyWithImpl<$Res, _$_BeDarkTheme>
    implements _$$_BeDarkThemeCopyWith<$Res> {
  __$$_BeDarkThemeCopyWithImpl(
      _$_BeDarkTheme _value, $Res Function(_$_BeDarkTheme) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slStyles = null,
    Object? slColors = null,
    Object? slInsets = null,
  }) {
    return _then(_$_BeDarkTheme(
      slStyles: null == slStyles
          ? _value.slStyles
          : slStyles // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      slColors: null == slColors
          ? _value.slColors
          : slColors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      slInsets: null == slInsets
          ? _value.slInsets
          : slInsets // ignore: cast_nullable_to_non_nullable
              as BeEdgeInsets,
    ));
  }
}

/// @nodoc

class _$_BeDarkTheme extends _BeDarkTheme {
  const _$_BeDarkTheme(
      {this.slStyles = const BeStyleDark(),
      this.slColors = const BeColorsDark(),
      this.slInsets = const BeInsetsMobile()})
      : super._();

  @override
  @JsonKey()
  final BeStyle slStyles;
  @override
  @JsonKey()
  final BeColors slColors;
  @override
  @JsonKey()
  final BeEdgeInsets slInsets;

  @override
  String toString() {
    return 'BeThemeData.dark(slStyles: $slStyles, slColors: $slColors, slInsets: $slInsets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeDarkTheme &&
            (identical(other.slStyles, slStyles) ||
                other.slStyles == slStyles) &&
            (identical(other.slColors, slColors) ||
                other.slColors == slColors) &&
            (identical(other.slInsets, slInsets) ||
                other.slInsets == slInsets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slStyles, slColors, slInsets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeDarkThemeCopyWith<_$_BeDarkTheme> get copyWith =>
      __$$_BeDarkThemeCopyWithImpl<_$_BeDarkTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        light,
    required TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)
        dark,
  }) {
    return dark(slStyles, slColors, slInsets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult? Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
  }) {
    return dark?.call(slStyles, slColors, slInsets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        light,
    TResult Function(
            BeStyle slStyles, BeColors slColors, BeEdgeInsets slInsets)?
        dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(slStyles, slColors, slInsets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BeLightTheme value) light,
    required TResult Function(_BeDarkTheme value) dark,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BeLightTheme value)? light,
    TResult? Function(_BeDarkTheme value)? dark,
  }) {
    return dark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BeLightTheme value)? light,
    TResult Function(_BeDarkTheme value)? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class _BeDarkTheme extends BeThemeData {
  const factory _BeDarkTheme(
      {final BeStyle slStyles,
      final BeColors slColors,
      final BeEdgeInsets slInsets}) = _$_BeDarkTheme;
  const _BeDarkTheme._() : super._();

  @override
  BeStyle get slStyles;
  @override
  BeColors get slColors;
  @override
  BeEdgeInsets get slInsets;
  @override
  @JsonKey(ignore: true)
  _$$_BeDarkThemeCopyWith<_$_BeDarkTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
