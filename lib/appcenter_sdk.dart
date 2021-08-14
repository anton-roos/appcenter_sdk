import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final _methodChannel = MethodChannel('appcenter_sdk');

class AppCenter {
  static Future startAsync({
    required String appSecret,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await _methodChannel.invokeMethod('start', <String, dynamic>{
      'secret': appSecret.trim(),
    });
  }

  static Future trackEventAsync(String name,
      [Map<String, String>? properties]) async {
    await _methodChannel.invokeMethod('trackEvent', <String, dynamic>{
      'name': name,
      'properties': properties ?? <String, String>{},
    });
  }

  /// Check whether analytics is enalbed
  static Future<bool?> isAnalyticsEnabledAsync() async {
    return await _methodChannel.invokeMethod('isAnalyticsEnabled');
  }

  /// Get appcenter installation id
  static Future<String> getInstallIdAsync() async {
    return await _methodChannel
        .invokeMethod('getInstallId')
        .then((r) => r as String);
  }

  /// Enable or disable analytics
  static Future configureAnalyticsAsync({required enabled}) async {
    await _methodChannel.invokeMethod('configureAnalytics', enabled);
  }

  /// Check whether crashes is enabled
  static Future<bool?> isCrashesEnabledAsync() async {
    return await _methodChannel.invokeMethod('isCrashesEnabled');
  }

  /// Enable or disable appcenter crash reports
  static Future configureCrashesAsync({required enabled}) async {
    await _methodChannel.invokeMethod('configureCrashes', enabled);
  }

}
