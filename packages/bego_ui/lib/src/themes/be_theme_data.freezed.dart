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
  BeStyle get style => throw _privateConstructorUsedError;
  BeColors get colors => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeStyle style, BeColors colors) light,
    required TResult Function(BeStyle style, BeColors colors) dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeStyle style, BeColors colors)? light,
    TResult? Function(BeStyle style, BeColors colors)? dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle style, BeColors colors)? light,
    TResult Function(BeStyle style, BeColors colors)? dark,
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
  $Res call({BeStyle style, BeColors colors});
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
    Object? style = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as BeColors,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BeLightThemeImplCopyWith<$Res>
    implements $BeThemeDataCopyWith<$Res> {
  factory _$$BeLightThemeImplCopyWith(
          _$BeLightThemeImpl value, $Res Function(_$BeLightThemeImpl) then) =
      __$$BeLightThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeStyle style, BeColors colors});
}

/// @nodoc
class __$$BeLightThemeImplCopyWithImpl<$Res>
    extends _$BeThemeDataCopyWithImpl<$Res, _$BeLightThemeImpl>
    implements _$$BeLightThemeImplCopyWith<$Res> {
  __$$BeLightThemeImplCopyWithImpl(
      _$BeLightThemeImpl _value, $Res Function(_$BeLightThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? colors = null,
  }) {
    return _then(_$BeLightThemeImpl(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as BeColors,
    ));
  }
}

/// @nodoc

class _$BeLightThemeImpl extends _BeLightTheme {
  const _$BeLightThemeImpl(
      {this.style = const BeStyleLight(), this.colors = const BeColorsLight()})
      : super._();

  @override
  @JsonKey()
  final BeStyle style;
  @override
  @JsonKey()
  final BeColors colors;

  @override
  String toString() {
    return 'BeThemeData.light(style: $style, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeLightThemeImpl &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, style, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeLightThemeImplCopyWith<_$BeLightThemeImpl> get copyWith =>
      __$$BeLightThemeImplCopyWithImpl<_$BeLightThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeStyle style, BeColors colors) light,
    required TResult Function(BeStyle style, BeColors colors) dark,
  }) {
    return light(style, colors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeStyle style, BeColors colors)? light,
    TResult? Function(BeStyle style, BeColors colors)? dark,
  }) {
    return light?.call(style, colors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle style, BeColors colors)? light,
    TResult Function(BeStyle style, BeColors colors)? dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(style, colors);
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
  const factory _BeLightTheme({final BeStyle style, final BeColors colors}) =
      _$BeLightThemeImpl;
  const _BeLightTheme._() : super._();

  @override
  BeStyle get style;
  @override
  BeColors get colors;
  @override
  @JsonKey(ignore: true)
  _$$BeLightThemeImplCopyWith<_$BeLightThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeDarkThemeImplCopyWith<$Res>
    implements $BeThemeDataCopyWith<$Res> {
  factory _$$BeDarkThemeImplCopyWith(
          _$BeDarkThemeImpl value, $Res Function(_$BeDarkThemeImpl) then) =
      __$$BeDarkThemeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeStyle style, BeColors colors});
}

/// @nodoc
class __$$BeDarkThemeImplCopyWithImpl<$Res>
    extends _$BeThemeDataCopyWithImpl<$Res, _$BeDarkThemeImpl>
    implements _$$BeDarkThemeImplCopyWith<$Res> {
  __$$BeDarkThemeImplCopyWithImpl(
      _$BeDarkThemeImpl _value, $Res Function(_$BeDarkThemeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? colors = null,
  }) {
    return _then(_$BeDarkThemeImpl(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as BeColors,
    ));
  }
}

/// @nodoc

class _$BeDarkThemeImpl extends _BeDarkTheme {
  const _$BeDarkThemeImpl(
      {this.style = const BeStyleDark(), this.colors = const BeColorsDark()})
      : super._();

  @override
  @JsonKey()
  final BeStyle style;
  @override
  @JsonKey()
  final BeColors colors;

  @override
  String toString() {
    return 'BeThemeData.dark(style: $style, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeDarkThemeImpl &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @override
  int get hashCode => Object.hash(runtimeType, style, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeDarkThemeImplCopyWith<_$BeDarkThemeImpl> get copyWith =>
      __$$BeDarkThemeImplCopyWithImpl<_$BeDarkThemeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BeStyle style, BeColors colors) light,
    required TResult Function(BeStyle style, BeColors colors) dark,
  }) {
    return dark(style, colors);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BeStyle style, BeColors colors)? light,
    TResult? Function(BeStyle style, BeColors colors)? dark,
  }) {
    return dark?.call(style, colors);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle style, BeColors colors)? light,
    TResult Function(BeStyle style, BeColors colors)? dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(style, colors);
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
  const factory _BeDarkTheme({final BeStyle style, final BeColors colors}) =
      _$BeDarkThemeImpl;
  const _BeDarkTheme._() : super._();

  @override
  BeStyle get style;
  @override
  BeColors get colors;
  @override
  @JsonKey(ignore: true)
  _$$BeDarkThemeImplCopyWith<_$BeDarkThemeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
