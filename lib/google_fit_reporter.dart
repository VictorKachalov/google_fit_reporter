
import 'dart:async';

import 'package:flutter/services.dart';

class GoogleFitReporter {
  static const MethodChannel _channel = MethodChannel('google_fit_reporter');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
