import 'package:intl/intl.dart';

/// Date format utilites class.
class BeDateFormatUtil {
  /// Format date to `dd MMM, yyyy` format.
  static String standard(DateTime value) =>
      DateFormat('dd MMM, yyyy').format(value);

  /// Format date to `dd MMM, yyyy hh:mm a` format.
  static String standardWithHour(DateTime value) =>
      DateFormat('dd MMM, yyyy hh:mm a').format(value);

  /// Format date to `E dd MMM, yyyy` format.
  static String full(DateTime value) =>
      DateFormat('E dd MMM, yyyy').format(value);

  /// Format date to `E dd MMM, yyyy hh:mm a` format.
  static String fullWithHour(DateTime value) =>
      DateFormat('E dd MMM, yyyy hh:mm a').format(value);

  /// Format date to `dd/MM/yyyy` format.
  static String compact(DateTime value) =>
      DateFormat('dd/MM/yyyy').format(value);

  /// Format date to `dd/MM/yyyy hh:mm a` format.
  static String compactWithHour(DateTime value) =>
      DateFormat('dd/MM/yyyy hh:mm a').format(value);
}

/// Number format utilities class.
class BeNumberFormatUtil {
  /// Format number with separator.
  static String integer(num number) => NumberFormat('#,###').format(number);

  /// Format number with separator and decimal.
  static String currency(num number) => NumberFormat('#,###.##').format(number);
}
