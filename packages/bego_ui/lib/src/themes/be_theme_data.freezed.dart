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
  BeStyle get bestyle => throw _privateConstructorUsedError;
  BeColors get becolors => throw _privateConstructorUsedError;
  BeEdgeInsets get beinsets => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        light,
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        dark,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
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
  $Res call({BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets});
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
    Object? bestyle = null,
    Object? becolors = null,
    Object? beinsets = null,
  }) {
    return _then(_value.copyWith(
      bestyle: null == bestyle
          ? _value.bestyle
          : bestyle // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      becolors: null == becolors
          ? _value.becolors
          : becolors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      beinsets: null == beinsets
          ? _value.beinsets
          : beinsets // ignore: cast_nullable_to_non_nullable
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
  $Res call({BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets});
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
    Object? bestyle = null,
    Object? becolors = null,
    Object? beinsets = null,
  }) {
    return _then(_$_BeLightTheme(
      bestyle: null == bestyle
          ? _value.bestyle
          : bestyle // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      becolors: null == becolors
          ? _value.becolors
          : becolors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      beinsets: null == beinsets
          ? _value.beinsets
          : beinsets // ignore: cast_nullable_to_non_nullable
              as BeEdgeInsets,
    ));
  }
}

/// @nodoc

class _$_BeLightTheme extends _BeLightTheme {
  const _$_BeLightTheme(
      {this.bestyle = const BeStyleLight(),
      this.becolors = const BeColorsLight(),
      this.beinsets = const BeInsetsMobile()})
      : super._();

  @override
  @JsonKey()
  final BeStyle bestyle;
  @override
  @JsonKey()
  final BeColors becolors;
  @override
  @JsonKey()
  final BeEdgeInsets beinsets;

  @override
  String toString() {
    return 'BeThemeData.light(bestyle: $bestyle, becolors: $becolors, beinsets: $beinsets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeLightTheme &&
            (identical(other.bestyle, bestyle) || other.bestyle == bestyle) &&
            (identical(other.becolors, becolors) ||
                other.becolors == becolors) &&
            (identical(other.beinsets, beinsets) ||
                other.beinsets == beinsets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bestyle, becolors, beinsets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeLightThemeCopyWith<_$_BeLightTheme> get copyWith =>
      __$$_BeLightThemeCopyWithImpl<_$_BeLightTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        light,
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        dark,
  }) {
    return light(bestyle, becolors, beinsets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        dark,
  }) {
    return light?.call(bestyle, becolors, beinsets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        dark,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(bestyle, becolors, beinsets);
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
      {final BeStyle bestyle,
      final BeColors becolors,
      final BeEdgeInsets beinsets}) = _$_BeLightTheme;
  const _BeLightTheme._() : super._();

  @override
  BeStyle get bestyle;
  @override
  BeColors get becolors;
  @override
  BeEdgeInsets get beinsets;
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
  $Res call({BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets});
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
    Object? bestyle = null,
    Object? becolors = null,
    Object? beinsets = null,
  }) {
    return _then(_$_BeDarkTheme(
      bestyle: null == bestyle
          ? _value.bestyle
          : bestyle // ignore: cast_nullable_to_non_nullable
              as BeStyle,
      becolors: null == becolors
          ? _value.becolors
          : becolors // ignore: cast_nullable_to_non_nullable
              as BeColors,
      beinsets: null == beinsets
          ? _value.beinsets
          : beinsets // ignore: cast_nullable_to_non_nullable
              as BeEdgeInsets,
    ));
  }
}

/// @nodoc

class _$_BeDarkTheme extends _BeDarkTheme {
  const _$_BeDarkTheme(
      {this.bestyle = const BeStyleDark(),
      this.becolors = const BeColorsDark(),
      this.beinsets = const BeInsetsMobile()})
      : super._();

  @override
  @JsonKey()
  final BeStyle bestyle;
  @override
  @JsonKey()
  final BeColors becolors;
  @override
  @JsonKey()
  final BeEdgeInsets beinsets;

  @override
  String toString() {
    return 'BeThemeData.dark(bestyle: $bestyle, becolors: $becolors, beinsets: $beinsets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeDarkTheme &&
            (identical(other.bestyle, bestyle) || other.bestyle == bestyle) &&
            (identical(other.becolors, becolors) ||
                other.becolors == becolors) &&
            (identical(other.beinsets, beinsets) ||
                other.beinsets == beinsets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bestyle, becolors, beinsets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeDarkThemeCopyWith<_$_BeDarkTheme> get copyWith =>
      __$$_BeDarkThemeCopyWithImpl<_$_BeDarkTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        light,
    required TResult Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)
        dark,
  }) {
    return dark(bestyle, becolors, beinsets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult? Function(
            BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        dark,
  }) {
    return dark?.call(bestyle, becolors, beinsets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        light,
    TResult Function(BeStyle bestyle, BeColors becolors, BeEdgeInsets beinsets)?
        dark,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(bestyle, becolors, beinsets);
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
      {final BeStyle bestyle,
      final BeColors becolors,
      final BeEdgeInsets beinsets}) = _$_BeDarkTheme;
  const _BeDarkTheme._() : super._();

  @override
  BeStyle get bestyle;
  @override
  BeColors get becolors;
  @override
  BeEdgeInsets get beinsets;
  @override
  @JsonKey(ignore: true)
  _$$_BeDarkThemeCopyWith<_$_BeDarkTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
