// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_sing_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInSignUpState {
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInSignUpStateCopyWith<SignInSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInSignUpStateCopyWith<$Res> {
  factory $SignInSignUpStateCopyWith(
          SignInSignUpState value, $Res Function(SignInSignUpState) then) =
      _$SignInSignUpStateCopyWithImpl<$Res, SignInSignUpState>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class _$SignInSignUpStateCopyWithImpl<$Res, $Val extends SignInSignUpState>
    implements $SignInSignUpStateCopyWith<$Res> {
  _$SignInSignUpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInSignUpStateCopyWith<$Res>
    implements $SignInSignUpStateCopyWith<$Res> {
  factory _$$_SignInSignUpStateCopyWith(_$_SignInSignUpState value,
          $Res Function(_$_SignInSignUpState) then) =
      __$$_SignInSignUpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$_SignInSignUpStateCopyWithImpl<$Res>
    extends _$SignInSignUpStateCopyWithImpl<$Res, _$_SignInSignUpState>
    implements _$$_SignInSignUpStateCopyWith<$Res> {
  __$$_SignInSignUpStateCopyWithImpl(
      _$_SignInSignUpState _value, $Res Function(_$_SignInSignUpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
  }) {
    return _then(_$_SignInSignUpState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInSignUpState implements _SignInSignUpState {
  const _$_SignInSignUpState({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'SignInSignUpState(title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInSignUpState &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInSignUpStateCopyWith<_$_SignInSignUpState> get copyWith =>
      __$$_SignInSignUpStateCopyWithImpl<_$_SignInSignUpState>(
          this, _$identity);
}

abstract class _SignInSignUpState implements SignInSignUpState {
  const factory _SignInSignUpState({required final String title}) =
      _$_SignInSignUpState;

  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_SignInSignUpStateCopyWith<_$_SignInSignUpState> get copyWith =>
      throw _privateConstructorUsedError;
}
