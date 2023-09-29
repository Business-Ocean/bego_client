import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class BeDeviceInfo {
  const BeDeviceInfo._();
  static Future<String?> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      // import 'dart:io'
      final iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    }
    if (Platform.isAndroid) {
      final androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }

    if (Platform.isLinux) {
      final androidDeviceInfo = await deviceInfo.linuxInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
    if (Platform.isWindows) {
      final androidDeviceInfo = await deviceInfo.windowsInfo;
      return androidDeviceInfo.deviceId; // unique ID on Android
    }

    // final browserInfo = await deviceInfo.webBrowserInfo;
  }

  // static String? getOrgDomain() {
  //   final deviceInfo = DeviceInfoPlugin();
  // }
}
