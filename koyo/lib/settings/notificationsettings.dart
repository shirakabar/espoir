import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notificationsettings {

  static Future<void> mainsettings() async {

  final messagingInstance = FirebaseMessaging.instance;
  messagingInstance.requestPermission();

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  if (Platform.isIOS) {
    await messagingInstance.requestPermission();
    // iOSでフォアグランド通知を行うための設定
    await messagingInstance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  } else if (Platform.isAndroid) {
    final androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.createNotificationChannel(
      const AndroidNotificationChannel(
        'koyo_festival76',
        '第７６回向陽祭',
        importance: Importance.max,
      ),
    );
    await androidImplementation?.requestNotificationsPermission();
  }

  // 通知設定の初期化を行う
  _initNotification();

  //final message = await FirebaseMessaging.instance.getInitialMessage();
  final fcmToken = await messagingInstance.getToken();
  debugPrint('FCM TOKEN: $fcmToken');
  }

 static Future<void> _initNotification() async {
  //final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  FirebaseMessaging.instance.subscribeToTopic('news');

  /*FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // バックグラウンド起動中に通知をタップした場合の処理
  });*/

  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    // フォアグラウンド起動中に通知が来た場合、
    // Androidは通知が表示されないため、ローカル通知として表示する
    // https://firebase.flutter.dev/docs/messaging/notifications#application-in-foreground
    if (Platform.isAndroid) {
      // プッシュ通知をローカルから表示する
      await FlutterLocalNotificationsPlugin().show(
        0,
        notification!.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'koyo_festival76',
            '第７６回向陽祭',
            importance: Importance.max, // 通知の重要度の設定
            icon: android?.smallIcon,
          ),
        ),
      );
    }
    
  });
}

  // ローカルから表示したプッシュ通知をタップした場合の処理を設定
  /*flutterLocalNotificationsPlugin.initialize(
    const InitializationSettings(
      android: AndroidInitializationSettings(
          '@drawable/koyoicon'), 
      iOS: DarwinInitializationSettings(),
    ),
    /*onDidReceiveNotificationResponse: (details) {
      if (details.payload != null) {
        final payloadMap =
            json.decode(details.payload!) as Map<String, dynamic>;
        debugPrint(payloadMap.toString());
      }
    },*/
  );*/
}