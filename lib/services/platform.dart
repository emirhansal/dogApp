import 'package:flutter/services.dart';

class PlatformVersion {
  static const platform = MethodChannel('platform_version');

  static Future<String> get androidVersion async {
    final String version = await platform.invokeMethod('getAndroidVersion');
    return version;
  }

  static Future<String> get iOSVersion async {
    final String version = await platform.invokeMethod('getIOSVersion');
    return version;
  }
}
