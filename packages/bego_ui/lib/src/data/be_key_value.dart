/// files contains key value pair class which will be used by ui component's
/// key is for server for request
/// value is for user diaplay fields
/// S -> String
/// I -> Integer
/// Display -> always integer
/// -1 sets default value or which don't come from
library;

abstract class BeKeyValue {
  BeKeyValue._(this.key, this.value, this.display);
  final dynamic key;
  final dynamic value;
  final String display;
}

/// [KeyValueIS]
/// [key] is Integer
/// [value] is String
/// [display] is String
class KeyValueIS implements BeKeyValue {
  KeyValueIS({required this.key, required this.value});
  @override
  final int key;

  @override
  final String? value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is KeyValueIS &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// [BeKeyValueSI]
/// [value] is Integer
/// [key] is String
/// [display] is String
class BeKeyValueSI implements BeKeyValue {
  BeKeyValueSI({required this.key, this.value = 0});
  @override
  final String key;

  @override
  final int value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKeyValueSI &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}

// /// [KeyValueII] Key is Integer and value is String
// class KeyValueII implements BeKeyValues {
//   KeyValueII({required this.key, this.value = 0});

//   @override
//   final int key;

//   @override
//   final int value;

//   @override
//   String get display => value.toString();
// }

/// [BeKeyValueSS] Key is Integer and value is String
class BeKeyValueSS implements BeKeyValue {
  BeKeyValueSS({required this.key, this.value = 'None'});

  @override
  final String key;

  @override
  final String value;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKeyValueSS &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// [BeKeyValueISS] Key is Integer and value is String
class BeKeyValueISS implements BeKeyValue {
  BeKeyValueISS({
    required this.key,
    required this.value,
    required this.otherValue,
  });

  @override
  final int key;

  @override
  final String value;

  final String otherValue;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKeyValueISS &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}

// /// [BeKeyValueIIS] Key is Integer and value is String
// class BeKeyValueIIS implements BeKeyValue {
//   BeKeyValueIIS({
//     required this.key,
//     required this.value,
//     required this.otherValue,
//   });

//   @override
//   final int key;

//   @override
//   final String value;

//   final String otherValue;

//   @override
//   String get display => value.toString();
// }

/// [BeKeyValueSSS] Key is Integer and value is String
class BeKeyValueSSS implements BeKeyValue {
  BeKeyValueSSS({
    required this.key,
    required this.value,
    required this.otherValue,
  });

  @override
  final String key;

  @override
  final String value;

  final String otherValue;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKeyValueSSS &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}

/// SSD - S=> key S=> value (display) D=>dynamic data (extra value)
/// [BeKeyValueSSD] Key is Integer and value is String
class BeKeyValueSSD implements BeKeyValue {
  BeKeyValueSSD({
    required this.key,
    required this.value,
    required this.extra,
  });

  @override
  final String key;

  @override
  final String value;

  final dynamic extra;

  @override
  String get display => value.toString();

  @override
  bool operator ==(Object other) =>
      other is BeKeyValueSSD &&
      other.runtimeType == runtimeType &&
      other.key == key;

  @override
  int get hashCode => key.hashCode;
}
