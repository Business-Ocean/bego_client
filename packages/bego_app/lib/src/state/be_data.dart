import 'package:freezed_annotation/freezed_annotation.dart';

part 'be_data.freezed.dart';

/// BeData is the generic State of the view. view loading and empty is called
/// by BaseController and [T] holds the data.
/// Note: Use [freezed](https://pub.dev/packages/freezed) package for creating
/// immutable class. Immutable class help to improved performance of flutter
/// Widget As per doc Flutter team promotes StatelessWidget over StatefullWidget
@Freezed()
abstract class BeData<T> with _$BeData<T> {
  // Loading State
  const factory BeData.loading({
    T? data,
  }) = _Loading;

  // Empty State
  const factory BeData.empty({
    @Default(0) int code,
    T? data,
  }) = _Empty;

  // Loading State
  const factory BeData.error({
    T? data,
    @Default(defaultErrorTitle) String title,
    @Default(defaultErrorMessage) String message,
    @Default(500) int code,
  }) = BeError;

  // Loading State
  const factory BeData.success({
    @Default(200) int code,
    required T data,
  }) = BeSuccess;

  @override
  T? get data;
}

const defaultErrorTitle = 'Oops! Something went wrong!';
const defaultErrorMessage = 'The application has encountered an unknown error.'
    ' We are looking into it.';
