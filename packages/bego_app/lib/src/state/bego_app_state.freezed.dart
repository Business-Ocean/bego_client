// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bego_app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BegoAppState {
  String get appName => throw _privateConstructorUsedError;
  String get packageName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BegoAppStateCopyWith<BegoAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BegoAppStateCopyWith<$Res> {
  factory $BegoAppStateCopyWith(
          BegoAppState value, $Res Function(BegoAppState) then) =
      _$BegoAppStateCopyWithImpl<$Res, BegoAppState>;
  @useResult
  $Res call({String appName, String packageName, String version});
}

/// @nodoc
class _$BegoAppStateCopyWithImpl<$Res, $Val extends BegoAppState>
    implements $BegoAppStateCopyWith<$Res> {
  _$BegoAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? packageName = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BegoAppStateCopyWith<$Res>
    implements $BegoAppStateCopyWith<$Res> {
  factory _$$_BegoAppStateCopyWith(
          _$_BegoAppState value, $Res Function(_$_BegoAppState) then) =
      __$$_BegoAppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, String packageName, String version});
}

/// @nodoc
class __$$_BegoAppStateCopyWithImpl<$Res>
    extends _$BegoAppStateCopyWithImpl<$Res, _$_BegoAppState>
    implements _$$_BegoAppStateCopyWith<$Res> {
  __$$_BegoAppStateCopyWithImpl(
      _$_BegoAppState _value, $Res Function(_$_BegoAppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? packageName = null,
    Object? version = null,
  }) {
    return _then(_$_BegoAppState(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BegoAppState with DiagnosticableTreeMixin implements _BegoAppState {
  const _$_BegoAppState(
      {required this.appName,
      required this.packageName,
      required this.version});

  @override
  final String appName;
  @override
  final String packageName;
  @override
  final String version;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BegoAppState(appName: $appName, packageName: $packageName, version: $version)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BegoAppState'))
      ..add(DiagnosticsProperty('appName', appName))
      ..add(DiagnosticsProperty('packageName', packageName))
      ..add(DiagnosticsProperty('version', version));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BegoAppState &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appName, packageName, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BegoAppStateCopyWith<_$_BegoAppState> get copyWith =>
      __$$_BegoAppStateCopyWithImpl<_$_BegoAppState>(this, _$identity);
}

abstract class _BegoAppState implements BegoAppState {
  const factory _BegoAppState(
      {required final String appName,
      required final String packageName,
      required final String version}) = _$_BegoAppState;

  @override
  String get appName;
  @override
  String get packageName;
  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$$_BegoAppStateCopyWith<_$_BegoAppState> get copyWith =>
      throw _privateConstructorUsedError;
}
