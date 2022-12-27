// SHA 1 1E:06:46:04:16:7D:6D:41:D1:5C:DA:CB:D6:2E:BC:84:D0:AB:E4:1A

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    print('onBackgroundHandler: ${message.messageId}');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    print('onMessageHandle: ${message.messageId}');
  }

  static Future<void> _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp: ${message.messageId}');
  }

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    // handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // local notifications
  }
}
