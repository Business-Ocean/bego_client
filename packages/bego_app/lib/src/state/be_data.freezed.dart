// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'be_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeData<T> {
  T? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(int code, T? data) empty,
    required TResult Function(T? data, String title, String message, int code)
        error,
    required TResult Function(T data, int code) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(int code, T? data)? empty,
    TResult? Function(T? data, String title, String message, int code)? error,
    TResult? Function(T data, int code)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(int code, T? data)? empty,
    TResult Function(T? data, String title, String message, int code)? error,
    TResult Function(T data, int code)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(BeError<T> value) error,
    required TResult Function(BeSuccess<T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(BeError<T> value)? error,
    TResult? Function(BeSuccess<T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(BeError<T> value)? error,
    TResult Function(BeSuccess<T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeDataCopyWith<T, $Res> {
  factory $BeDataCopyWith(BeData<T> value, $Res Function(BeData<T>) then) =
      _$BeDataCopyWithImpl<T, $Res, BeData<T>>;
}

/// @nodoc
class _$BeDataCopyWithImpl<T, $Res, $Val extends BeData<T>>
    implements $BeDataCopyWith<T, $Res> {
  _$BeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res>
    extends _$BeDataCopyWithImpl<T, $Res, _$_Loading<T>>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_Loading<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Loading<T> implements _Loading<T> {
  const _$_Loading([this.data]);

  @override
  final T? data;

  @override
  String toString() {
    return 'BeData<$T>.loading(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      __$$_LoadingCopyWithImpl<T, _$_Loading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(int code, T? data) empty,
    required TResult Function(T? data, String title, String message, int code)
        error,
    required TResult Function(T data, int code) success,
  }) {
    return loading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(int code, T? data)? empty,
    TResult? Function(T? data, String title, String message, int code)? error,
    TResult? Function(T data, int code)? success,
  }) {
    return loading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(int code, T? data)? empty,
    TResult Function(T? data, String title, String message, int code)? error,
    TResult Function(T data, int code)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(BeError<T> value) error,
    required TResult Function(BeSuccess<T> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(BeError<T> value)? error,
    TResult? Function(BeSuccess<T> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(BeError<T> value)? error,
    TResult Function(BeSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements BeData<T> {
  const factory _Loading([final T? data]) = _$_Loading<T>;

  @override
  T? get data;
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyCopyWith<T, $Res> {
  factory _$$_EmptyCopyWith(
          _$_Empty<T> value, $Res Function(_$_Empty<T>) then) =
      __$$_EmptyCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int code, T? data});
}

/// @nodoc
class __$$_EmptyCopyWithImpl<T, $Res>
    extends _$BeDataCopyWithImpl<T, $Res, _$_Empty<T>>
    implements _$$_EmptyCopyWith<T, $Res> {
  __$$_EmptyCopyWithImpl(_$_Empty<T> _value, $Res Function(_$_Empty<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$_Empty<T>(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Empty<T> implements _Empty<T> {
  const _$_Empty([this.code = -1, this.data]);

  @override
  @JsonKey()
  final int code;
  @override
  final T? data;

  @override
  String toString() {
    return 'BeData<$T>.empty(code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Empty<T> &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      __$$_EmptyCopyWithImpl<T, _$_Empty<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(int code, T? data) empty,
    required TResult Function(T? data, String title, String message, int code)
        error,
    required TResult Function(T data, int code) success,
  }) {
    return empty(code, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(int code, T? data)? empty,
    TResult? Function(T? data, String title, String message, int code)? error,
    TResult? Function(T data, int code)? success,
  }) {
    return empty?.call(code, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(int code, T? data)? empty,
    TResult Function(T? data, String title, String message, int code)? error,
    TResult Function(T data, int code)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(code, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(BeError<T> value) error,
    required TResult Function(BeSuccess<T> value) success,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(BeError<T> value)? error,
    TResult? Function(BeSuccess<T> value)? success,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(BeError<T> value)? error,
    TResult Function(BeSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements BeData<T> {
  const factory _Empty([final int code, final T? data]) = _$_Empty<T>;

  int get code;
  @override
  T? get data;
  @JsonKey(ignore: true)
  _$$_EmptyCopyWith<T, _$_Empty<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeErrorCopyWith<T, $Res> {
  factory _$$BeErrorCopyWith(
          _$BeError<T> value, $Res Function(_$BeError<T>) then) =
      __$$BeErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data, String title, String message, int code});
}

/// @nodoc
class __$$BeErrorCopyWithImpl<T, $Res>
    extends _$BeDataCopyWithImpl<T, $Res, _$BeError<T>>
    implements _$$BeErrorCopyWith<T, $Res> {
  __$$BeErrorCopyWithImpl(
      _$BeError<T> _value, $Res Function(_$BeError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? title = null,
    Object? message = null,
    Object? code = null,
  }) {
    return _then(_$BeError<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BeError<T> implements BeError<T> {
  const _$BeError(this.data,
      {this.title = defaultTitle,
      this.message = defaultMessage,
      this.code = 500});

  @override
  final T? data;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final int code;

  @override
  String toString() {
    return 'BeData<$T>.error(data: $data, title: $title, message: $message, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeError<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), title, message, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeErrorCopyWith<T, _$BeError<T>> get copyWith =>
      __$$BeErrorCopyWithImpl<T, _$BeError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(int code, T? data) empty,
    required TResult Function(T? data, String title, String message, int code)
        error,
    required TResult Function(T data, int code) success,
  }) {
    return error(data, title, message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(int code, T? data)? empty,
    TResult? Function(T? data, String title, String message, int code)? error,
    TResult? Function(T data, int code)? success,
  }) {
    return error?.call(data, title, message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(int code, T? data)? empty,
    TResult Function(T? data, String title, String message, int code)? error,
    TResult Function(T data, int code)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, title, message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(BeError<T> value) error,
    required TResult Function(BeSuccess<T> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(BeError<T> value)? error,
    TResult? Function(BeSuccess<T> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(BeError<T> value)? error,
    TResult Function(BeSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BeError<T> implements BeData<T> {
  const factory BeError(final T? data,
      {final String title,
      final String message,
      final int code}) = _$BeError<T>;

  @override
  T? get data;
  String get title;
  String get message;
  int get code;
  @JsonKey(ignore: true)
  _$$BeErrorCopyWith<T, _$BeError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BeSuccessCopyWith<T, $Res> {
  factory _$$BeSuccessCopyWith(
          _$BeSuccess<T> value, $Res Function(_$BeSuccess<T>) then) =
      __$$BeSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data, int code});
}

/// @nodoc
class __$$BeSuccessCopyWithImpl<T, $Res>
    extends _$BeDataCopyWithImpl<T, $Res, _$BeSuccess<T>>
    implements _$$BeSuccessCopyWith<T, $Res> {
  __$$BeSuccessCopyWithImpl(
      _$BeSuccess<T> _value, $Res Function(_$BeSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? code = null,
  }) {
    return _then(_$BeSuccess<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BeSuccess<T> implements BeSuccess<T> {
  const _$BeSuccess(this.data, {this.code = 200});

  @override
  final T data;
  @override
  @JsonKey()
  final int code;

  @override
  String toString() {
    return 'BeData<$T>.success(data: $data, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BeSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data), code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BeSuccessCopyWith<T, _$BeSuccess<T>> get copyWith =>
      __$$BeSuccessCopyWithImpl<T, _$BeSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? data) loading,
    required TResult Function(int code, T? data) empty,
    required TResult Function(T? data, String title, String message, int code)
        error,
    required TResult Function(T data, int code) success,
  }) {
    return success(data, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(T? data)? loading,
    TResult? Function(int code, T? data)? empty,
    TResult? Function(T? data, String title, String message, int code)? error,
    TResult? Function(T data, int code)? success,
  }) {
    return success?.call(data, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? data)? loading,
    TResult Function(int code, T? data)? empty,
    TResult Function(T? data, String title, String message, int code)? error,
    TResult Function(T data, int code)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Empty<T> value) empty,
    required TResult Function(BeError<T> value) error,
    required TResult Function(BeSuccess<T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading<T> value)? loading,
    TResult? Function(_Empty<T> value)? empty,
    TResult? Function(BeError<T> value)? error,
    TResult? Function(BeSuccess<T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Empty<T> value)? empty,
    TResult Function(BeError<T> value)? error,
    TResult Function(BeSuccess<T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BeSuccess<T> implements BeData<T> {
  const factory BeSuccess(final T data, {final int code}) = _$BeSuccess<T>;

  @override
  T get data;
  int get code;
  @JsonKey(ignore: true)
  _$$BeSuccessCopyWith<T, _$BeSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
