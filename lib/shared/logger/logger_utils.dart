import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Logger1 {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    if (kDebugMode) {
      print('** $text [$isError]');
    }
  }
}

class Xlogger {
  // var loggerNoStack = Logger(
  //   printer: PrettyPrinter(methodCount: 0),
  // );

  static void d(dynamic message) {
    Logger().d(message);
  }

  static void e(dynamic message) {
    Logger().e(message);
  }

  static void i(dynamic message) {
    Logger().i(message);
  }

  static void w(dynamic message) {
    Logger().w(message);
  }

  static void t(dynamic message) {
    Logger().t(message);
  }

  static void f(dynamic message) {
    Logger().f(message);
  }
}
