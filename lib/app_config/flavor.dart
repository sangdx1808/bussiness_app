import 'package:flutter/services.dart';

class FlavorApp {
  static Future<String?> getFlavor() async {
    final String? flavor =
        await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
    return flavor;
  }
}