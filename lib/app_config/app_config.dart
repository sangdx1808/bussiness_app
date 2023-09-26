import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../index.dart';

class AppConfig {
  static String _envConfig(String flavor) {
    switch (flavor) {
      case 'dev':
        return Assets.env.envDev;
      case 'production':
        return Assets.env.envProduction;
      default:
        return Assets.env.envDev;
    }
  }

  static Future<void> appConfig() async {
    WidgetsFlutterBinding.ensureInitialized();
    configLoading();
    final flavor = await FlavorApp.getFlavor();
    await dotenv.load(
      fileName: _envConfig(flavor ?? 'dev'),
    );
    await FirebaseConfig.fcmConfig();
    _initOrientations();
  }

  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 36
      ..radius = 8
      ..maskType = EasyLoadingMaskType.black
      ..progressColor = AppColors.primary
      ..backgroundColor = Colors.green
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static void _initOrientations() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }
}
