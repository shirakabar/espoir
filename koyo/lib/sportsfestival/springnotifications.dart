import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:koyo/data/springdata.dart';
import 'dart:io'; 
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void springnotification() {
  tz.initializeTimeZones();
  requestPermissions();
  scheduleNotifications();
}


Future<void> requestPermissions() async {
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  } else if (Platform.isAndroid) {
    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidImplementation?.requestNotificationsPermission();
  }
}

Future<void> scheduleNotifications() async {
  await flutterLocalNotificationsPlugin.cancelAll();
  tz.initializeTimeZones();
  // タイトルを「競技開始通知」に設定
  String title = '競技開始通知';
  String body = 'まもなく登録した競技が始まります';


  tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation('Asia/Tokyo'));

  // リスト内の各日時に対して通知をスケジュール
  for (var scheduledTime in notificationSelect) {
    // Timezoneを設定（例: 'Asia/Tokyo' タイムゾーン）
    tz.TZDateTime scheduledTZTime = tz.TZDateTime.from(scheduledTime, tz.getLocation('Asia/Tokyo'));
    if (scheduledTZTime.isBefore(now)) {
      continue; // 過去の日時の場合、スケジュールをスキップ
    }
    int notificationId = (scheduledTime.millisecondsSinceEpoch % 2147483647).abs(); 
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,  
        title,  
        body,  
        scheduledTZTime,  
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'your_channel_id', 
            'your_channel_name', 
            importance: Importance.high,
            priority: Priority.high,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exact,  
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime, 
      );

  }


}


