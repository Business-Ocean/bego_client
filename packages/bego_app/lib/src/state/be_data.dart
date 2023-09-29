import 'package:freezed_annotation/freezed_annotation.dart';

part 'be_data.freezed.dart';

/// BeData is the generic State of the view. view loading and empty is called
/// by BaseController and [T] holds the data.
/// Note: Use [freezed](https://pub.dev/packages/freezed) package for creating
/// immutable class. Immutable class help to improved performance of flutter
/// Widget As per doc Flutter team promotes StatelessWidget over StatefullWidget
@Freezed(genericArgumentFactories: true)
abstract class BeData<T> with _$BeData<T> {
  const factory BeData.loading([T? data]) = _Loading;
  const factory BeData.empty([@Default(-1) int code, T? data]) = _Empty;

  const factory BeData.error(
    T? data, {
    @Default(defaultTitle) String title,
    @Default(defaultMessage) String message,
    @Default(500) int code,
  }) = BeError;

  const factory BeData.success(T data, {@Default(200) int code}) = BeSuccess;

  @override
  T? get data;
}

const defaultTitle = 'Oops! Something went wrong!';
const defaultMessage = 'The application has encountered an unknown error.'
    ' We are looking into it.';
