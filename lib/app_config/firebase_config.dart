import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  static final firebaseConfig = FCMConfig.instance;
  
  static Future fcmConfig() async {
    await firebaseConfig.init(
      onBackgroundMessage: _firebaseMessagingBackgroundHandler,
      // defaultAndroidForegroundIcon: '@mipmap/launcher_icon',
      defaultAndroidChannel: const AndroidNotificationChannel(
        'HoangMaiChung', // same as value from android setup
        'HoangMaiChung Notification',
        importance: Importance.high,
        sound: RawResourceAndroidNotificationSound('notification'),
      ),
    );

    firebaseConfig.onMessage.listen((event) {
      firebaseConfig.local.displayNotificationFrom(event);
    });
  }

  /// lấy firebase tokem
  static Future<String?> firebaseToken() {
    return firebaseConfig.messaging.getToken();
  }

  /// lấy RemoteMessage khi mở app
  static Future<RemoteMessage?> getInitialMessage() {
    return firebaseConfig.getInitialMessage(); // ;
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}
