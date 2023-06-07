import 'package:flutter/foundation.dart';

/// mixin method for logging any thing information similar to
/// ```javascript
///  console.log([String])
/// ```
/// example
/// ```
/// [Logger.write('TOLOG',isError=true)]
/// ```
/// isError = true if logged in case of [Exception]
mixin Logger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => debugPrint('** $text. isError: [$isError]'));
  }
}
