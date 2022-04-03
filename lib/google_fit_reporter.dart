import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'aggregate_type.dart';
import 'health_type.dart';
import 'history_result.dart';

class GoogleFitReporter {
  static const _methodChannel =
      MethodChannel('google_fit_reporter_method_channel');

  static Future<bool> hasPermissions(
      List<String> toRead, List<String> toWrite) async {
    final arguments = {
      'toRead': toRead,
      'toWrite': toWrite,
    };
    return await _methodChannel.invokeMethod('hasPermissions', arguments);
  }

  static Future<void> requestPermissions() async =>
      await _methodChannel.invokeMethod('requestPermissions');

  static Future<List<HistoryResult>> aggregate(
      AggregateType aggregateType, DateTime startTime, DateTime endTime) async {
    final arguments = {
      'aggregateType': aggregateType.string,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
    };
    final result = await _methodChannel.invokeMethod('aggregate', arguments);
    final List<dynamic> list = jsonDecode(result);
    final samples = <HistoryResult>[];
    for (final Map<String, dynamic> map in list) {
      final sample = HistoryResult.from(map);
      samples.add(sample);
    }
    return samples;
  }

  static Future<List<HistoryResult>> read(
      HealthType healthType, DateTime startTime, DateTime endTime) async {
    final arguments = {
      'healthType': healthType.string,
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime.millisecondsSinceEpoch,
    };
    final result = await _methodChannel.invokeMethod('read', arguments);
    final List<dynamic> list = jsonDecode(result);
    final samples = <HistoryResult>[];
    for (final Map<String, dynamic> map in list) {
      final sample = HistoryResult.from(map);
      samples.add(sample);
    }
    return samples;
  }

  // static Future<Bool> insert(InsertResult insertResult) async {
  //   final arguments = {
  //     'insertResult': insertResult.map,
  //   };
  //   return await _methodChannel.invokeMethod('insert', arguments);
  // }
  //
  // static Future<Bool> update(
  //     InsertResult insertResult, DateTime startTime, DateTime endTime) async {
  //   final arguments = {
  //     'insertResult': insertResult.map,
  //     'startTime': startTime.millisecondsSinceEpoch,
  //     'endTime': endTime.millisecondsSinceEpoch,
  //   };
  //   return await _methodChannel.invokeMethod('insert', arguments);
  // }
  //
  // static Future<Bool> delete(
  //     DetailType detailType, DateTime startTime, DateTime endTime) async {
  //   final arguments = {
  //     'detailType': detailType.string,
  //     'startTime': startTime.millisecondsSinceEpoch,
  //     'endTime': endTime.millisecondsSinceEpoch,
  //   };
  //   return await _methodChannel.invokeMethod('insert', arguments);
  // }
}
