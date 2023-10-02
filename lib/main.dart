import 'package:flutter/material.dart';

import 'index.dart';

Future<void> main() async {
  await AppConfig.appConfig();
  runApp(const MyApp());
}
