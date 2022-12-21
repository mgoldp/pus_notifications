// SHA 1 1E:06:46:04:16:7D:6D:41:D1:5C:DA:CB:D6:2E:BC:84:D0:AB:E4:1A

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async {
    // Push notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    // local notifications
  }
}
