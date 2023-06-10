import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

extension Target on Platform {
  bool isAndroid() => Platform.isAndroid;

  bool isIOS() => Platform.isIOS;

  bool isLinux() => Platform.isLinux;

  bool isWindows() => Platform.isWindows;

  bool isMacOS() => Platform.isMacOS;

  bool isWeb() => kIsWeb;
}
