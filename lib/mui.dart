import 'dart:async';

import 'package:flutter/services.dart';

class Mui {
  static const MethodChannel _channel =
      const MethodChannel('mui');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
