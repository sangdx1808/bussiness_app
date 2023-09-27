import 'dart:convert';

import 'package:alice/alice.dart';
import 'package:flutter/material.dart';

class AliceUtils {
  static final _singleton = AliceUtils._internal();

  factory AliceUtils() {
    return _singleton;
  }

  AliceUtils._internal() {
    _initAlice();
  }

  Alice? alice;

  GlobalKey<NavigatorState>? get getNavigatorKey => alice?.getNavigatorKey();

  void _initAlice() {
    alice = Alice(
        showInspectorOnShake: true,
        maxCallsCount: 10000,
        showNotification: false);
  }

  void addLogSocketEvent(
      {required String channel,
      required Map<String, dynamic> data,
      required bool isSend}) {
    alice?.addLog(AliceLog(
        message:
            '-----------------------------------\n${!isSend ? 'CHANNEL_RECEIVER' : 'CHANNEL_EMIT'} : =====> $channel <=====\n\n DATA: ${_getPrettyJSONString(data)}\n'));
  }

  String _getPrettyJSONString(jsonObject) {
    const encoder = JsonEncoder.withIndent("     ");
    return encoder.convert(jsonObject);
  }
}
